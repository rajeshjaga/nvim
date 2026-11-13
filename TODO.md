# Todo

- [ ] These applications are required to be installed
    -   `ripgrep`, `fd`, `gcc` or `cc`, `tar`, `unzip`, `curl` and `git`
- [ ] lua checker to check if the above are installed
- [ ] Lsp, Write a inhouse lsp manager to manage, install and remove the lsp binaries
    - require a file based config for each filetype if needed
    - no throwing error at startup, first try to execute,
    - throw retrying to install with npm, cargo or go based package manager or os package manager(eg. pacman, apt, xbps, dnf, apk, zypper)
    - if the package manager is not able to do it, then throw error about system incompatiability
