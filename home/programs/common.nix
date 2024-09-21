{
  lib,
  pkgs,
  #catppuccin-bat,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utils
    htop
    gitkraken

    # misc
    libnotify
    xdg-utils
    graphviz
    keepassxc
    nextcloud-client
    citrix_workspace

    # productivity
    obsidian

    # IDE
    jetbrains.idea-community

    # cloud native
    docker-compose
  ];

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      keyMode = "vi";
      extraConfig = "mouse on";
    };

    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    jq.enable = true; # A lightweight and flexible command-line JSON processor
    ssh.enable = true;
    aria2.enable = true;
  };

  services = {
    # auto mount usb drives
    udiskie.enable = true;
  };
}
