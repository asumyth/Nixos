{ pkgs ? import <nixpkgs> { config.allowUnfree = true; } }:

let
  # CHANGED: Switched to python312 to fix the sphinx error
  python = pkgs.python312;
in pkgs.mkShell {
  name = "vllm-env";
  
  buildInputs = [
    python
    pkgs.python312Packages.pip
    pkgs.python312Packages.virtualenv
    pkgs.cudatoolkit
    pkgs.linuxPackages.nvidia_x11
    pkgs.git
    pkgs.stdenv.cc.cc.lib
    pkgs.zlib
  ];

  shellHook = ''
    # Create the virtual environment if it doesn't exist
    if [ ! -d ".venv" ]; then
      echo "Creating virtual environment..."
      python -m venv .venv
    fi
     
    # Activate the environment
    source .venv/bin/activate
     
    # Set Library Paths so vLLM finds CUDA
    export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=${pkgs.linuxPackages.nvidia_x11}/lib:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=${pkgs.zlib}/lib:$LD_LIBRARY_PATH
    export CUDA_HOME=${pkgs.cudatoolkit}
     
    echo "vLLM Environment Ready (Python 3.12)"
  '';
}
