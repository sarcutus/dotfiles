{ pkgs, inputs, ... }:
{
  home-manager.users.sarcutus = {
    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
#      settings = {
        # configure options
#      };
    };
  };
}
