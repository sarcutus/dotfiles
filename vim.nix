{
pkgs,
...
}:

pkgs.vim_configurable.customize {
  name = "vim";  # Specify the vim binary name
  vimrcConfig.customRC = ''
    set laststatus=2  # Always show the status line
    syntax enable     # Enable syntax highlighting
  '';
  
  vimrcConfig.packages.myPlugins = with pkgs.vimPlugins; {
    start = [ 
      vim-airline  # Add the Airline plugin here
      vim-airline-themes  # Optional: Add themes for Airline
    ];
    opt = [];  # Optional plugins can be added here
  };
}

