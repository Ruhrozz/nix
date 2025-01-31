{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          pyright = {
            enable = true;
            autostart = true;
          }; # python

          nil_ls = {
            enable = true;
            autostart = true;
            settings.formatting.command = [
              "nixfmt"
            ]; # It's probably a bug and is not supposed to be here.
          }; # nix

          ts_ls = {
            enable = true;
            autostart = true;
          }; # typescript

          bashls = {
            enable = true;
            autostart = true;
          }; # bash

          dockerls = {
            enable = true;
            autostart = true;
          }; # dockerfile
        };
        keymaps.lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };

      cmp = {
        enable = true;

        cmdline = {
          "/" = {
            mapping = { __raw = "cmp.mapping.preset.cmdline()"; };
            sources = [{ name = "buffer"; }];
          };
          ":" = {
            mapping = { __raw = "cmp.mapping.preset.cmdline()"; };
            sources = [
              { name = "path"; }
              {
                name = "cmdline";
                option = { ignore_cmds = [ "Man" "!" ]; };
              }
            ];
          };
        };

        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            {
              name = "buffer";
              keyword_length = 3;
            }
            { name = "path"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" =
              "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
        };
      };

      none-ls = {
        enable = true;
        sources = {
          diagnostics = {
            yamllint.enable = true; # yaml
            codespell.enable = true; # english
            pylint = {
              enable = true;
              package = null;
              settings = { extra_args = [ "--max-line-length" "120" ]; };
            };
          };
          formatting = {
            black = {
              enable = true;
              settings = { extra_args = [ "--line-length" "120" ]; };
            }; # python
            isort = {
              enable = true;
              settings = {
                extra_args = [
                  "--profile"
                  "black"
                  "--line-length"
                  "120"
                  "--ensure_newline_before_comments"
                  "true"
                  "--force_single_line"
                  "true"
                ];
              };
            }; # python
            nixfmt.enable = true; # nix
            yamlfmt.enable = true; # yaml
            codespell.enable = true; # english
            shfmt = {
              enable = true;
              settings = {
                extra_args =
                  [ "--indent" "4" "--space-redirects" "--simplify" ];
              };
            }; # bash
            mdformat.enable = true; # markdown
          };
        };
      };
    };

    keymaps = [
      # - Open error in floating windown
      {
        mode = "n";
        key = "<space>e";
        action.__raw = "vim.diagnostic.open_float";
      }
      # - Go to prev error
      {
        mode = "n";
        key = "[d";
        action.__raw = "vim.diagnostic.goto_prev";
      }
      # - Go to next error
      {
        mode = "n";
        key = "]d";
        action.__raw = "vim.diagnostic.goto_next";
      }
      # - Activate all formatters to format current file
      {
        mode = "n";
        key = "<leader>fa";
        action = "<cmd>lua vim.lsp.buf.format({async = true})<CR>";
      }
    ];
  };
}
