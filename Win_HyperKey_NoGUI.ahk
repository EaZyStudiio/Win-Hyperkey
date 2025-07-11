#Requires AutoHotkey v2.0

; This is a 90% hyperkey

; ############################################################################
; ##                                                                        ##
; ##                 Smart Key Remapper - AutoHotkey v2 Script              ##
; ##                                                                        ##
; ############################################################################
;
; This script remaps a key to function as a modifier (like Ctrl, Alt, Shift)
; ONLY when it is held down and used in combination with another key.
;
; Preserves original key functionality when pressed alone
; Remaps to modifier keys when used in combination
;
;
; ----------------------------------------------------------------------------
; -- How it Works:
; ----------------------------------------------------------------------------
; 1. When you press the `WatchKey` (e.g., CapsLock), the script starts a very
;    short timer.
; 2. If you release the key BEFORE the timer runs out, the script treats it as
;    a "tap" and executes its original function (e.g., toggling CapsLock).
; 3. If you HOLD the key long enough for the timer to run out, the script
;    treats it as a "hold". This activates a special context.
; 4. While this context is active, any other key you press will trigger a
;    hotkey that sends the modifier combination (e.g., sending Ctrl+C).
; 5. If Press the key and another key in combination, any other key you press
;    will trigger a hotkey that sends the modifier combination
;    (e.g., sending Ctrl+C)
; ----------------------------------------------------------------------------
; -- Edge Cases
; ----------------------------------------------------------------------------
; Since this is KEY not MODIFIER KEY Each New GUI setting must have a toogle
; to treat that HOTKEY rule as a MODIFIER KEY insted
; This is accounting for a sernarior where users press
; (A,S) or (H,E,R) etc. really fast, this means that the original key 
; "WatchKey" Must be a Modifier key
; originalKey => [modifierKeys, originalFunction]
;  
;  
;
; ============================================================================


; ============================================================================
;                        --- Abbrivations ---
;          Incase I forget or someone else edits this
; ============================================================================

; fastTyperMode = Use ModifierKeys only insted of 
;
;
;


; ============================================================================
;                        --- (1) CONFIGURATION ---
;          You can easily change the script's behavior by editing
;                the values in this section.
; ============================================================================

; Key mapping configuration
; Format: originalKey => [modifierKeys, originalFunction]
; global keyMappings := Map()


; global fastTyperMode := false  ; Toggle for fast typers
; global comboTimeout := 200     ; Timeout in milliseconds for combo detection



; ============================================================================
;                      --- (2) IMPLEMENTATION ---
;         This is the core logic. You shouldn't need to edit this
;                unless you are making advanced changes.
; ============================================================================





; ============================================================================
;                   --- (3) GUI Building ---
;            These hotkeys ONLY work when the `WatchKey` is held
;                  down (i.e., when `g_isHeld` is true).
; ============================================================================

; CreateConfigGUI()



; ============================================================================
;                   --- (3) CONTEXT-SENSITIVE HOTKEYS ---
;            These hotkeys ONLY work when the `WatchKey` is held
;                  down (i.e., when `g_isHeld` is true).
; ============================================================================



; Smart Remapper: CapsLock acts normally when tapped,
; but becomes a full Hyper key (Ctrl+Alt+Shift+Win) when held with another key

global watchKey := "CapsLock"
global isCombo := false
global isDown := false
global delayBeforeTap := 200  ; ms: Delay to detect tap vs hold
global tapTimer := 0

; Define keys to remap with Hyper modifiers
; ^!+# means Ctrl + Alt + Shift + Win (Hyper)
remapKeys := Map(
    "a", "^!+#a", "b", "^!+#b", "c", "^!+#c", "d", "^!+#d",
    "e", "^!+#e", "f", "^!+#f", "g", "^!+#g", "h", "^!+#h",
    "i", "^!+#i", "j", "^!+#j", "k", "^!+#k", "l", "^!+#l",
    "m", "^!+#m", "n", "^!+#n", "o", "^!+#o", "p", "^!+#p",
    "q", "^!+#q", "r", "^!+#r", "s", "^!+#s", "t", "^!+#t",
    "u", "^!+#u", "v", "^!+#v", "w", "^!+#w", "x", "^!+#x",
    "y", "^!+#y", "z", "^!+#z", "1", "^!+#1", "2", "^!+#2",
    "3", "^!+#3", "4", "^!+#4", "5", "^!+#5", "6", "^!+#6",
    "7", "^!+#7", "8", "^!+#8", "9", "^!+#9", "0", "^!+#0",
    "Tab", "^!+#Tab", "Enter", "^!+#Enter", "Space", "^!+#Space",
    "Up", "^!+#Up", "Down", "^!+#Down", "Left", "^!+#Left", "Right", "^!+#Right"
)

; --- WatchKey DOWN (CapsLock) ---
Hotkey("*" . watchKey, WatchKey_Down)
; --- WatchKey UP (CapsLock) ---
Hotkey("*" . watchKey . " Up", WatchKey_Up)

WatchKey_Down(*) {
    global isDown, isCombo, tapTimer, delayBeforeTap
    isDown := true
    isCombo := false
    tapTimer := SetTimer(CheckTap, -delayBeforeTap)  ; One-shot timer
}

WatchKey_Up(*) {
    global isDown, isCombo
    isDown := false
    if !isCombo {
        ; Perform normal CapsLock toggle if it was just a tap
        Send "{Blind}{CapsLock}"
    }
}

CheckTap(*) {
    ; Intentionally blank — logic is handled in Up
}

; Register Hyper key mappings
for key, combo in remapKeys {
    Hotkey("*" . key, BindKey(key, combo), "On")
}

BindKey(keyName, sendWhat) {
    return (*) => KeyComboHandler(keyName, sendWhat)
}

KeyComboHandler(key, sendCombo) {
    global isDown, isCombo
    if isDown {
        isCombo := true
        Send "{Blind}" . sendCombo
    } else {
        ; Let key behave normally
        if (StrLen(key) > 1 || key ~= "^[A-Z]$") {
            Send "{Blind}{" . key . "}"
        } else {
            Send "{Blind}" . key
        }
    }
}
