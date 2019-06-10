_: pkgs:

{
  haskellPackages = pkgs.haskellPackages.override (old: {
    overrides = pkgs.lib.composeExtensions (old.overrides or (_: _: {})) (self: super: {
      taffybar = self.callCabal2nix "taffybar" (builtins.fetchGit ./.) { inherit (pkgs) gtk3; };
      broadcast-chan = pkgs.haskell.lib.overrideCabal super.broadcast-chan (_: {
        version = "0.2.0.2";
        sha256 = "12ax37y9i3cs8wifz01lpq0awm9c235l5xkybf13ywvyk5svb0jv";
        revision = null;
        editedCabalFile = null;
        broken = false;
      });
    });
  });
}
