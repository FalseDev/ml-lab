{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = import nixpkgs {system = "x86_64-linux";};
  in {
    packages."x86_64-linux".default = pkgs.mkShell {

      packages = with pkgs; [
        pre-commit
        (python311.withPackages (ps: with ps; [
          numpy
          pandas
          matplotlib
          seaborn
          scikit-learn
          opencv4
          pip

          pyright
          notebook
          nbdime
        ]))
      ];
    };
  };
}
