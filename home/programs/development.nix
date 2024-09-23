{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    python3
    nixfmt-rfc-style # nix formatter
  ];
}
