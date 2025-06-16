local config = function()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")

  -- Absolutely unhinged custom ASCII art
  dashboard.section.header.val = {
    [[                                                                         ]],
    [[                       ╭──────────────────────╮                          ]],
    [[                       │ ⚡ TERMINAL WIZARD ⚡│                          ]],
    [[                       ╰──────────────────────╯                          ]],
    [[                                                                        ]],
    [[                                  ^                    ]],
    [[                                 / \                   ]],
    [[              L L               /   \               L L]],
    [[           __/|/|_             /  .  \             _|\|\__]],
    [[          /_| [_[_\           /     .-\           /_]_] |_\]],
    [[         /__\  __`-\_____    /    .    \    _____/-`__  /__\]],
    [[        /___] /=@>  _   {>  /-.         \  <}   _  <@=\ [___\]],
    [[       /____/     /` `--/  /      .      \  \--` `\     \____\]],
    [[      /____/  \____/`-._> /               \ <_.-`\____/  \____\]],
    [[     /____/    /__/      /-._     .   _.-  \      \__\    \____\]],
    [[    /____/    /__/      /         .         \      \__\    \____\]],
    [[   |____/_  _/__/      /          .          \      \__\_  _\____|]],
    [[    \__/_ ``_|_/      /      -._  .        _.-\      \_|_`` _\___/]],
    [[      /__`-`__\      <_         `-;           _>      /__`-`__\]],
    [[         `-`           `-._       ;       _.-`           `-`]],
    [[                           `-._   ;   _.-`]],
    [[                               `-._.-`]],
  }

  -- Absolutely unhinged menu options
  dashboard.section.buttons.val = {
    dashboard.button("f", "🔥 Find Files (skill issue if you can't)", "<cmd>lua require('fzf-lua').files()<CR>"),
    dashboard.button("g", "🚀 Live Grep (grep or get rekt)", "<cmd>lua require('fzf-lua').live_grep()<CR>"),
    dashboard.button("c", "⚙️  Config (tweak till it breaks)", "<cmd>edit $MYVIMRC<CR>"),
    dashboard.button("l", "📦 Lazy (package manager supremacy)", "<cmd>Lazy<CR>"),
    dashboard.button("m", "🔧 Mason (LSP goes brrr)", "<cmd>Mason<CR>"),
    dashboard.button("q", "🚪 Quit (touch grass maybe?)", "<cmd>qa<CR>"),
  }

  -- Absolutely unhinged footer
  local function get_footer()
    local total_plugins = #vim.tbl_keys(require("lazy").plugins())
    local datetime = os.date("%H:%M:%S")

    local messages = {
      "NVIM SUPREMACY 🔥",
      "VSCode users seething 😤",
      "Emacs? More like Emacsn't 💀",
      "Your editor could never 💪",
      "Built different 😎",
      "Skill issue if you use anything else 🤡",
      "This config goes HARD 🔥",
      "Normie editors stay mad 😂",
      "Based and vim-pilled 💊"
    }

    local random_msg = messages[math.random(#messages)]

    return {
      "⚡ " .. total_plugins .. " plugins loaded | " .. datetime,
      random_msg,
      "────────────────────────────",
      "Powered by pure autism and caffeine ☕"
    }
  end

  dashboard.section.footer.val = get_footer()

  -- Layout
  dashboard.config.layout = {
    { type = "padding", val = 1 },
    dashboard.section.header,
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    { type = "padding", val = 2 },
    dashboard.section.footer,
  }

  -- Absolutely unhinged colors
  dashboard.section.header.opts.hl = "RageBaitHeader"
  dashboard.section.buttons.opts.hl = "RageBaitButtons"
  dashboard.section.footer.opts.hl = "RageBaitFooter"

  -- Define the most based highlight groups
  vim.api.nvim_set_hl(0, "RageBaitHeader", { fg = "#8b9dc3", bold = true })
  vim.api.nvim_set_hl(0, "RageBaitButtons", { fg = "#dca561", bold = true })
  vim.api.nvim_set_hl(0, "RageBaitFooter", { fg = "#a3be8c", italic = true })
  -- Clean up UI like a pro
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
      vim.opt_local.laststatus = 0
      vim.opt_local.showtabline = 0
      vim.opt_local.cmdheight = 0
      vim.opt_local.cursorline = false

      vim.api.nvim_create_autocmd("BufUnload", {
        buffer = 0,
        once = true,
        callback = function()
          vim.o.laststatus = 3
          vim.o.showtabline = 2
          vim.o.cmdheight = 1
        end,
      })
    end,
  })

  -- Update footer every 10 seconds to keep the rage fresh
  local timer = vim.loop.new_timer()
  if timer then
    timer:start(10000, 10000, vim.schedule_wrap(function()
      if vim.bo.filetype == "alpha" then
        dashboard.section.footer.val = get_footer()
        vim.cmd("AlphaRedraw")
      end
    end))
  end

  alpha.setup(dashboard.config)
end

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = config,
}
