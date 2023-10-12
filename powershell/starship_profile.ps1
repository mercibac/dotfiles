
Invoke-Expression (&starship init powershell)

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
Set-Alias alacrittyshell 'nvim "C:\Users\Merci_Bacman\.config\alacritty.yml"'
Set-Alias c cls

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function take ($folder) {
  New-Item -ItemType Directory -Name $folder
  cd $folder 
}
