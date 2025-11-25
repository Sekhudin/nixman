_: prev: {
  channels =
    {
      inputs,
      nixpkgsArgs,
      prefix ? "nixpkgs-",
    }:
    prev.pipe inputs [
      (prev.filterAttrs (name: _channel: prev.strings.hasPrefix prefix name))
      (prev.mapAttrs' (
        name: channel:
        prev.nameValuePair (prev.strings.removePrefix prefix name) (import channel nixpkgsArgs)
      ))
    ];
}
