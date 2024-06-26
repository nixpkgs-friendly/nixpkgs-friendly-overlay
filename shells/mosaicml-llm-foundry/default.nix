{
  callPackage,
  mkShellNoCC,
  python3,
}:

let
  pythonPackages =
    p: with p; [
      composer
      # mosaicml     # [nlp,streaming,wandb]>=0.14.0,<0.15' # https://pypi.org/project/mosaicml/ #actual name is `composer`
      # mosaicml-cli # >=0.3,<1' # https://pypi.org/project/mosaicml-cli/

      # Need different versions:
      onnxruntime # needs 1.14.12
      einops # needs 0.5.0

      ## OK versions:
      onnx
      slack-sdk
      torch
      datasets
      pynvml
      sentencepiece
      omegaconf

      ###
      transformers
      loralib
      sentencepiece
      bitsandbytes
      accelerate
      xformers
    ];
in
mkShellNoCC rec {
  pname = "mosaicml-llm-foundry";
  version = "0.0.1"; # bogus development version

  buildInputs = [ (python3.withPackages pythonPackages) ];

  shellHook = ''
    tput setaf 2; echo "=== ${pname} shell ==="; tput sgr0; echo
  '';
}

# https://github.com/mosaicml/llm-foundry/blob/main/setup.py
