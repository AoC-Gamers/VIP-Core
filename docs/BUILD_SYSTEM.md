# Build System

Este repositorio usa el flujo homologado de AoC para proyectos solo-`smx`.

## Flujo

1. `make deps-smx`
2. `make build-smx`
3. `make package-smx`
4. `make release`

## Targets

- `deps-smx`: descarga el compilador de SourceMod para el sistema actual.
- `build-smx`: compila `VIP_Core.sp` y genera un árbol local en `.build/smx`.
- `package-smx`: arma el paquete intermedio en `.build/package-smx`.
- `release`: genera `dist/sourcemod/artifact` y el ZIP final en `dist/release/`.

## Manifiesto

El archivo [plugin-package-map.json](../plugin-package-map.json) define:

- qué plugin se compila
- qué fuentes y submódulos se adjuntan
- qué include público se publica
- qué traducciones y datos forman parte del artifact
