# 🎮 AOP-JRP

<span style="color: #4CAF50;">AOP-JRP</span> is an enhanced <span style="color: #FF9800;">Area of Play (AOP)</span> and <span style="color: #2196F3;">Priority Management</span> script for FiveM, specifically designed for JRP (Justice Roleplay) servers. This script allows administrators to manage in-game priorities and AOP dynamically, with improved visuals and optimizations. 🚀

## ✨ Features

- **🌍 Dynamic AOP Management**: Set and update the Area of Play in real-time.
- **⚡ Priority System**: Manage priorities for different regions (City, Blaine, Global) with statuses like Cooldown, Hold, In Progress, Pending, and Reset.
- **🎨 Visual Enhancements**: Semi-transparent backgrounds, color-coded text (<span style="color: green;">green for priorities</span>, <span style="color: blue;">blue for AOP</span>), and unified rendering for a cooler look.
- **📢 Discord Logging**: Automatic logging of changes to a Discord webhook for monitoring. 🔗
- **🔧 Optimized Performance**: Localized functions, efficient string handling, and modern Lua 5.4 practices.
- **🐛 Debug Mode**: Optional debug mode to remove permission requirements for testing.

## 🔄 Improvements

### ❌ Before
- Basic AOP and priority management.
- Simple text rendering without backgrounds.
- Redundant code in rendering functions.
- Older header information and branding.

### ✅ After
- Rebranded to AOP-JRP with updated headers. 🏷️
- Added semi-transparent black backgrounds for better contrast. 🖤
- Unified rendering functions to reduce redundancy. 🔄
- Changed priority text to <span style="color: green;">green</span> and AOP to <span style="color: blue;">blue</span> for visual appeal. 🎨
- Optimized code with local functions and string.format for efficiency. ⚡
- Updated to latest FiveM standards (fx_version 'cerulean', lua54 'yes'). 📈
- Improved config structure with better comments and formatting. 📝
- Enhanced Discord logging with formatted messages. 📢

## 📦 Installation

1. 📥 Download or clone this repository into your FiveM resources folder.
2. 📁 Ensure the resource is named `AOP-JRP`.
3. ⚙️ Add `ensure AOP-JRP` to your `server.cfg`.
4. 🔗 Configure the webhook URL in `server/sv_aop.lua` if needed.
5. 🔄 Restart your server.

## 🚀 Usage

### 💬 Commands
- `/aop <area>`: Set the Area of Play (e.g., `/aop Blaine County`). 🌍
- `/setpriority <region> <status> [notes]`: Set priority for a region (e.g., `/setpriority City InProgress Emergency`). ⚡
- `/setp <region> <status> [notes]`: Shorthand for setpriority. 🔧

### 🗺️ Regions
- 🏙️ City
- 🌾 Blaine (maps to County)
- 🌐 Global (affects all regions)

### 📊 Statuses
- ⏳ Cooldown (with time-based messages)
- ⏸️ Hold
- ▶️ InProgress
- ⏳ Pending
- 🔄 Reset

## ⚙️ Configuration

Edit `sh_config.lua` to customize: 🔧
- Regions and statuses.
- Default values.
- Debug mode.

## 📋 Dependencies

- None (uses built-in FiveM natives). ✅

## 🙏 Credits

- Original script by aSocket LLC. 👥
- Rebranded and optimized by JGN Network developer team. 🛠️

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details. 📜
