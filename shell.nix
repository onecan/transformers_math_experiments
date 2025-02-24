{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  NIX_LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
    libGL
    qt5Full
    qt5.qtbase
    stdenv.cc.cc
  ];
  NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker";
  buildInputs = with pkgs; [
    nix-ld
    julia-bin 
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      tokenizers
      slurm
      torch
      numpy
    ]))
  ];

  shellHook = ''
   julia -e '
    using Pkg;
    Pkg.add([
      "Dictionaries",
      "Plots",
      "Combinatorics",
      "ArgParse"
    ])
  '
  '';
}
