# HamClock for Ham Radio Enthusiasts

Welcome to an easy way to enjoy [HamClock](https://www.clearskyinstitute.com/ham/HamClock/) on your Windows computer! HamClock is a fantastic digital clock and world map designed for ham radio operators like you. It displays the time, solar conditions, and other helpful details for your radio hobby, all in your web browser. This setup makes running HamClock simple with just a few clicks, perfect for hams who want to focus on radio, not computer details.

I've included two special files to start and stop HamClock, so you don’t need to worry about complicated setups. This setup uses a tool called Docker to run HamClock smoothly. A big thank you to the folks at [ChrisRomp/hamclock-docker](https://github.com/ChrisRomp/hamclock-docker) for their amazing work in creating the HamClock Docker package that this setup is based on!

## What’s Included
- **`start.bat`**: This file checks if Docker (the tool that runs HamClock) is installed and running, starts HamClock, and opens it in your web browser (like Microsoft Edge, Chrome, or Firefox). If Docker isn’t installed, it opens the Docker download page and guides you to install it.
- **`stop.bat`**: This file turns off HamClock when you’re done. Stopping HamClock saves your computer’s battery and power, which is great if you’re not using it for a while or want your computer to run other programs faster.
- **`Dockerfile`** and **`docker-compose.yml`**: These files tell Docker how to run HamClock. You don’t need to touch them—they work quietly in the background.
- **`LICENSE.txt`**: A file that explains the rules for using this setup. It’s based on the MIT License, which means you can use it freely for personal use.
- **`README.md`**: This guide you’re reading now!

## What You Need
- A Windows computer (Windows 10 or 11, 64-bit version). Most modern computers are 64-bit.
- An internet connection to download the HamClock setup, Docker Desktop, and HamClock files.
- At least 8GB of memory (RAM) on your computer to keep things running smoothly.
- A web browser (your computer’s default browser, like Microsoft Edge, works perfectly).
- Docker Desktop installed (don’t worry, the `start.bat` script will help you get it if it’s not already on your computer).

**Good News**: HamClock and this setup are free for personal use, so you can enjoy it at no cost!

## How to Get Started

### Step 1: Download the Files
1. Click this link to download the HamClock setup: [Download HamClock Setup](https://github.com/temetvince/hamclock/archive/refs/heads/main.zip).
2. Save the `main.zip` file somewhere easy to find, like your Desktop or Downloads folder.
3. Double-click `main.zip` to open it, then drag the `hamclock-main` folder to your Desktop or another convenient spot.
4. Open the `hamclock-main` folder. You’ll see the files listed above.

### Step 2: Start HamClock
1. Inside the `hamclock-main` folder, find `start.bat` and double-click it.
2. **First Time Setup**:
   - The script checks if Docker Desktop is installed. If it’s not, it will:
     - Open your web browser to the Docker Desktop download page (`https://www.docker.com/products/docker-desktop/`).
     - Show a message asking you to download and install Docker Desktop, then pause so you can read it.
     - After installing Docker Desktop, double-click `start.bat` again.
   - If Docker is installed but not running, the script will start it for you. This may take a moment (up to a minute or two).
   - The first time you run HamClock, Docker builds it, which can take **5–10 minutes** depending on your computer’s speed. Be patient—it only happens once!
3. The script starts HamClock and checks if it’s running. If everything is ready, it opens your web browser to `http://localhost:8081/live.html`, where you’ll see the HamClock display. If HamClock isn’t ready yet, it shows a message asking you to check the setup.

### Step 3: Install Docker Desktop (If Needed)
If the script opens a webpage asking you to download Docker Desktop, follow these steps:
1. On the Docker website, click the **Download for Windows** button and save the installer (e.g., `Docker Desktop Installer.exe`).
2. Double-click the installer and follow the instructions. You may need to:
   - Enable WSL 2 (a helper tool for Docker) when prompted. Just click “Yes” or “OK” to allow it.
   - Restart your computer if asked.
3. Double-click `start.bat` again to continue setting up HamClock.

If this feels tricky, ask a friend or family member to help with the installation. Once Docker is installed, `start.bat` will handle the rest!

### Step 4: Enjoy HamClock
- HamClock will appear in your browser, showing a clock, world map, and ham radio details like solar conditions or propagation.
- You can set it up with your call sign or location in the web interface, and your settings will be saved for next time.
- Keep the browser open to use HamClock. If you close the browser, HamClock keeps running in the background, ready for you to open again.

### Step 5: Stop HamClock When You’re Done
- When you’re finished with HamClock (like at the end of the day or to save power), double-click `stop.bat` in the `hamclock-main` folder.
- This turns off HamClock, like switching off your radio when you’re not using it. It saves your computer’s battery (great for laptops) and frees up memory so other programs run faster.
- Your HamClock settings are saved, so everything will be just as you left it when you start again.

## Why Is There a Stop File?
The `stop.bat` file lets you turn off HamClock when you don’t need it. When HamClock is running, it uses a bit of your computer’s power and memory, kind of like leaving a light on. Stopping it with `stop.bat` helps:
- Save battery life on a laptop.
- Make your computer run faster for other tasks, like email or browsing.
- Keep things tidy, so HamClock only runs when you want it.

You don’t need to stop HamClock every time, but it’s a good idea at the end of the day or if your computer feels slow.

## Changing the HamClock Size (Resolution)
HamClock can display in different sizes to fit your screen or preference. The default size is 2400x1440 (good for sharp looking graphics), but you can change it to:
- 800x480 (smaller, good for small screens or tablets).
- 1600x960 (medium size, good for most monitors).
- 2400x1440 (larger, for big monitors).
- 3200x1920 (very large, for high-resolution screens).

To change the size:
1. Open the `hamclock-main` folder and find `docker-compose.yml`.
2. Right-click `docker-compose.yml` and open it with Notepad.
3. Look for the line that says `HAMCLOCK_RESOLUTION: 2400x1440` (it’s near the top).
4. Change `2400x1440` to one of the other sizes (e.g., `800x480`, `1600x960`, or `3200x1920`). Type it exactly as shown.
5. Save the file (click **File** > **Save** in Notepad) and close Notepad.
6. Double-click `stop.bat` to turn off HamClock (if it’s running).
7. Double-click `start.bat` to start HamClock with the new size. It may take **5–10 minutes** to rebuild HamClock with the new size, just like the first setup.
8. The HamClock window in your browser will now show the new size.

## License
This setup is provided under the MIT License, which means you can use it freely for personal use. The `LICENSE.txt` file in the `hamclock-main` folder includes copyright notices for Chris Romp (for the Docker setup) and Emmett Casey (for the Windows scripts and instructions). The HamClock software itself is subject to its own licensing terms, as noted on the [HamClock website](https://www.clearskyinstitute.com/ham/HamClock/).

## Thank You
A heartfelt thank you to the team at [ChrisRomp/hamclock-docker](https://github.com/ChrisRomp/hamclock-docker) for building the HamClock Docker package that this setup is based on. Their hard work makes it possible for us to enjoy HamClock with just a few clicks. I'm so grateful for their contribution to the ham radio community!

Happy hamming, and enjoy your HamClock!
