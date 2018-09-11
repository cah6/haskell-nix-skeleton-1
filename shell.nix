let 
  projectDrv = (import ./release6.nix { withHoogle = true; } ).project1;
in 
  projectDrv.env