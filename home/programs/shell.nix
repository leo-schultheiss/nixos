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
        interactiveShellInit = ''
          set fish_greeting # Disable greeting
          function reswitch
              sudo nixos-rebuild switch --flake ~/nixos#$argv
          end
        '';
      };
}
