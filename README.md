
# .config

## Prerequisite

- Windows have to use WSL2 to properly utilized this configuration file
- Windows Also have to install [Chocolatey](https://chocolatey.org/install)
- Nerd font is needed to display text properly (My font [D2Coding](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/D2Coding.zip))

- Terminal Emulator

  - ```sh
    Windows: Wezterm

    Linux:
      ghostty: yay -S ghostty-git
    ```

- Fish shell

  - ```sh
    Ubuntu/Debian:
      sudo apt-add-repository ppa:fish-shell/release-3
      sudo apt update
      sudo apt install fish

    Arch: 
      sudo pacman -S fish
    ```

  - ```sh
    sudo chsh -s /path/to/fish/shell
    ```
  
  - Shell themes (Starship)

    - Linux:

      ```sh
        curl -sS https://starship.rs/install.sh | sh
      ```

    - Windows (Using Chocolatey referred to [this](#prerequisite)):

        ```sh
        choco install starship
        ```

- Tmux
  - [Tmux Wiki](https://github.com/tmux/tmux/wiki/Installing)
  - [Tmux Cheatsheet](https://tmuxcheatsheet.com/)
  - Tmux TPM (Tmux Plugin Manager)

    - ```sh
      git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
      ```

    - After installing TPM, open up Tmux and press `prefix` + <kbd>I</kbd> to fetch the plugin.

- Neovim (Still not much configured)
  - Linux:

    - ```sh
      Ubuntu/Debian: 
        sudo add-apt-repository ppa:neovim-ppa/unstable (or stable)
        sudo apt update
        sudo apt install neovim

      Arch: 
        sudo pacman -S neovim
      ```

### I'm only writing about system that I use personally

#### Packages I use a lot and required: Zoxide
