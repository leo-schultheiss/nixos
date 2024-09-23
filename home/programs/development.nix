{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # IDEs
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional

    # python
    python3
    conda # anaconda python package manager

    nixfmt-rfc-style # nix formatter

    gitkraken
  ];
}
