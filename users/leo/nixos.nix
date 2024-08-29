{
  ##################################################################################################################
  #
  # NixOS Configuration
  #
  ##################################################################################################################

  users.users.ryan = {
    # Leo's authorizedKeys
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG8pF+wbcc5Bnd8UvK7KrOEe18vXi2yarfUOhbmrt7Pp leo@nixos"
    ];
  };
}
