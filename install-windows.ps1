$profile = ${env:USERPROFILE}

winget install Git.Git
winget install GNU.Emacs
winget install Neovim.Neovim

New-Item -ItemType SymbolicLink -Path "$profile/AppData/Local/nvim/" -Target "$pwd/.config/nvim"
New-Item -ItemType SymbolicLink -Path "$profile/AppData/Local/.emacs.d" -Target "$pwd/.emacs.d"
New-Item -ItemType SymbolicLink -Path "$profile/.gitconfig" -Target "$pwd/.gitconfig"
New-Item -ItemType SymbolicLink -Path "$profile/.gitignore_global" -Target "$pwd/.gitignore_global"
New-Item -ItemType SymbolicLink -Path "$profile/.vsvimrc" -Target "$pwd/.vsvimrc"
