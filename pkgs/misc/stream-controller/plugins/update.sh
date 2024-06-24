#!/usr/bin/env nix-shell
#!nix-shell -i bash -p jq -p ripgrep -p nix-prefetch-git -p nix-prefetch-github

STREAM_CONTROLLER_VERSION=$(nix eval --json .\#pkgsDebug.stream-controller | jq -r | sed -e 's/.*StreamController-//')

VERSION_BRANCHES=$(curl https://raw.githubusercontent.com/StreamController/StreamController-Store/versions/versions.json)
#VERSION_BRANCHES=$(cat ./versions.json)
STORE_BRANCH_NAME=$(echo "$VERSION_BRANCHES" | jq ".[\"$STREAM_CONTROLLER_VERSION\"]" -r)

PLUGINS=$(curl "https://raw.githubusercontent.com/StreamController/StreamController-Store/$STORE_BRANCH_NAME/Plugins.json")
#PLUGINS=$(cat ./Plugins.json)

REPO_REGEX="repo = \"(.*)\";$"
OWNER_REGEX="owner = \"(.*)\";$"

for f in "$(dirname "${BASH_SOURCE[0]}")"/*/default.nix; do
    PLUGIN_OWNER=$(rg "$OWNER_REGEX" --no-line-number --replace='$1' "$f" | xargs)
    PLUGIN_REPO=$(rg "$REPO_REGEX" --no-line-number --replace='$1' "$f" | xargs)

    PLUGIN_INFO=$(echo "$PLUGINS" | jq ".[] | select(.url==\"https://github.com/$PLUGIN_OWNER/$PLUGIN_REPO\") | .commits | to_entries | .[-1:][0]")

    PLUGIN_VERSION=$(echo "$PLUGIN_INFO" | jq '.key' -r)
    PLUGIN_REV=$(echo "$PLUGIN_INFO" | jq '.value' -r)
    GITHUB_PREFETCH=$(nix-prefetch-github "$PLUGIN_OWNER" "$PLUGIN_REPO" --rev "$PLUGIN_REV")
    PLUGIN_HASH=$(echo "$GITHUB_PREFETCH" | jq .hash -r)

    sed -i "s#version = \".*\";#version = \"$PLUGIN_VERSION\";#" "$f"
    sed -i "s#rev = \".*\";#rev = \"$PLUGIN_REV\";#" "$f"
    sed -i "s#hash = \".*\";#hash = \"$PLUGIN_HASH\";#" "$f"
done



