# Cursor Right-Click Menu

Add "Open in Cursor" to Windows context menu.

## Install

1. Right-click `install.bat` → **Run as administrator**
2. Done!

## Uninstall

Run this in CMD (as admin):
```cmd
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\Cursor" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shell\Cursor" /f
taskkill /f /im explorer.exe & start explorer.exe
```

## Requirements

- Windows 10/11
- [Cursor](https://cursor.sh) installed

---

⭐ Star if useful
