$ErrorActionPreference = "Stop"

$DEFAULT_CONFIG_PREFIX = "default"
$CONFIG_SUFFIX = ".conf.yaml"
$DOTBOT_DIR = "dotbot"
$DOTBOT_BIN = "bin/dotbot"
$BASEDIR = $PSScriptRoot

Set-Location $BASEDIR
git -C $DOTBOT_DIR submodule sync --quiet --recursive
git submodule update --init --recursive $DOTBOT_DIR

$configs = @($DEFAULT_CONFIG_PREFIX) + $args

# Find Python once
$PYTHON = (Get-Command python  -ErrorAction SilentlyContinue) `
       ?? (Get-Command python3 -ErrorAction SilentlyContinue)

if (-not $PYTHON) {
    Write-Error "Error: Cannot find Python."
}

# Dotbot entrypoint
$DOTBOT = Join-Path (Join-Path $BASEDIR $DOTBOT_DIR) $DOTBOT_BIN

# Run dotbot for default + all args
foreach ($conf in $configs) {
    & $PYTHON $DOTBOT -d $BASEDIR -c "$conf$CONFIG_SUFFIX"
}

