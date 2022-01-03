[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
Import-Module oh-my-posh
$omp_config = Join-Path $PSScriptRoot ".\user.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias vi vim
Set-Alias mvn 'C:\ProgramData\chocolatey\lib\maven\apache-maven-3.8.4\bin\mvn.cmd' 
Set-Alias conda 'C:\Users\user\anaconda3\conda.exe'
Set-Alias python 'C:\Windows\py.exe'

# Java Alias
Set-Alias java8 'C:\Users\user\.jdks\corretto-1.8.0_312\bin\java'
Set-Alias java11 'C:\Users\user\.jdks\corretto-11.0.13\bin\java'
Set-Alias java16 'C:\Users\user\.jdks\corretto-16.0.2\bin\java'
Set-Alias java17 'C:\Program Files\Amazon Corretto\jdk17.0.1_12\bin\java'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
