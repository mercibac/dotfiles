def --wrapped "scoop app" [...rest] { sfsu app ...$rest }
def --wrapped "scoop cat" [...rest] { sfsu app cat ...$rest }
def --wrapped "scoop cleanup" [...rest] { sfsu app cleanup ...$rest }
def --wrapped "scoop download" [...rest] { sfsu app download ...$rest }
def --wrapped "scoop home" [...rest] { sfsu app home ...$rest }
def --wrapped "scoop info" [...rest] { sfsu app info ...$rest }
def --wrapped "scoop list" [...rest] { sfsu app list ...$rest }
def --wrapped "scoop search" [...rest] { sfsu search ...$rest }
def --wrapped "scoop unused-buckets" [...rest] { sfsu unused-buckets ...$rest }
def --wrapped "scoop bucket" [...rest] { sfsu bucket ...$rest }
def --wrapped "scoop describe" [...rest] { sfsu describe ...$rest }
def --wrapped "scoop outdated" [...rest] { sfsu outdated ...$rest }
def --wrapped "scoop depends" [...rest] { sfsu depends ...$rest }
def --wrapped "scoop status" [...rest] { sfsu status ...$rest }
def --wrapped "scoop export" [...rest] { sfsu export ...$rest }
def --wrapped "scoop checkup" [...rest] { sfsu checkup ...$rest }
def --wrapped "scoop cache" [...rest] { sfsu cache ...$rest }
def --wrapped "scoop virustotal" [...rest] { sfsu scan ...$rest }

# To add this to your config, run `sfsu hook --shell nu | save ~/.cache/sfsu.nu`
# And then in your $nu.config-path add the following line to the end:
#   source ~/.cache/sfsu.nu
