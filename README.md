# Megaphone Script for Fivem

## Functions

1. **Megaphone Menu**
   - Simple menu with the help of the ox-menu.

2. **Vehcile Whitelist**
   - The menu is only accessable in a whitelisted vehicle.

3. **Job Whitelist**
   - The menu is only accessable in a whitelisted job.

4. **Minigame for non-whitelisted players**
   - Non-whitelisted players have to do a minigame to gain access to the menu.

5. **Framework**
    - Works fine with ESX and Qb. You can use it standalone too. Warning if you use it standalone the whitelist may not work.

## Requirements

- [xsound](https://github.com/xsound/xsound)
- [ox_lib](https://github.com/overextended/ox_lib)

## Installation

1. **Download the script**
   - Clone or download the repository to your server.

2. **Place it into the right folder**
   - Unzip the files and place it in the `resources` folder.

3. **Add to the cfg**
   - Ensure or start the resource and add to the server.cfg.

4. **Configure the script**
   - In the `shared/main.lua` you can configure the following things:
     - Whitelist for vehciles and jobs.
     - Volume and distance of the sounds.
     - You can place your own sounds.

5. **Place the sounds at the right place**
   - Navigate to the `xsound/html/sounds` folder, then paste the sounds into the folder. (You can paste all 60 of them, or just the used ones)

6. **Restart the server**
   - Restart your fivem server.

## Usage

- **Access the menu**
  - Use the keybind or the command.
    - Default keybind: `O`
    - Default command: `/megaphone` 

## Preview Video
- [Video](https://youtu.be/NjiCi0pUAl0)
- [Our Discord Server](https://discord.gg/cgQMXEBDuR)
