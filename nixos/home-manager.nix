{inputs, ...}: {
  imports = [
    inputs.homa.darwinModules.default
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.kafka = import ../home.nix;
    extraSpecialArgs = {inherit inputs;};
  };
}
