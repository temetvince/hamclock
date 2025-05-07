# HamClock for Ham Radio Enthusiasts

Welcome to an easy way to enjoy [HamClock](https://www.clearskyinstitute.com/ham/HamClock/) on your Windows computer! HamClock is a beautiful digital clock and world map designed for ham radio operators like you. It shows the time, solar conditions, and other helpful information for your radio hobby, all in a web browser.

This folder contains everything you need to set up and run HamClock using a tool called Docker, which makes it simple to use on your computer. We’ve included two special files to make starting and stopping HamClock as easy as a double-click. This setup is based on the wonderful work by the team at [ChrisRomp/hamclock-docker](https://github.com/ChrisRomp/hamclock-docker), and we’re very grateful for their efforts in bringing HamClock to Docker!

## What’s Included
- **`start.bat`**: This file sets up your computer to run HamClock and opens it in your web browser (like Chrome, Edge, or Firefox). It does everything for you, whether it’s your first time or you’re just starting HamClock for the day.
- **`stop.bat`**: This file turns off HamClock when you’re done using it. Stopping HamClock saves your computer’s resources (like battery or processing power), especially if you’re not using it for a while or want to free up your computer for other tasks.
- **`docker-compose.yml`**: A small file that tells Docker how to run HamClock. You don’t need to worry about this—it just works behind the scenes.
- **`readme.md`**: This guide you’re reading now!

## What You Need
- A Windows computer (Windows 10 or 11, 64-bit version).
- An internet connection to download the setup files and HamClock.
- About 8GB of memory (RAM) on your computer to keep things running smoothly.
- A web browser (your computer’s default browser, like Microsoft Edge, will work fine).

**Good News**: HamClock and this setup are free for personal use, so you can enjoy it without any cost!

## How to Get Started

### Step 1: Download the Files
1. Click this link to download the HamClock setup: [Download HamClock Setup](https://github.com/temetvince/hamclock/archive/refs/heads/main.zip).
2. Save the `main.zip` file to a place you can find, like your Desktop or Downloads folder.
3. Double-click the `main.zip` file to open it, then drag the `hamclock-main` folder to your Desktop or another easy-to-find spot.
4. Open the `hamclock-main` folder. You’ll see the files listed above.

### Step 2: Start HamClock
1. Inside the `hamclock-main` folder, find `start.bat`.
2. **First Time Only**:
   - Right-click `start.bat` and choose **Run as administrator**. This is important because it needs permission to set up your computer.
   - The script will check if your computer has Docker (the tool that runs HamClock). If Docker isn’t installed, it will:
     - Make sure your computer is ready (it needs to be a 64-bit system).
     - Set up a helper tool called WSL 2 (don’t worry about the name—it’s just part of the setup).
     - Download and install Docker Desktop.
     - Ask you to restart your computer. After restarting, double-click `start.bat` again (no need for administrator this time unless prompted).
3. The script will start HamClock and open your web browser to `http://localhost:8081/live.html`, where you’ll see the HamClock display.
4. **Next Time**:
   - Just double-click `start.bat`. If HamClock isn’t running, it starts it. If it’s already running, it opens your browser to show HamClock.

### Step 3: Enjoy HamClock
- HamClock will appear in your web browser, showing a clock, world map, and ham radio information like solar conditions.
- You can adjust settings in the web interface, and they’ll be saved for next time (like your call sign or location).
- Keep the browser open to use HamClock, or close it when you’re done (this won’t stop HamClock—it keeps running in the background).

### Step 4: Stop HamClock When You’re Done
- When you’re finished with HamClock (like at the end of the day or if you want to free up your computer), double-click `stop.bat` in the `hamclock-main` folder.
- This turns off HamClock, saving your computer’s power and memory. It’s like turning off your radio when you’re not using it—it keeps your computer running smoothly.
- Your HamClock settings are saved, so everything will be the same when you start it again.

## Why Is There a Stop File?
The `stop.bat` file is there to give you control over HamClock. When HamClock is running, it uses a bit of your computer’s resources (like memory and processing power). If you’re not using HamClock for a while, stopping it with `stop.bat` is a good idea because:
- It saves battery life if you’re on a laptop.
- It frees up your computer to run other programs faster.
- It’s a tidy way to pause HamClock until you need it again, without losing your settings.

You don’t have to stop HamClock every time, but it’s helpful when you’re done for the day or if your computer feels slow.

## Tips and Troubleshooting
- **HamClock Doesn’t Show Up**:
  - If the browser opens but shows an error, wait a few seconds and press **F5** (refresh) on your keyboard. It might take a moment for HamClock to start.
  - Make sure no other programs are using ports `8080` or `8081`. If you’re unsure, ask a friend or family member who knows computers to check.
- **Docker Desktop Won’t Start**:
  - If you see a message saying Docker Desktop isn’t running, look for the Docker Desktop icon in your Start menu and open it. Wait a minute, then run `start.bat` again.
- **Need Help?**:
  - If something doesn’t work, ask a friend or family member to help, or visit the [HamClock Docker page](https://github.com/ChrisRomp/hamclock-docker) for more information.
  - You can also check the [Docker Desktop guide](https://docs.docker.com/desktop/windows/install/) for setup tips.

## Thank You
A big thank you to the folks at [ChrisRomp/hamclock-docker](https://github.com/ChrisRomp/hamclock-docker) for creating the HamClock Docker image that makes this setup possible. Their hard work lets us enjoy HamClock with just a few clicks!

Happy hamming, and enjoy your HamClock!
