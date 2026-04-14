import std/os
import std/osproc

let homeDir     = getHomeDir()
let configDir   = homeDir / ".config" / "nattoujam" / "ps1"
let helpersSh   = configDir / "helpers"
let presetsConf = configDir / "presets"
let binDir      = homeDir / ".local" / "bin"
let binaryName  = "ps1"

createDir(configDir)
createDir(binDir)

let returnCode = execCmd("nim c -d:release -o:" & binDir / binaryName & " src/ps1.nim")
if returnCode != 0: quit(returnCode)
echo "installed: " & binDir / binaryName

copyFile("assets/presets", presetsConf)
echo "installed: " & presetsConf

copyFile("assets/helpers", helpersSh)
echo "installed: " & helpersSh

echo ""
echo "Add this line to your .zshrc or .bashrc:"
echo "  [ -f ~/.config/nattoujam/ps1/current ] && source ~/.config/nattoujam/ps1/current"
