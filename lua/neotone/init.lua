-- NeoTone: A Neovim plugin to switch themes based on system tone or user choice.
-- In art, 'tone' refers to how light or dark a color is.

---@class NeoToneConfig
---@field mode? "system" | "dark" | "light" Mode to use: system-sync, dark, or light
---@field themes? { dark: string, light: string } Themes for dark and light modes

local defaults = {
	mode = "system", -- "system", "dark", or "light"
	themes = {
		dark = "default",
		light = "default",
	},
}

local config = vim.tbl_deep_extend("force", defaults, {})

local function getAppleInterfaceStyle()
	local result = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null || echo Light")
	return vim.trim(result):lower()
end

local function setThemeBasedOnSystem()
	local mode = config.mode
	if mode == "system" then
		mode = getAppleInterfaceStyle()
	elseif mode ~= "dark" and mode ~= "light" then
		vim.notify("NeoTone: Invalid mode '" .. mode .. "', defaulting to light", vim.log.levels.WARN)
		mode = "light"
	end

	if mode == "dark" then
		vim.cmd("colorscheme " .. config.themes.dark)
		vim.cmd("set background=dark")
	else
		vim.cmd("colorscheme " .. config.themes.light)
		vim.cmd("set background=light")
	end
end

-- Public setup function to initialize NeoTone
---@param user_config? NeoToneConfig Configuration table to override defaults
local function setup(user_config)
	config = vim.tbl_deep_extend("force", defaults, user_config or {})
	if not config.themes.dark or not config.themes.light then
		error("NeoTone: Theme config missing 'dark' or 'light' key")
	end
	setThemeBasedOnSystem()
end

local function reloadTheme()
	setThemeBasedOnSystem()
	vim.notify("NeoTone: Theme reloaded", vim.log.levels.INFO)
end

vim.api.nvim_create_user_command(
	"ReloadNeoTone",
	reloadTheme,
	{ desc = "Reload the NeoTone script if appearance has changed" }
)

return {
	setup = setup,
}
