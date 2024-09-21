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
  };
}
