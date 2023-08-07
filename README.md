# K. Bank
![Captura de tela de 2023-08-06 23-53-13](https://github.com/michell-monteiro/kaz_bank/assets/97468360/bbf43dd5-0d07-44b9-80a6-2b4cd9e4cd9b)

Desafio final proposto no curso da empresa Kazap.

O desafio consiste na criação de um sistema bancário. O projeto ainda está em andamento, mas já pode ser testado.

# Configuração básica
* Crie um Gemfile e instale as gems necessárias
* Digite o seguinte código arquivo Gemfile
  'source "https:://rubygems.org"'

  gem 'sequel'
  gem 'sqlite3'

  Digite no prompt:
  `bundle install`

  # Faça as migrations
  Dentro do prompt você precisará fazer a migration. Digite o comando:
  `sequel -m db/migrations sqlite://db/kazbank.db`

  # Teste o programa
  Agora é só aproveitar o programa
