local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section
gl.short_line_list = {"packer", "CHADTREE", "LuaTree", "packager", "Floaterm", "coc-eplorer"}

local ayu_colors = {
  bg = "#fafafa",
  fg = "#5c6773",
  line_bg = "#fafafa", yellow = "#ffc94a",
  cyan = "#4dbf99",
  darkblue = "#41a6d9",
  green = "#86b300",
  orange = "#f29718",
  purple = "#a37acc",
  magenta = "#f07178",
  grey = "#5c6773",
  blue = "#73d8ff",
  red = "#ff3333",
}

local one_dark_colors = {
  bg = "#2e3440",
  fg = "#81a1c1",
  line_bg = "#2e3440",
  fg_green = "#6d96a5",
  yellow = "#fabd2f",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#608B4E",
  orange = "#FF8800",
  purple = "#5d4d7a",
  magenta = "#d16d9e",
  grey = "#c0c0c0",
  blue = "#569CD6",
  red = "#D16969"
}

local nord_colors = {
  bg = "#2E3440",
  fg = "#81A1C1",
  line_bg = "#2E3440",
  fg_green = "#8FBCBB",
  yellow = "#EBCB8B",
  cyan = "#A3BE8C",
  darkblue = "#81A1C1",
  green = "#8FBCBB",
  orange = "#D08770",
  purple = "#B48EAD",
  magenta = "#BF616A",
  gray = "#616E88",
  blue = "#5E81AC",
  red = "#BF616A"
}

local buffer_not_empty = function()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

section.left[1] = {
  FirstElement = {
    -- provider = function() return '▊ ' end,
    provider = function()
      return "  "
    end,
    highlight = {ayu_colors.blue, ayu_colors.line_bg}
  }
}
section.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = ayu_colors.magenta,
        i = ayu_colors.green,
        v = ayu_colors.blue,
        [""] = ayu_colors.blue,
        V = ayu_colors.blue,
        c = ayu_colors.red,
        no = ayu_colors.magenta,
        s = ayu_colors.orange,
        S = ayu_colors.orange,
        [""] = ayu_colors.orange,
        ic = ayu_colors.yellow,
        R = ayu_colors.purple,
        Rv = ayu_colors.purple,
        cv = ayu_colors.red,
        ce = ayu_colors.red,
        r = ayu_colors.cyan,
        rm = ayu_colors.cyan,
        ["r?"] = ayu_colors.cyan,
        ["!"] = ayu_colors.red,
        t = ayu_colors.red
      }
      cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
      return "  "
    end,
    highlight = {ayu_colors.red, ayu_colors.line_bg, "bold"}
  }
}
section.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, ayu_colors.line_bg}
  }
}
section.left[4] = {
  FileName = {
    -- provider = "FileName",
    provider = function()
      return fn.expand("%:F")
    end,
    condition = buffer_not_empty,
    separator = " ",
    separator_highlight = {ayu_colors.purple, ayu_colors.bg},
    highlight = {ayu_colors.purple, ayu_colors.line_bg, "bold"}
  }
}

section.right[1] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {ayu_colors.orange, ayu_colors.line_bg}
  }
}
section.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    separator = "",
    separator_highlight = {ayu_colors.purple, ayu_colors.bg},
    highlight = {ayu_colors.orange, ayu_colors.line_bg, "bold"}
  }
}

local checkwidth = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

section.right[3] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = " ",
    highlight = {ayu_colors.green, ayu_colors.line_bg}
  }
}
section.right[4] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = "柳",
    highlight = {ayu_colors.yellow, ayu_colors.line_bg}
  }
}
section.right[5] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {ayu_colors.red, ayu_colors.line_bg}
  }
}

section.right[6] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    separator = " ",
    icon = " ",
    highlight = {ayu_colors.red, ayu_colors.line_bg},
    separator_highlight = {ayu_colors.bg, ayu_colors.bg}
  }
}
section.right[7] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    -- separator = " ",
    icon = " ",
    highlight = {ayu_colors.yellow, ayu_colors.line_bg},
    separator_highlight = {ayu_colors.bg, ayu_colors.bg}
  }
}

section.right[8] = {
  DiagnosticInfo = {
    -- separator = " ",
    provider = "DiagnosticInfo",
    icon = " ",
    highlight = {ayu_colors.green, ayu_colors.line_bg},
    separator_highlight = {ayu_colors.bg, ayu_colors.bg}
  }
}

section.right[9] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    -- separator = " ",
    icon = " ",
    highlight = {ayu_colors.blue, ayu_colors.line_bg},
    separator_highlight = {ayu_colors.bg, ayu_colors.bg}
  }
}

section.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',ayu_colors.bg},
    highlight = {ayu_colors.blue,ayu_colors.bg,'bold'}
  }
}

section.short_line_left[2] = {
  SFileName = {
    provider = function ()
      local fileinfo = require('galaxyline.provider_fileinfo')
      local fname = fileinfo.get_current_file_name()
      for _,v in ipairs(gl.short_line_list) do
        if v == vim.bo.filetype then
          return ''
        end
      end
      return fname
    end,
    condition = buffer_not_empty,
    highlight = {ayu_colors.white,ayu_colors.bg,'bold'}
  }
}

section.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {ayu_colors.fg,ayu_colors.bg}
  }
}
