📱 Catálogo Dinâmico Multi-Telas (Flutter)

Este projeto foi desenvolvido como parte da Aula 10 da disciplina de Programação para Dispositivos Móveis I, abordando temas avançados no desenvolvimento de aplicações mobile com Flutter, incluindo consumo e tratamento de JSON, gerenciamento de estados da interface, tratamento de exceções (try/catch) e renderização otimizada via ListView.builder.

🎯 Objetivos do Projeto

Modelagem OO e Tipagem Estrita: Mapeamento de payloads JSON brutos para classes e objetos Dart fortemente tipados utilizando construtores e factory method (fromJson).

Regras de Negócio e Reatividade: Implementação do getter temEstoqueCritico para aplicar alertas visuais imediatos na UI caso a quantidade em estoque seja menor que 5.

Gestão da Matriz de Estados da UI: Tratamento visual para os estados de carregamento (CircularProgressIndicator), sucesso (lista renderizada), e lista vazia / erro.

Performance e Escalabilidade: Utilização do ListView.builder para reciclagem de memória (Lazy Loading), evitando sobrecarga de RAM no dispositivo.

🛠️ Tecnologias Utilizadas

Linguagem: Dart

Framework: Flutter (Material Design 3)

Editor: Visual Studio Code

📂 Estrutura do Projeto

A arquitetura do projeto segue a separação por responsabilidades em pastas organizadas dentro de lib/:

lib/
├── models/
│   └── produto.dart        # Modelo de dados e conversão fromJson
├── widgets/
│   └── produto_card.dart   # Componente visual isolado (Card + ListTile)
├── screens/
│   └── catalogo_screen.dart # Tela principal com gerenciamento de estado
└── main.dart               # Ponto de entrada da aplicação


🚀 Como Executar o Projeto

Pré-requisitos

Flutter SDK instalado e configurado nas variáveis de ambiente.

Emulador Android/iOS configurado ou dispositivo físico conectado via USB.

Passo a passo

Clone o repositório:

git clone https://github.com/SEU-USUARIO/catalogo-dinamico-flutter.git


Acesse a pasta do projeto:

cd catalogo-dinamico-flutter


Instale as dependências:

flutter pub get


Execute o aplicativo:

flutter run


🧪 Níveis do Laboratório Cumpridos

[x] Nível 1 (Estrutura): Dicionário JSON mapeado para Produto, tratamento de Null Safety e implementação do getter temEstoqueCritico.

[x] Nível 2 (Interface): Criação do widget ProdutoCard e utilização do ListView.builder com suporte ao botão de recarregar dados.

[x] Nível 3 (Polimento e Controle): Alerta visual e reativo com ícones em vermelho para produtos com baixo estoque e gerenciamento do estado _isLoading.
