{ pkgs, username, ... }:
{
  ##################################################################################################################
  #
  # All Leo's Home Manager Configuration
  #
  ##################################################################################################################

  imports = [
    ../../home/home.nix
    ../../home/programs
  ];

  programs = {
    git = {
      userName = "Leo Schultheiss";
      userEmail = "leo.schultheiss@tum.de";
    };
  };
  services.kdeconnect.enable = true;
}
