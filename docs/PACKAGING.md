Packaging & CI for WidgetWall Swift Prototype

This document describes how to build the Swift prototype locally and via GitHub Actions.

Local build
1. Ensure you have the Swift toolchain installed (Xcode or swift toolchain).
2. From repository root:

```bash
cd "Project Files/widgetwall-swift"
swift build -c release
swift run
```

3. The GitHub workflow creates an app bundle in `dist/WidgetWall.app`.

GitHub Actions
- The workflow `.github/workflows/build-swift-macos.yml` will build on `macos-latest`, create a minimal `.app` bundle, and upload it as an artifact.
- To use it, push to the `main` branch or trigger via the GitHub Actions UI.

Notes
- The created app is minimal and unsigned; if you want to distribute it to users you should codesign and notarize it using Xcode or `altool`.
- The prototype is intentionally minimal and designed to be opened in Xcode for iterative UI development.
