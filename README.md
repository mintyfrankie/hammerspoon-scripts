# README

分享自用 Hammerspoon 脚本。

## 使用方式

**安装 Hammerspoon**

```
brew install hammerspoon
```

**可以选择：**

**1. 将相应的 lua 脚本复制粘贴到 `~/.hammerspoon/int.lua` 文件中**

**2. 或者在 `~/.hammerspoon/int.lua` 文件中输入以下内容：**

```lua
game_info_mode = require("game_info_mode")
-- OR
vimoom_mode = require("vimoom_mode")
```

## Vimoom Window Management

涵盖以下功能：

1. Hyperkey + E 触发类似 Moom 热键形式的输入模式，随后：
    - 点击数字 1 键将窗口「全屏」
    - 点击数字 2 键将窗口放置在左半屏
    - 点击数字 3 键将窗口放置在右半屏
2. Hyperkey + H/J/K/L 将会将窗口向右/下/上/左移动「一格」
3. Hyperkey + Shift + H/J/K/L 会将窗口放大/缩小

## Game Info Mode

**通过热键触发游戏辅助台模式，可在脚本中自定义快捷键。**

解决思路：通过快捷键将笔记本屏幕设置为主要屏幕，外接显示器镜像笔记本屏幕，并将音频输出改为内置扬声器。
