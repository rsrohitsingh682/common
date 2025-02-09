# common

Nix-based project configuration shared between nammayatri repositories

## What's provided

- A `lib.mkFlake` function uses flake-parts.lib.mkFlake, in addition to providing:
  - Shared `nixpkgs` input
  - Automatic setting of `systems` (using nix-systems)
  - Automatic importing of the common flakeModule.
- The common flakeModule provides:
  - treefmt-based autoformatters: ormolu, hlint, dhall-format, nixpkgs-fmt
  - `mission-control`
  - `process-compose-flake`
  - pre-commit hooks
  - Language specific features
    - Rust: crane and rust-overlay
    - Python: extra Python packages
    - Haskell
      - ~~GHC 8.10 package set (matching LTS 16.31 in part)~~ (DEPRECATED, file and references kept for posterity only)
      - GHC 9.2.7 package set
      - Avoid global tool caches (`no-global-cache.nix`)
      - Common `package.yaml` (hpack) configuration
