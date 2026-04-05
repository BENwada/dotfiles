local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Kanagawa (Gogh)"

config.automatically_reload_config = true
config.font_size = 14.0
config.line_height = 1.1
config.use_ime = true
config.window_background_opacity = 0.75
config.macos_window_background_blur = 10
config.font = wezterm.font_with_fallback({
	"Fira Code", -- 1. 英数字とリガチャ用（メイン）
	"PlemolJP NF", -- 2. 日本語用（第一候補）
	"Cica", -- 3. 記号や予備の日本語用
})
config.initial_cols = 120
config.initial_rows = 40

----------------------------------------------------
-- Tab & Status Line 設定
----------------------------------------------------
config.tab_bar_at_bottom = true -- [2, 3]
config.use_fancy_tab_bar = false -- [2-4]
config.tab_max_width = 24 -- [3]
config.window_decorations = "RESIZE"
config.show_tabs_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.status_update_interval = 1000 -- [5]

-- タブバー周辺の透過設定
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

-- 背景色（透過の背後の色）
config.window_background_gradient = {
	colors = { "#000000" },
}

-- タブバー全体の背景を透過
config.colors = {
	tab_bar = {
		background = "none",
		inactive_tab_edge = "none",
	},
}

config.use_resize_increments = true

-- 装飾用アイコン（三角形）
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

----------------------------------------------------
-- 左側（ユーザー名）と右側（ホスト名）の表示
----------------------------------------------------
-- 右側が表示されない問題を解決するため update-status 内で一括設定
wezterm.on("update-status", function(window, pane) -- [6]
	-- 背景色と文字色の定義（タブのデザインと合わせると統一感が出ます）
	local bg_color = "#333366"
	local fg_color = "#F2F2CE"

	-- 左側: ユーザー名 (右側に三角形)
	local user = os.getenv("USER") or "unknown"
	window:set_left_status(wezterm.format({
		{ Background = { Color = bg_color } },
		{ Foreground = { Color = fg_color } },
		{ Text = " " .. user .. " " },
		{ Background = { Color = "none" } },
		{ Foreground = { Color = bg_color } },
		{ Text = SOLID_RIGHT_ARROW },
	}))

	-- 右側: ホスト名 (左側に三角形)
	local hostname = wezterm.hostname()
	window:set_right_status(wezterm.format({
		{ Background = { Color = "none" } },
		{ Foreground = { Color = bg_color } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = bg_color } },
		{ Foreground = { Color = fg_color } },
		{ Text = " " .. hostname .. " " },
	}))
end)

----------------------------------------------------
-- 中央（タブ）のデザインとディレクトリ名表示
----------------------------------------------------
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width) -- [6]
	-- 現在のディレクトリ名を取得するロジック
	local cwd_uri = tab.active_pane.current_working_dir
	local display_title = "unknown"
	if cwd_uri then
		local path = cwd_uri.file_path
		-- パスから最後のディレクトリ名のみを抽出
		display_title = path:gsub("(.*[/\\])(.*)", "%2")
		if path == wezterm.home_dir then
			display_title = "~"
		end
	end

	-- アイコンを削除し、純粋なテキストのみの幅で計算
	local edge_width = 8
	local title = wezterm.truncate_right(display_title, max_width - edge_width) -- [1]
	local final_title = "  " .. title .. "  "

	-- 色の設定
	local background = "#22262B"
	local foreground = "#F2F2CE"
	if tab.is_active then
		background = "#4A4A40"
		foreground = "#F2F2CE"
	end

	return {
		{ Background = { Color = "none" } },
		{ Foreground = { Color = background } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = final_title },
		{ Background = { Color = "none" } },
		{ Foreground = { Color = background } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

----------------------------------------------------
-- キーバインド設定（外部ファイル）
----------------------------------------------------
require("keybinds").setup(config)

return config
