# ZygoBooks - Rails Challange

## Dependências
- Ruby version 2.5.3
- Bundler version 2.2.20
- Rails version 6.0.3.7
- Node.js
- Yarn

# Ambiente na máquina local

## Clone o repositório para sua máquina
```
git clone https://github.com/tiagohcp/zygo-books.git
```

## Acesse a pasta do projeto
```
cd zygo-books
```
## Configuração

Instale as dependências

```
yarn install
bundle install
```

## Rodando aplicação

1. Inicie o banco de dados local

```
rails db:migrate
```

2. Execute as seeds para popular o banco

```
rails db:seed
```

3. Inicie o servidor rails

```
rails s
```

4. Rodar os testes

```
bin/rspec
```

# Ambiente Admin
Para construir o admin do projeto foi utilizada a gem 'activeadmin', sendo assim ter acesso ao gerenciamento dos livros basta acessar o end-point
```
http://localhost:3000/admin/login
``` 
Ao rodar as seeds é criado um usuário admin com as seguintes credenciais:
```
email: admin@zygo-books.com
senha: admin123
``` 

# Ambiente ZygoBooks
Consiste em uma página em que qualquer usuário pode visualizar a lista de livros, podendo filtrar e ordenar como desejar, acessado pelo end-point
```
http://localhost:3000
``` 

# Gems utilizadas

## Para a aplicação
- ActiveAdmin: Criação do ambiente Admin
- Devise: Autenticação do usuário
- Ransack: Filtragem e ordenação
- Browser: Detecção/exibição de versão mobile de alguns componentes
- WillPaginate: Paginação dos livros

## Para os testes
- RspecRails: Implementação dos testes
- Faker: Mockar informações dos livros
- Capybara: Utilização de métodos auxiliares para os testes
- ShouldaMatchers: Utilização de métodos auxiliares para os testes
- Fabrication: Criação dos objetos que serão testados
- RailsControllerTesting: Utilização de métodos auxiliares para os testes


