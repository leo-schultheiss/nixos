{ pkgs, username, ... }:
{
  ##################################################################################################################
  #
  # All Leo's Home Manager Configuration
  #
  ##################################################################################################################

  imports = [
    ../../home/core.nix
    ../../home/programs
    #     ../../home/shell
  ];

  programs = {
    git = {
      userName = "Leo Schultheiss";
      userEmail = "leo.schultheiss@tum.de";
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
}
