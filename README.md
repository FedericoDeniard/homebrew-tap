# homebrew-tap

Homebrew formulas for tools by FedericoDeniard.

## Install

```bash
brew tap federicodeniard/tap
brew install pscanner
```

## Available formulas

- [`pscanner`](https://github.com/FedericoDeniard/PortScanner) — TUI to view
  and manage TCP/UDP ports in use on the local machine.

## How this tap is maintained

This tap is updated automatically by a GitHub Actions workflow in each
tool's repository. The release workflow downloads the binaries from the
tool's GitHub Release, computes the SHA-256, and rewrites the formula in
this repo. Do not edit `Formula/*.rb` by hand unless you're cutting a
manual release.
