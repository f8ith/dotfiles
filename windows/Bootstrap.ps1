# Setup script for Windots
#Requires -RunAsAdministrator

# Linked Files (Destination => Source)
$symlinks = @{
    $PROFILE.CurrentUserAllHosts                                                                    = ".\Profile.ps1"
    "$HOME\AppData\Local\nvim"                                                                      = "..\unix\.config\nvim"
    "$HOME\.gitconfig"                                                                              = ".\.gitconfig"
    "$ENV:PROGRAMFILES\WezTerm\wezterm_modules"                                                     = "..\unix\.config\wezterm\"
    "$HOME\.wezterm.lua"                                                                            = "..\unix\.config\wezterm\wezterm.lua"
    "$HOME\.ideavimrc"                                                                              = "..\unix\.ideavimrc"
    "$HOME\komorebi.json"                                                                           = ".\komorebi.json"
    "$HOME\applications.yaml"                                                                       = ".\applications.yaml"
    "$HOME\.config\whkdrc"                                                                          = ".\whkdrc"
    "$HOME\.gitignore"                                                                              = "..\unix\.gitignore"
    "$HOME\AppData\Roaming\alacritty"                                                               = "..\unix\.config\alacritty"
}

# Winget dependencies
$wingetDeps = @(
    "eza-community.eza"
    "Git.Git"
    "GitHub.cli"
    "Microsoft.OpenJDK.21"
    "Microsoft.PowerShell"
    "OpenJS.NodeJS"
)

# PS Modules
$psModules = @(
    "ps-color-scripts"
    "PSScriptAnalyzer"
    "CompletionPredictor"
)

# Set working directory
Set-Location $PSScriptRoot
[Environment]::CurrentDirectory = $PSScriptRoot

Write-Host "Installing missing dependencies..."
$installedWingetDeps = winget list | Out-String
foreach ($wingetDep in $wingetDeps) {
    if ($installedWingetDeps -notmatch $wingetDep) {
        winget install -e --id $wingetDep
    }
}

# Path Refresh
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# Install PS Modules
foreach ($psModule in $psModules) {
    if (!(Get-Module -ListAvailable -Name $psModule)) {
        Install-Module -Name $psModule -Force -AcceptLicense -Scope CurrentUser
    }
}

# Create Custom NVIM shotcut
# if (!(Test-Path "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\nvim.lnk")) {
#     $wshShell = New-Object -ComObject WScript.Shell
#     $shortcut = $wshShell.CreateShortcut("$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\nvim.lnk")
#     $shortcut.TargetPath = "C:\tools\neovim\nvim-win64\bin\nvim.exe"
#     $shortcut.workingDirectory = (Resolve-Path ..) # Set working directory to parent directory of this script (likely where you keep all Git Projects)
#     $shortcut.IconLocation = "C:\tools\neovim\nvim-win64\bin\nvim-qt.exe,0" # Steal icon from nvim-qt.exe
#     $shortcut.Save()
# }

# Delete OOTB Nvim Shortcuts (including QT)
# if (Test-Path "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Neovim\") {
#     Remove-Item "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Neovim\" -Recurse -Force
# }

$currentGitEmail = (git config --global user.email)
$currentGitName = (git config --global user.name)

# Create Symbolic Links
Write-Host "Creating Symbolic Links..."
foreach ($symlink in $symlinks.GetEnumerator()) {
    Get-Item -Path $symlink.Key -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
    New-Item -ItemType SymbolicLink -Path $symlink.Key -Target (Resolve-Path $symlink.Value) -Force | Out-Null
}

git config --global --unset user.email | Out-Null
git config --global --unset user.name | Out-Null
git config --global user.email $currentGitEmail | Out-Null
git config --global user.name $currentGitName | Out-Null
git config --system core.longpaths true

Set-ItemProperty 'HKLM:\System\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -value 1
