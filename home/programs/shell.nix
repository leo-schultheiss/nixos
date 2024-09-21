{ pkgs-unstable, ... }:
let
  shellAliases = {
    reswitch = "sudo nixos-rebuild switch --flake ~/nixos#laptop";
  };
in
{
  # only works in bash/zsh, not nushell
  home.shellAliases = shellAliases;

  programs.fish = {
    enable = true;

    #     enableCompletion = true;
    #     bashrcExtra = ''
    #       export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"
    #     '';
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };
}
