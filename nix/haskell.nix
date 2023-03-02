common:
{ pkgs, lib, config, ... }:

{
  imports = [
    common.inputs.nixpkgs-140774-workaround.haskellFlakeProjectModules.default
  ];
  devShell = {
    tools = hp: {
      inherit (pkgs.haskellPackages)
        hpack
        ;
      inherit (hp)
        ghcid
        ;
    };
    mkShellArgs.shellHook = ''
      ${lib.getExe common.perSystemConfig.flake-root.package}
      # Re-generate .cabal files so HLS will work (per hie.yaml)
      time ${pkgs.findutils}/bin/find -name package.yaml -exec hpack {} \;
    '';
  };
}
