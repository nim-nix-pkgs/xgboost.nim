{
  description = ''Nim wrapper of libxgboost'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-xgboost.nim-0_1_1.flake = false;
  inputs.src-xgboost.nim-0_1_1.owner = "jackhftang";
  inputs.src-xgboost.nim-0_1_1.ref   = "0_1_1";
  inputs.src-xgboost.nim-0_1_1.repo  = "xgboost.nim";
  inputs.src-xgboost.nim-0_1_1.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-xgboost.nim-0_1_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-xgboost.nim-0_1_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}