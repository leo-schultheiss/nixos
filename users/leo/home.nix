{pkgs, username, ...}: {
  ##################################################################################################################
  #
  # All Leo's Home Manager Configuration
  #
  ##################################################################################################################

  imports = [
    ../../home/core.nix

#     ../../home/fcitx5
#     ../../home/i3
    ../../home/programs
#     ../../home/rofi
#     ../../home/shell
  ];

  programs = {
    git = {
      userName = "Leo Schultheiss";
      userEmail = "leo.schultheiss@tum.de";
    };

    firefox = {
  #      enable = true;
      profiles.default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "https://duckduckgo.com";
          "browser.search.defaultenginename" = "DuckDuckGo";
          "browser.search.order.1" = "DuckDuckGo";
          "signon.rememberSignons" = false;

          "widget.use-xdg-desktop-portal.file-picker" = 1;
          "browser.aboutConfig.showWarning" = false;
          "browser.compactmode.show" = true;
          "browser.cache.disk.enable" = false; # Be kind to hard drive

          #"mousewheel.default.delta_multiplier_x" = 20;
          #"mousewheel.default.delta_multiplier_y" = 20;
          #"mousewheel.default.delta_multiplier_z" = 20;

          # Firefox 75+ remembers the last workspace it was opened on as part of its session management.
          # This is annoying, because I can have a blank workspace, click Firefox from the launcher, and
          # then have Firefox open on some other workspace.
          # "widget.disable-workspace-management" = true;
        };
        search = {
          force = true;
          default = "DuckDuckGo";
          order = [ "DuckDuckGo" "Google" ];
        };
      };
    };

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

  accounts.email = {
    accounts.outlook = {
      realName = "Leo Schultheiss";
      address = "leoschultheiss@yahoo.de";
      userName = "leoschultheiss@yahoo.de";
      primary = true;
      imap = {
        host = "imap.mail.yahoo.com";
        port = 993;
      };
#         passwordCommand = "cat ${config.age.secrets.microsoft.path}";
      passwordCommand = "test";
      thunderbird = {
        enable = true;
        profiles = [ "${username}" ];
      };
    };
  };
}
