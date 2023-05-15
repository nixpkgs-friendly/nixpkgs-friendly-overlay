# Quick and dirty build everything for testing and [soon] cache

DEFAULT:
	nix build --no-link \
	.#dpy.abstract-singleton \
	.#dpy.auto-gpt-plugin-template \
	.#dpy.composer \
	.#dpy.coolname \
	.#dpy.databases \
	.#dpy.ddsketch \
	.#dpy.ddtrace \
	.#dpy.envier \
	.#dpy.flake8-quotes \
	.#dpy.loralib \
	.#dpy.ml-dtypes \
	.#dpy.openapi-python-client \
	.#dpy.opentelemetry-api \
	.#dpy.pyre-check \
	.#dpy.pyre-extensions \
	.#dpy.pytorch-ranger \
	.#dpy.sourcery \
	.#dpy.tensorboard \
	.#dpy.tensorboard-data-server \
	.#dpy.tensorflow \
	.#dpy.testslide \
	.#dpy.torch \
	.#dpy.torch-optimizer \
	.#dpy.torchaudio \
	.#dpy.wandb \
	.#dpy.webdriver-manager \
	.#dpy.xformers
