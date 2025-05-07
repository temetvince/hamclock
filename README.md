# HamClock for Ham Radio Enthusiasts

Welcome to a simple way to enjoy [HamClock](https://www.clearskyinstitute.com/ham/HamClock/) on your Windows computer! HamClock is a wonderful digital clock and world map made for ham radio operators like you. It shows the time, solar conditions, and other handy details for your radio hobby, all in your web browser. This setup makes it easy to get HamClock running with just a few clicks.

We’ve included two special files to start and stop HamClock, so you don’t need to worry about complicated computer stuff. This setup uses a tool called Docker to run HamClock smoothly. It builds HamClock right on your computer the first time you use it, which takes a little longer but ensures you have a fresh version. After the first setup, Docker will start automatically whenever you turn on your computer, making HamClock even easier to use. A huge thank you to the folks at [ChrisRomp/hamclock-docker](https://github.com/ChrisRomp/hamclock-docker) for their amazing work in creating the HamClock Docker package that this setup is based on!

## What’s Included
- **`start.bat`**: This file gets your computer ready to run HamClock and opens it in your web browser (like Microsoft Edge, Chrome, or Firefox). It sets everything up the first time, including making Docker start automatically when your computer turns on, and starts HamClock whenever you need it.
- **`stop.bat`**: This file turns off HamClock when you’re done. Stopping HamClock saves your computer’s battery and power, which is great if you’re not using it for a while or want your computer to run other programs faster.
- **`Dockerfile`** and **`docker-compose.yml`**: These files tell Docker how to build and run HamClock. You don’t need to touch them—they work quietly in the background.
- **`readme.md`**: This guide you’re reading now!

## What You Need
- A Windows computer (Windows 10 or 11, 64-bit version). Most modern computers are 64-bit, but ask a friend if you’re unsure.
- An internet connection to download the HamClock setup, Docker, and HamClock files.
- At least 8GB of memory (RAM) on your computer to keep things running smoothly.
- A web browser (your computer’s default browser, like Microsoft Edge, works perfectly).

**Good News**: HamClock and this setup are free for personal use, so you can enjoy it at no cost!

## How to Get Started

### Step 1: Download the Files
1. Click this link to download the HamClock setup: [Download HamClock Setup](https://github.com/temetvince/hamclock/archive/refs/heads/main.zip).
2. Save the `main.zip` file somewhere easy to find, like your Desktop or Downloads folder.
3. Double-click `main.zip` to open it, then drag the `hamclock-main` folder to your Desktop or another convenient spot.
4. Open the `hamclock-main` folder. You’ll see the files listed above.

### Step 2: Start HamClock
1. Inside the `hamclock-main` folder, find `start.bat`.
2. **First Time Only**:
   - Right-click `start.bat` and choose **Run as administrator**. This lets the script set up your computer properly.
   - The script checks if Docker (the tool that runs HamClock) is on your computer. If it’s not, it will:
     - Make sure your computer is ready (it needs to be 64-bit).
     - Set up a helper tool called WSL 2 (just part of the setup, no need to understand it).
     - Download and install Docker Desktop.
     - Set Docker to start automatically when you turn on your computer, so it’s ready when you need it.
     - Ask you to restart your computer. After restarting, double-click `start.bat` again (no need for administrator unless prompted).
   - The first time, your computer will build HamClock, which can take **5–10 minutes** depending on your computer’s speed. Please be patient—it only happens once!
3. The script will start HamClock and open your web browser to `http://localhost:8081/live.html`, where you’ll see the HamClock display.
4. **Next Time**:
   - Just double-click `start.bat`. Docker should already be running (since it starts with your computer), but the script will start it if needed. If HamClock isn’t running, it starts it. If it’s already running, it opens your browser to show HamClock right away.

### Step 3: Enjoy HamClock
- HamClock will appear in your browser, showing a clock, world map, and ham radio details like solar conditions or propagation.
- You can set it up with your call sign or location in the web interface, and your settings will be saved for next time.
- Keep the browser open to use HamClock. If you close the browser, HamClock keeps running in the background, ready for you to open again.

### Step 4: Stop HamClock When You’re Done
- When you’re finished with HamClock (like at the end of the day or if you want to save power), double-click `stop.bat` in the `hamclock-main` folder.
- This turns off HamClock, which is like switching off your radio when you’re not using it. It saves your computer’s battery (great for laptops) and frees up memory so other programs run faster.
- Your HamClock settings are saved, so everything will be just as you left it when you start again.

## Why Is There a Stop File?
The `stop.bat` file lets you turn off HamClock when you don’t need it. When HamClock is running, it uses a bit of your computer’s power and memory, kind of like leaving a light on. Stopping it with `stop.bat` helps:
- Save battery life on a laptop.
- Make your computer run faster for other tasks, like email or browsing.
- Keep things tidy, so HamClock only runs when you want it.

You don’t need to stop HamClock every time, but it’s a good idea at the end of the day or if your computer feels slow.

## Changing the HamClock Size (Resolution)
HamClock can display in different sizes to fit your screen or preference. The default size is 1600x960 (good for most computers), but you can change it to:
- 800x480 (smaller, good for small screens or tablets).
- 2400x1440 (larger, for big monitors).
- 3200x1920 (very large, for high-resolution screens).

To change the size:
1. Open the `hamclock-main` folder and find `docker-compose.yml`.
2. Right-click `docker-compose.yml` and open it with Notepad.
3. Look for the line that says `HAMCLOCK_RESOLUTION: 1600x960` (it’s near the top).
4. Change `1600x960` to one of the other sizes (e.g., `800x480`, `2400x1440`, or `3200x1920`). Make sure to type it exactly as shown.
5. Save the file (click **File** > **Save** in Notepad) and close Notepad.
6. Double-click `stop.bat` to turn off HamClock (if it’s running).
7. Double-click `start.bat` to start HamClock with the new size. It may take **5–10 minutes** to rebuild HamClock with the new size, just like the first setup.
8. The HamClock又有 window in your browser will now show the new size.

If editing the file feels tricky, ask a friend or family member to help. Choose a size that looks clear and comfortable on your screen.

## Tips and Troubleshooting
- **HamClock Doesn’t Show Up**:
  - If your browser opens but shows an error, wait a few seconds and press **F5** (refresh) on your keyboard. HamClock might need a moment to start.
  - Make sure no other programs are using ports `8080` or `8081`. If you’re not sure, ask someone who knows computers to check.
- **Docker Desktop Won’t Start**:
  - Docker should start automatically when you turn on your computer. If you see a message saying Docker Desktop isn’t running, look for the Docker Desktop icon in your Start menu (search for “Docker”). Open it, wait a minute, then run `start.bat` again.
  - If the script can’t find Docker Desktop, it will ask you to start it manually.
- **Setup Takes Too Long**:
  - The first time you run `start.bat`, it can take **5–10 minutes** to build HamClock, especially on older computers. This also happens if you change the size. This only happens once per setup or size change. Grab a cup of coffee and give it time.
- **Need Help?**:
  - If something doesn’t work, ask a friend or family member for help. You can also visit the [HamClock Docker page](https:// Dwayne G. /hamclock-docker) for more details or check the [Docker Desktop guide](https://docs.docker.com/desktop/windows/install/) for setup tips.

## Thank You
A heartfelt thank you to the team at [ChrisRomp/hamclock-docker](https://github.com/ChrisRomp/hamclock-docker) for building the HamClock Docker package that this setup is based on. Their hard work makes it possible for us to enjoy HamClock with just a few clicks. We’re so grateful for their contribution to the ham radio community!

## Questions or Ideas?
If you have questions or ideas to make this setup even better, please share them! You can add a note on the [GitHub page](https://github.com/temetvince/hamclock) or ask a friend to help you send a message.

Happy hamming, and enjoy your HamClock!
