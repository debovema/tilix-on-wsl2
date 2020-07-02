$WorkingDirectory=Get-Location;
$ShortcutFile = "$WorkingDirectory\tilix.lnk"
$TargetFile="$env:SystemRoot\System32\wscript.exe";
$Arguments = "`"$WorkingDirectory\bat-launcher.vbs`" `"open-shell`" `"/home/debovema`"";
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath=$TargetFile;
$Shortcut.Arguments=$Arguments;
$Shortcut.WorkingDirectory="$WorkingDirectory";
$Shortcut.IconLocation="$WorkingDirectory\tilix.ico";
$Shortcut.Save();
