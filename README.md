# WidgetWall (Swift Prototype)

A native macOS menu-bar widgets prototype inspired by WidgetWall.

This repository contains a minimal Swift prototype (menu bar item + sample widget window), a packaging guide, and a GitHub Actions workflow to build a macOS .app artifact in CI.

Status
- Prototype builds locally with the Swift toolchain (`swift build`) and can be run with `swift run`.
- CI workflow (`.github/workflows/build-swift-macos.yml`) builds the package on GitHub Actions (macos-latest) and uploads a zipped `.app` artifact.

Files
- `Package.swift` — Swift package manifest.
- `Sources/WidgetWallSwift/main.swift` — minimal menu bar app with a sample widget window.
- `.github/workflows/build-swift-macos.yml` — GitHub Actions workflow to build and package.
- `docs/PACKAGING.md` — packaging notes and steps.
- `LICENSE` — MIT license.

How to run locally

```bash
# From repo root
cd "native-swift" || exit
swift build
swift run
```

How to push to GitHub

1. Create an empty repository on GitHub.
2. Add the remote and push:

```bash
git remote add origin https://github.com/<youruser>/<yourrepo>.git
git branch -M main
git push -u origin main
```

Once pushed, the GitHub Actions workflow will run on the `main` branch and upload the `.app` zip as an artifact.
