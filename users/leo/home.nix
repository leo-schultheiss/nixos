{pkgs, ...}: {
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

  programs.git = {
    userName = "Leo Schultheiss";
    userEmail = "leo.schultheiss@tum.de";
  };
}
