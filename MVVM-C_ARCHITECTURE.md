# JoelDeveloper - MVVM-C Architecture

Este projeto foi estruturado seguindo o padrão **MVVM-C** (Model-View-ViewModel-Coordinator).

## Estrutura do Projeto

```
JoelDeveloper/
├── Coordinators/          # Gerenciadores de navegação
│   ├── Coordinator.swift  # Protocolo base
│   └── AppCoordinator.swift
├── Scenes/                # Telas da aplicação
│   └── Home/
│       ├── HomeView.swift
│       ├── HomeViewModel.swift
│       └── HomeCoordinator.swift
├── Models/                # Estruturas de dados
│   └── User.swift
├── Common/                # Componentes reutilizáveis
│   └── Extensions/
│       └── View+ext.swift
├── Assets.xcassets/
├── JoelDeveloperApp.swift # Entry point
└── ContentView.swift      # Pode ser deletado
```

## Componentes

### 🎯 Coordinator Pattern
- **AppCoordinator**: Gerencia a navegação entre telas
- **SceneCoordinator**: Gerencia coordinators de telas específicas
- Facilita a testabilidade e desacoplamento

### 🎨 View (MVVM)
- Views que lidam apenas com apresentação
- Não contêm lógica de negócio
- Observam o ViewModel

### 🧠 ViewModel
- Contém toda lógica de apresentação
- @Published properties para reatividade
- Comunica com Services/Models

### 📦 Model
- Estruturas de dados
- Lógica de domínio
- Codable para persistência

### 🛠️ Common
- Extensões reutilizáveis
- Componentes compartilhados
- Utilitários

## Como Adicionar uma Nova Tela

1. Crie uma pasta em `Scenes/NomeTela/`:
   ```
   Scenes/NomeTela/
   ├── NomeTelaView.swift
   ├── NomeTelaViewModel.swift
   └── NomeTelaCoordinator.swift
   ```

2. Implemente o ViewModel:
   ```swift
   class NomeTelaViewModel: ObservableObject {
       @Published var title = "Título"
       
       func loadData() {
           // Lógica aqui
       }
   }
   ```

3. Implemente a View:
   ```swift
   struct NomeTelaView: View {
       @ObservedObject var viewModel: NomeTelaViewModel
       
       var body: some View {
           VStack {
               Text(viewModel.title)
           }
       }
   }
   ```

4. Implemente o Coordinator:
   ```swift
   class NomeTelaCoordinator: ObservableObject {
       @Binding var navigationPath: NavigationPath
       @StateObject private var viewModel = NomeTelaViewModel()
       
       init(navigationPath: Binding<NavigationPath>) {
           self._navigationPath = navigationPath
       }
       
       @MainActor
       func start() -> some View {
           NomeTelaView(viewModel: viewModel)
       }
   }
   ```

4. Integre no AppCoordinator ou em outro coordinator

## Padrão de Coordinator

O `AppCoordinator` gerencia o fluxo de navegação principal:
```swift
final class AppCoordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()
    
    @MainActor
    func start() -> some View {
        NavigationStack(path: $navigationPath) {
            HomeCoordinator().start()
        }
        .environmentObject(self)
    }
}
```

Coordinators de telas são structs que retornam Views:
```swift
struct NomeTelaCoordinator {
    @MainActor
    func start() -> some View {
        NomeTelaView(viewModel: NomeTelaViewModel())
    }
}
```

## Benefícios da Arquitetura MVVM-C

✅ **Separação de responsabilidades** - Cada componente tem um papel claro
✅ **Testabilidade** - ViewModels são fáceis de testar
✅ **Reusabilidade** - Componentes podem ser reutilizados
✅ **Manutenibilidade** - Código organizado e escalável
✅ **Navegação centralizada** - Coordinators gerenciam fluxos

---

Agora seu projeto está pronto para ser expandido com a arquitetura MVVM-C! 🚀
