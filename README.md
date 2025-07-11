# Win-Hyperkey

![Hyperkey boom2](https://github.com/user-attachments/assets/957f22dc-c990-4216-a3ac-48b60db3394c)

As a power user who has spent time in the macOS world, one of the features I've missed most is a proper hyperkey. For those unfamiliar, it lets you create a brand new modifier-key an incredibly convenient one at that. While Windows has some third-party options (yes, I'm looking at you, AutoHotkey, which I installed literally just for this)), Remappers never felt quite right. That's why I'm excited to introduce my own solution using AHK as a base.

This project was born out of a desire for a hyperkey that integrates perfectly without compromises. and to point out a flaw in current remappers "timers, ability to stop a key like tab from making continuous presses on hold etc are needed sometimes..."

### ✅ What You Get:
  - A new modifier key! Simply hold Caps Lock and press any other key on your keyboard. (Note: Function keys like F1, F2, etc., are not yet supported, but a fix is coming soon!)
  - Crucially, you don't lose your standard Caps Lock functionality. Tap it or hold it, "doesn't matter really just use it as you always do 🥳"
  - holding CAPSLOCK & any other key will be a new HOTKEY!

### 🔰 What's Next

  - Right-Hand Modifiers: An update to allow the right-side CTRL, SHIFT, and ALT keys to trigger the Hyperkey for even more powerful combinations.
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
