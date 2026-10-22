#!/usr/bin/python3
"""Give GRUB's 'Advanced options' submenu and 'UEFI Firmware Settings' entries a
class, so the DarkMint theme can show icons for them (submenu.png, efi.png).
Run as root. Safe to re-run: each class is added only once, originals backed up."""
import shutil, sys

PATCHES = [
    ("/etc/grub.d/10_linux",
     "echo \"submenu '$(gettext_printf \"Advanced options for %s\" \"${OS}\" | grub_quote)' \\$menuentry_id_option",
     "echo \"submenu '$(gettext_printf \"Advanced options for %s\" \"${OS}\" | grub_quote)' --class submenu \\$menuentry_id_option"),
    ("/etc/grub.d/30_uefi-firmware",
     "menuentry '$LABEL' \\$menuentry_id_option 'uefi-firmware'",
     "menuentry '$LABEL' --class efi \\$menuentry_id_option 'uefi-firmware'"),
]

for path, old, new in PATCHES:
    text = open(path).read()
    if new in text:
        print(f"{path}: already patched")
        continue
    if text.count(old) != 1:
        sys.exit(f"{path}: expected line not found; GRUB may have changed, not patching")
    shutil.copy2(path, path + ".bak-darkmint")
    open(path, "w").write(text.replace(old, new))
    print(f"{path}: class added (backup: {path}.bak-darkmint)")
