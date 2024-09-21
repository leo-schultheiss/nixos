{pkgs, username, ...}: {
  ##################################################################################################################
  #
  # All Leo's Home Manager Configuration
  #
  ##################################################################################################################

  imports = [
    ../../home/core.nix
    ../../home/programs
#     ../../home/rofi
#     ../../home/shell
  ];

  programs = {
    git = {
      userName = "Leo Schultheiss";
      userEmail = "leo.schultheiss@tum.de";
    };

#    firefox = {
#      enable = true;
#      profiles.default = {
#        id = 0;
#        name = "default";
#        isDefault = true;
#        settings = {
#          "browser.startup.homepage" = "https://duckduckgo.com";
#          "browser.search.defaultenginename" = "DuckDuckGo";
#          "browser.search.order.1" = "DuckDuckGo";
#          "signon.rememberSignons" = false;
#
#          "widget.use-xdg-desktop-portal.file-picker" = 1;
#          "browser.aboutConfig.showWarning" = false;
#          "browser.compactmode.show" = true;
#          "browser.cache.disk.enable" = false; # Be kind to hard drive
#
#          #"mousewheel.default.delta_multiplier_x" = 20;
#          #"mousewheel.default.delta_multiplier_y" = 20;
#          #"mousewheel.default.delta_multiplier_z" = 20;
#        };
#        search = {
#          force = true;
#          default = "DuckDuckGo";
#          order = [ "DuckDuckGo" "Google" ];
#        };
#      };
#    };

    thunderbird = {
      enable = true;
      profiles.leo = {
        isDefault = true;
      };
    };

    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
        alias reswitch "sudo nixos-rebuild switch --flake ~/nixos#"
      '';
    };
  };
}
