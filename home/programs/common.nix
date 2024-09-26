{
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utils
    htop
    tree

    # misc
    libnotify
    xdg-utils
    graphviz
    keepassxc
    nextcloud-client
    citrix_workspace
    kcalc
    mullvad-vpn

    # productivity
    obsidian

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
    mullvad-vpn.enable = true;
  };
}
