# Package

version       = "0.1.1"
author        = "nattoujam"
description   = "prompt presets"
license       = "MIT"
srcDir        = "src"
bin           = @["ps1"]


# Dependencies

requires "nim >= 2.2.8"


task install_ps1, "Install ps1switcher":
  exec "nim r tasks/install.nim"
