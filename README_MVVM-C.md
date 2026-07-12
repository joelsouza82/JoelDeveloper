# MVVM-C Architecture - JoelDeveloper

## Visão Geral da Arquitetura

```
AppCoordinator (Estado + Navegação)
        ↓
NavigationStack (Gerencia rotas)
        ↓
HomeView ← HomeViewModel ← Models
```

## Como Funciona

### 1. **AppCoordinator** (Coordinator Pattern)
Centraliza toda a navegação e o estado compartilhado:

```swift
final class AppCoordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()
}
```

### 2. **JoelDeveloperApp** (Entry Point)
Configura o coordinator e o environment:

```swift
@main
struct JoelDeveloperApp: App {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.navigationPath) {
                HomeView(viewModel: HomeViewModel())
            }
            .environmentObject(coordinator)  // Disponível em toda árvore
        }
    }
}
```

### 3. **HomeView** (View)
Observa o ViewModel e acessa o Coordinator:

```swift
struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel      // Lógica
    @EnvironmentObject var coordinator: AppCoordinator // Navegação
    
    var body: some View {
        VStack {
            Text(viewModel.title)
        }
        .navigationTitle("Home")
    }
}
```

### 4. **HomeViewModel** (ViewModel)
Contém toda a lógica de apresentação:

```swift
class HomeViewModel: ObservableObject {
    @Published var title: String = "Hello, world!"
    
    func loadData() {
        // Lógica de negócio aqui
    }
}
```

## Responsabilidades

| Camada | Responsabilidade |
|--------|-----------------|
| **Model** | Estruturas de dados, lógica de domínio |
| **ViewModel** | Transformação de dados, lógica de apresentação |
| **View** | Apenas renderização da UI |
| **Coordinator** | Gerenciamento de navegação e fluxo |

## Como Adicionar Uma Nova Tela

### 1. Criar o ViewModel
```swift
class DetailViewModel: ObservableObject {
    @Published var title: String = "Detalhes"
    
    init(id: Int) {
        // Carregar dados baseado em ID
    }
}
```

### 2. Criar a View
```swift
struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text(viewModel.title)
            Button("Voltar") {
                coordinator.navigationPath.removeLast()
            }
        }
        .navigationTitle("Detalhes")
    }
}
```

### 3. Definir as Rotas (Recomendado)
```swift
enum Route: Hashable {
    case home
    case detail(id: Int)
    case settings
}
```

### 4. Atualizar AppCoordinator
```swift
final class AppCoordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()
}
```

### 5. Atualizar JoelDeveloperApp
```swift
NavigationStack(path: $coordinator.navigationPath) {
    HomeView(viewModel: HomeViewModel())
        .navigationDestination(for: Route.self) { route in
            switch route {
            case .home:
                HomeView(viewModel: HomeViewModel())
            case .detail(let id):
                DetailView(viewModel: DetailViewModel(id: id))
            case .settings:
                SettingsView()
            }
        }
}
```

### 6. Navegar na View
```swift
Button("Ir para Detalhes") {
    coordinator.navigationPath.append(Route.detail(id: 1))
}
```

## Benefícios

✅ **Separação de responsabilidades** clara  
✅ **Testabilidade** - ViewModels são isolados  
✅ **Reusabilidade** - Componentes independentes  
✅ **Navegação centralizada** - Fácil de gerenciar fluxos complexos  
✅ **Escalabilidade** - Padrão pronto para crescer  

## Estrutura de Pastas

```
JoelDeveloper/
├── Coordinators/
│   └── AppCoordinator.swift
├── Scenes/
│   └── Home/
│       ├── HomeView.swift
│       └── HomeViewModel.swift
├── Models/
│   └── User.swift
├── Common/
│   └── Extensions/
│       └── View+ext.swift
├── JoelDeveloperApp.swift
└── Assets.xcassets/
```

## Próximas Etapas

1. Crie mais ViewModels conforme necessário
2. Defina suas rotas de navegação
3. Implemente a lógica de negócio nos ViewModels
4. Use o Coordinator para gerenciar o fluxo da aplicação

---

**Seu projeto está 100% estruturado em MVVM-C e pronto para crescer!** 🚀
