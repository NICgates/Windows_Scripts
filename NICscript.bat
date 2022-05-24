:: Delete shadow copies & resize max storage for it.
vssadmin delete shadows /for=C:
vssadmin resize shadowstorage /for=C: /on=C: /maxsize=10GB

:: C drive Cleanup.
rmdir /s %systemdrive%\$Recycle.bin
cleanmgr.exe /d c

:: Uninstall programs and remove their files
msiexec.exe /X {uninstall string} /qn
