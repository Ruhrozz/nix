{
  imports = [
    ./colorscheme.nix
    ./lsp.nix
    ./hop.nix
    ./neotree.nix
    ./telescope.nix
    ./trouble.nix
    ./treesitter.nix
    ./colorizer.nix
    ./neogen.nix
    ./luasnip.nix
    ./transparent.nix
    ./git-conflict.nix
  ];

  programs.nixvim.plugins = {
    web-devicons.enable = true;
    comment.enable = true;
    nvim-autopairs.enable = true;
    tmux-navigator.enable = true;
  };
}
