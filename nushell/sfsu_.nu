def --wrapped "scoop search" [...rest] { sfsu search ...$rest }
def --wrapped "scoop list" [...rest] { sfsu list ...$rest }
def --wrapped "scoop hook" [...rest] { sfsu hook ...$rest }
def --wrapped "scoop unused-buckets" [...rest] { sfsu unused-buckets ...$rest }
def --wrapped "scoop describe" [...rest] { sfsu describe ...$rest }
def --wrapped "scoop info" [...rest] { sfsu info ...$rest }
def --wrapped "scoop outdated" [...rest] { sfsu outdated ...$rest }
def --wrapped "scoop depends" [...rest] { sfsu depends ...$rest }

# To add this to your config, run `sfsu hook --shell nu | save ~/.cache/sfsu.nu`
# And then in your main config add the following line to the end:
#   source ~/.cache/sfsu.nu
