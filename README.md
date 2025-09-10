<div align="center">
  <img src="https://img.shields.io/badge/FiveM-1.0.0-blue" alt="FiveM Version">
  <img src="https://img.shields.io/badge/License-MIT-green" alt="License">
  <br>
  <h1>AOP-JRP</h1>
  <p><strong>Enhanced Area of Play (AOP) and Priority Management Script for FiveM</strong></p>
  <p>Specifically designed for JRP (Justice Roleplay) servers. Manage in-game priorities and AOP dynamically with improved visuals and optimizations.</p>
  <br>
  <a href="https://github.com/fivemJRP/TimeAndDateDisplay-JRP"><img src="https://img.shields.io/github/stars/fivemJRP/TimeAndDateDisplay-JRP?style=social" alt="GitHub Stars"></a>
  <a href="https://discord.gg/JRP"><img src="https://img.shields.io/discord/1234567890?label=JGN%20Network" alt="Discord"></a>
  <br>
  <a href="https://discord.gg/JRP">💬 Join JGN Network Discord</a> | <a href="https://justicerp.xyz">🌐 Visit JGN Network</a>
</div>

## ✨ Features

- **Dynamic AOP Management**: Set and update the Area of Play in real-time.
- **Priority System**: Manage priorities for regions (City, Blaine, Global) with statuses like Cooldown, Hold, In Progress, Pending, and Reset.
- **Visual Enhancements**: Semi-transparent backgrounds, color-coded text (green for priorities, blue for AOP), and unified rendering.
- **Discord Logging**: Automatic logging of changes to a Discord webhook for monitoring.
- **Optimized Performance**: Localized functions, efficient string handling, and modern Lua 5.4 practices.
- **Debug Mode**: Optional debug mode to remove permission requirements for testing.

## 🔄 Optimizations and Improvements

### Before
- Basic AOP and priority management with simple text rendering.
- Redundant code in rendering functions.
- Older header information and branding.
- Potential bugs in timer and chat suggestions.

### After
- Rebranded to AOP-JRP with updated headers and consistent branding.
- Added semi-transparent black backgrounds for better contrast and visual appeal.
- Unified rendering functions to reduce redundancy and improve maintainability.
- Color-coded text: green for priorities, blue for AOP.
- Optimized code with local functions, string.format for efficiency, and proper error handling.
- Updated to latest FiveM standards (fx_version 'cerulean', lua54 'yes').
- Improved config structure with better comments, formatting, and organization.
- Enhanced Discord logging with formatted messages and error checks.
- Fixed bugs: Corrected timer decrementing, chat suggestion regions, and function call orders.
- Added comprehensive README with installation, usage, and credits.

## 📦 Installation

1. Download or clone this repository into your FiveM resources folder.
2. Ensure the resource is named `AOP-JRP`.
3. Add `ensure AOP-JRP` to your `server.cfg`.
4. Configure the webhook URL in `server/sv_aop.lua` if needed.
5. Restart your server.

## 🚀 Usage

### Commands
- `/aop <area>`: Set the Area of Play (e.g., `/aop Blaine County`).
- `/setpriority <region> <status> [notes]`: Set priority for a region (e.g., `/setpriority City InProgress Emergency`).
- `/setp <region> <status> [notes]`: Shorthand for setpriority.

### Regions
- City
- Blaine (maps to County)
- Global (affects all regions)

### Statuses
- Cooldown (with time-based messages)
- Hold
- InProgress
- Pending
- Reset

## ⚙️ Configuration

Edit `sh_config.lua` to customize:
- Regions and statuses.
- Default values.
- Debug mode.

## 🔐 Permissions

The script uses FiveM's ACE permission system for commands when `CONFIG.DEBUG = false` (default). Commands are restricted and require appropriate permissions.

### Setting Permissions
Add the following to your `server.cfg`:
- For a specific player: `add_ace identifier.steam:STEAMID command.aop allow`
- For a group: `add_ace group.admin command.setpriority allow`
- For all commands: `add_ace group.admin command.* allow`

Replace `STEAMID` with the player's Steam ID and `group.admin` with your desired group. If `CONFIG.DEBUG = true`, no permissions are required.

For more on ACE permissions, check the [FiveM Docs](https://docs.fivem.net/docs/server-manual/setting-up-a-server/#permissions).

## 📋 Dependencies

- None (uses built-in FiveM natives).

## 🙏 Credits

- Original script by aSocket LLC.
- Rebranded and optimized by JGN Network developer team.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
