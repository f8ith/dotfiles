import os 
import shelve
import atexit
import click
from git import repo

carton_dir = os.getenv("HOME") + "/.local/share/carton"

try:
    cartonfile = shelve.open(carton_dir + "/Cartonfile")
except Exception:
    os.makedirs(carton_dir)
finally:
    cartonfile = shelve.open(carton_dir + "/Cartonfile")

carton_dir = os.getenv("HOME") + "/.carton"

def cleanup():
  cartonfile.close()
      
def download():

atexit.register(cleanup)

@click.group()
def cli():
    pass

@cli.command()
def install():
    print("i")

if __name__ == "__main__":
    cli()
