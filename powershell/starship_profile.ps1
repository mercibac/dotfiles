
Invoke-Expression (&starship init powershell)

Invoke-Expression (&sfsu hook)

Invoke-Expression (& {


    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }


    (zoxide init --hook $hook powershell | Out-String)


})

# Functions
function ls_git { & 'C:\Program Files\Git\usr\bin\ls' --color=auto }

function vi([string]$FileName)
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
Set-Alias cat bat
Set-Alias alconfig 'nvim "C:\Users\Merci_Bacman\.config\alacritty.toml"'
Set-Alias c cls
Set-Alias v nvim

# Utilities
function e {
    exit
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function take ($folder) {
  New-Item -ItemType Directory -Name $folder
  cd $folder 
}
