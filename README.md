# 📺 SL TV

SL TV é um aplicativo de streaming desenvolvido em Flutter com o objetivo de demonstrar conhecimentos em arquitetura de apps, consumo de dados, navegação, gerenciamento de estado e reprodução de mídia.  
O projeto é **exclusivamente educacional**...

## Objetivo

Este projeto foi criado para fins de portfólio, com foco em:
- Estruturação de um app de streaming
- Boas práticas de organização de código
- Consumo de dados simulados e/ou APIs
- Experiência de usuário semelhante a plataformas de streaming

## Tecnologias Utilizadas

- Flutter
- Dart
- Material Design
- Arquitetura modularizada (camadas separadas)

## Funcionalidades Planejadas

- ✅ Tela inicial com catálogo de vídeos
- [ ] Detalhes do conteúdo
- [ ] Player de vídeo
- [ ] Listagem por categorias
- [ ] Favoritos
- [ ] Histórico de reprodução
- [ ] Dados simulados ou backend próprio

## Estrutura do Projeto
```
lib/
 ├─ core/
 │   ├─ constants/
 │   ├─ theme/
 │   └─ utils/
 ├─ data/
 │   ├─ models/
 │   ├─ services/
 │   └─ repositories/
 ├─ ui/
 │   ├─ pages/
 │   ├─ widgets/
 │   └─ controllers/
 └─ main.dart
 ```

## Status do Projeto

Em desenvolvimento.

## Observações Importantes

- O app **não distribui conteúdo real**
- Os vídeos utilizados serão exemplos públicos, simulados ou locais
- Projeto criado apenas para estudo e demonstração técnica

## Autor

Stefan Lucas  
Projeto desenvolvido para portfólio pessoal

## ▶️ Como rodar e testar o app

Este projeto foi desenvolvido em Flutter. Siga os passos abaixo para executar o app localmente e gerar o APK para testes.

### 📌 Pré-requisitos

 - Flutter SDK instalado
 - Android Studio ou VS Code
 - Android SDK configurado
 - Um emulador Android ou um celular físico (com Depuração USB ativada)
 
Verifique se o ambiente está correto:
```
flutter doctor
```

## ▶️ Rodar o app em modo desenvolvimento

Clone o repositório:
```
git clone https://github.com/stefanluks/sl_tv.git
```

Acesse a pasta do projeto:
```
cd sl_tv
```

Instale as dependências:
```
flutter pub get
```

> Conecte um dispositivo ou inicie um emulador

Execute o app:
```
flutter run
```

### 📱 Gerar APK para testes (Release)

Para gerar um APK instalável em qualquer celular Android:
```
flutter build apk --release
```

O arquivo será gerado em:
```
build/app/outputs/flutter-apk/app-release.apk
```

Copie o APK para o celular e instale normalmente.

### 🔒 Permitir instalação no celular

No Android:

Ative Instalar apps de fontes desconhecidas

Permita a instalação para o app usado (Files, Chrome, etc.)

🔄 Observações importantes

 - O app roda offline, usando dados mockados
 - O player de vídeo funciona em modo paisagem (tela cheia)
 - A Home e tela de detalhes são travadas em modo retrato
 - Este projeto é apenas educacional/demonstração