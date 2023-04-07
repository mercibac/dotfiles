# Prompt
Import-Module posh-git
Import-Module Terminal-Icons

oh-my-posh init pwsh --config "$env:POSH_USER_PATH/merbac.omp.json" | Invoke-Expression

Invoke-Expression (& {


    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }


    (zoxide init --hook $hook powershell | Out-String)


})

# Functions
function ls_git { & 'C:\Program Files\Git\usr\bin\ls' --color=auto }

function clean_vim([string]$FileName)
{
    nvim --clean "$FileName"
}

# Alias
Set-Alias vim nvim
Set-Alias vc clean_vim
Set-Alias grep findstr
Set-Alias tig "C:\Program Files\Git\usr\bin\tig.exe"
Set-Alias less "C:\Program Files\Git\usr\bin\less.exe"
Set-Alias ls ls_git
# Set-Alias z zoxide

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
