{
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.direnv.stdlib = ''
    layout_uv() {
      if [[ -d ".venv" ]]; then
          VIRTUAL_ENV="$(pwd)/.venv"
      fi

      if [[ -z $VIRTUAL_ENV || ! -d $VIRTUAL_ENV ]]; then
          log_status "No uv project exists. Executing \`uv init\` to create one."
          uv init --no-readme
          rm hello.py
          uv venv
          VIRTUAL_ENV="$(pwd)/.venv"
      fi

      PATH_add "$VIRTUAL_ENV/bin"
      export UV_ACTIVE=1  # or VENV_ACTIVE=1
      export VIRTUAL_ENV
      export PYTHON_VERSION=$(grep version .venv/pyvenv.cfg | cut -d ' ' -f 3)
    }

    layout_pyright() {
      if [[ ! -d "pyrightconfig.json" ]]; then
          cat > pyrightconfig.json <<EOF
    {
      "venvPath": "./",
      "venv": ".venv/",
      "pythonVersion": "''${PYTHON_VERSION:-3.10}",
      "pythonPlatform": "Linux",
      // "reportMissingImports": false
    }
    EOF
      fi
    }
  '';
}
