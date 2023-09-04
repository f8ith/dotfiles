import logging
import os
import sys
import concurrent.futures
import base64
from bs4 import BeautifulSoup
from numpy import less
import requests

sys.path.insert(1, os.path.join(os.environ["HOME"], ".config/beacon-dl"))

import config


def get_video_url(lesson_number):
    with requests.Session() as s:

        login_page = BeautifulSoup(
            s.get("https://studentportal.beacon.com.hk/login/").content, "html.parser"
        )

        csrf_token = login_page.find(attrs={"name": "csrf-token"})["content"]  # type: ignore

        s.post(
            "https://studentportal.beacon.com.hk/login",
            data={
                "_token": csrf_token,
                "email": config.EMAIL,
                "password": config.PASSWORD,
            },
        )

        additionalClass = BeautifulSoup(
            s.get("https://studentportal.beacon.com.hk/additionalClass").content,
            "html.parser",
        )

        s.get(additionalClass.iframe["src"])  # type: ignore
        s.get(f"https://www.beacon.com.hk/materials/main/login/{lesson_number}")
        video_page = s.get(
            "https://www.beacon.com.hk/materials/main/materialContent.php",
        ).text
        video_element = (
            base64.b64decode(
                video_page.partition('$(".videocontent").html(atob(\'')[2].partition(
                    "'));"
                )[0]
            )
        ).decode("utf-8")
        link = video_element.partition('<source src="')[2].split('"')[0]

        return link


def download_video(url):
    local_filename = os.path.join(
        config.DOWNLOAD_DIR, (url.split("/")[-1]).split("?")[0]
    )
    with requests.get(
        url,
        stream=True,
        headers={
            "Accept": "video/webm,video/ogg,video/*;q=0.9,application/ogg;q=0.7,audio/*;q=0.6,*/*;q=0.5",
            "Accept-Language": "en-US,en;q=0.5",
            "Range": "bytes=0-",
            "DNT": "1",
            "Connection": "keep-alive",
            "Referer": "https://www.beacon.com.hk/",
            "Sec-Fetch-Dest": "video",
            "Sec-Fetch-Mode": "no-cors",
            "Sec-Fetch-Site": "cross-site",
            "Sec-GPC": "1",
        },
    ) as r:
        r.raise_for_status()
        with open(local_filename, "wb") as f:
            for chunk in r.iter_content(chunk_size=8192):
                f.write(chunk)
    return local_filename


if __name__ == "__main__":
    urls = []
    with concurrent.futures.ThreadPoolExecutor(
        max_workers=config.MAX_WORKERS
    ) as executor:
        future_to_url = {
            executor.submit(get_video_url, id): id for id in config.ID_LIST
        }
        for future in concurrent.futures.as_completed(future_to_url):
            id = future_to_url[future]
            try:
                urls.append(future.result())
            except Exception as exc:
                logging.error("%r generated an exception: %s" % (id, exc))

    with concurrent.futures.ThreadPoolExecutor(
        max_workers=config.MAX_WORKERS
    ) as executor:
        future_to_url = {executor.submit(download_video, url): url for url in urls}
        for future in concurrent.futures.as_completed(future_to_url):
            url = future_to_url[future]
            try:
                logging.info(f"Downloaded to {future.result()}.")
            except Exception as exc:
                logging.error("%r generated an exception: %s" % (url, exc))
