# JoelDeveloper

Projeto iOS estruturado em arquitetura MVVM-C.

Este repositório contém uma app SwiftUI de exemplo com:

- Coordinators (AppCoordinator)
- Scenes (Home, Personal)
- ViewModels e Models
- Tema centralizado em `Common/Theme/AppColors.swift`

Como subir para o GitHub (local):

1. Inicializar git (apenas se ainda não existir):

```bash
git init
git add .
git commit -m "Initial commit — MVVM-C structure"
```

2. Adicionar remote (substitua pela sua URL):

```bash
git remote add origin git@github.com:joelsouza82/JoelDeveloper.git
```

3. Enviar para o GitHub:

```bash
git branch -M main
git push -u origin main
```

GitHub Actions: há um workflow simples em `.github/workflows/ci.yml` que tenta compilar o projeto no macOS runner.
