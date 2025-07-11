# Win-Hyperkey

![Hyperkey boom2](https://github.com/user-attachments/assets/957f22dc-c990-4216-a3ac-48b60db3394c)

As a power user who has spent time in the macOS world, one of the features I've missed most is a proper hyperkey. For those unfamiliar, it lets you create a brand new modifier-key an incredibly convenient one at that. While Windows has some third-party options (yes, I'm looking at you, AutoHotkey, which I installed literally just for this)), Remappers never felt quite right. That's why I'm excited to introduce my own solution using AHK as a base.

This project was born out of a desire for a hyperkey that integrates perfectly without compromises. and to point out a flaw in current remappers "timers, ability to stop a key like tab from making continuous presses on hold etc are needed sometimes..."

### ✅ What You Get:
  - A new modifier key! Simply hold Caps Lock and press any other key on your keyboard. (Note: Function keys like F1, F2, etc., are not yet supported, but a fix is coming soon!)
  - Crucially, you don't lose your standard Caps Lock functionality. Tap it or hold it, "doesn't matter really just use it as you always do 🥳"
  - holding CAPSLOCK & any other key will be a new HOTKEY!

### 🔰 What's Next

  - Right-Hand Modifiers: An update to allow the right-side CTRL, SHIFT, and ALT keys to trigger the Hyperkey
    - this allows you for even more powerful combinations, like HYPERKEY + SHIFT or ALT, Hyperkey, + W etc. 
  - GUI
    - Allows for mapping new keys (F1, F2, F16 and More)
    - Toggle for chords (for actions like volume control).
    - Toogle for Exact matches
   
### MAYBE's
 - Application-Specific Hotkeys: Different keymaps for different apps. (if used incombination with a remmaper this is useless)
 - Key Sequences / Macros: Triggering actions with a sequence of keys (e.g., Hyper -> G -> C). (decent idea)
 - Import/Export Profiles: Share your custom keymaps with others. (Donno if viable with AHK)


### Known issues:
  - The entire implementation without loseing CAPSLOCK means in some "minority" softwares you can't create the hotkey you want using capslock and modifierkey
    - just to be clear this works with almost all software current culplrit is Powertoys
  - Since it is combining multiple keyboard modifier keys together you can't really use it in conjunction with other modifier key
    - (WORKAROUND) This will be addressed by the planned update to use right-side modifiers instead.
---
# Installation:

For the EXE Version (.exe)
This method is the most direct and doesn't require installing any other software.

1. Download the Program
Go to the project's GitHub page. On the right-hand side, look for the Releases section and click on it. Find the latest release, look under its Assets, and download the file that ends with `.exe`.

2. Set Up Autostart
To have the program run every time you start your computer, you'll place it's shortcut in the Windows Startup folder.

place the HyperKey.exe file in a safe folder "that you'll never delete"
  - Hold shift and then Right click on it and Send to (Desktop Create shortcut) 

<img width="538" height="790" alt="msedge_nEAvWncix9" src="https://github.com/user-attachments/assets/5e5058f8-0378-43d2-ab11-2b4097c1f643" />


Press the Windows Key + R to open the Run command box.

Type `shell:startup` and press Enter. This will open your Startup folder.

Find the Created shortcut "On your Desktop".

Move the Shortcut from your Desktop into the Startup folder you just opened.

That's it! The program will now launch automatically every time you boot up your PC. 🚀

![explorer_7mOYOUfXj8](https://github.com/user-attachments/assets/c24b75f9-7ead-427b-b490-7a9bdc8673f3)

For the AHK Version (.ahk)
This method requires you to have AutoHotkey installed first. If you don't have it, download and install it before proceeding.
Or just use the exe verison though this version has it's source avail

1. Download the Script
Navigate to the GitHub Releases page just like in the previous example. Under the Assets for the latest release, download the file that ends with .ahk.

2. Set Up Autostart
For scripts, it's best to create a shortcut in the Startup folder.

Press Windows Key + R, type shell:startup, and press Enter.

Find the .ahk script you downloaded.

Right-click the .ahk file and select Copy/Move.

Go back to the Startup folder, right-click inside it, and select Paste shortcut.

Now the script will run automatically via AutoHotkey whenever Windows starts. ✨


