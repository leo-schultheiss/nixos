{ config, pkgs, ... }:
{
  programs.nextcloud-client = {
    enable = true;
  };
}
