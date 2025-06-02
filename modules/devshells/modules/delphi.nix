{ pkgs }:

{
  delphi = pkgs.mkShell {
    name = "delphi";
    buildInputs = with pkgs; [ fpc ];
  };
}
