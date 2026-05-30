local wezterm = require('wezterm')
local platform = require('utils.platform')

local font_family = 'Maple Mono NF CN'

local font_size = platform.is_mac and 12 or 9.75

---@type Config
return {
   -- 📐 基础排版参数
   font = wezterm.font_with_fallback({
      { family = font_family, weight = 'Medium' },
      'PingFang SC', -- macOS 原生中文
      'Noto Sans CJK SC', -- 开源高质量中文备用
      'SF Mono', -- macOS 系统等宽备用
   }),
   font_size = font_size,
   line_height = 1.2, -- 行高（1.0~1.3 可调）
   cell_width = 1.0, -- 字符宽度（0.9~1.0 可调）

   -- 🔗 强制开启连字（Ligatures）
   harfbuzz_features = { 'calt', 'liga', 'clig', 'dlig' },
   enable_kitty_graphics = true, -- 支持图片/Unicode 块

   --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
   freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
