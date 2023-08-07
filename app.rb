require './classes/draw_interface'
require 'sequel'

DB = Sequel.sqlite('db/kazbank.db')

require_relative 'models/costumer.rb'
require_relative 'models/account.rb'

first_loop = false # Verifica se a primeira iteração já foi feita
screen = Draw_Interface.new #Etapa 1: Iniciando interface Principal
def search_datas
  costumers = Costumer
  costumers.each do |costumer|
    puts "Id: #{costumer.id}| Nome: #{costumer.name}| Documento: #{costumer.doc}| Endereço: #{costumer.address}| Telefone: #{costumer.phone}"
  end
end

loop do

  # This message will be run only one time
  if !first_loop
    screen.interface_home
    screen.welcome_message
    gets
    screen.interface_home
    screen.advice_message
    gets
    first_loop = true
  end

  screen.interface_home
  screen.main_access_screen
  option = gets.chomp.to_i

  case option
  when 1
    #Costumer screen
    screen.interface_home
    screen.main_costumer_screen
    option = gets.chomp.to_i
    case option
    when 1
      #Cadastro de cliente
      begin
        datas = {}
        print 'Nome: '
        datas[:name] = gets.chomp
        print 'RG/CPF: '
        datas[:doc] = gets.chomp
        print 'Logradouro: '
        datas[:address] = gets.chomp
        print 'Telefone: '
        datas[:phone] = gets.chomp

        costumer = Costumer.new(
          name: datas[:name], 
          doc: datas[:doc], 
          address: datas[:address], 
          phone: datas[:phone]
        )
        costumer.save
      rescue Sequel::ValidationFailed => e
        puts "Erro: #{e.message}"
      rescue Sequel::UniqueConstraintViolation => e
        puts "Erro: #{e.message}"
      end
    when 2
      #Teste
      # Checar base de dados
      # costumers = Costumer
      # costumers.each do |costumer| #Acesso cada objeto dessa classe e exibo dados
      #   # if costumer.name == 'Alan'
      #   #   costumer.balance += 100
      #   #   costumer.save
      #   # end
      #   puts "Nome: #{costumer.name}| Documento: #{costumer.doc}| Endereço: #{costumer.address}| Telefone: #{costumer.phone}" #| Saldo: #{costumer.balance}"
      # end
      gets
    end
  when 2
    screen.interface_home
    screen.main_account_screen
    option = gets.chomp.to_i
    case option
    when 1
      screen.interface_home
      screen.account_register_screen
      option = gets.chomp.to_i
      case option
      when 1
        screen.interface_home
        puts '--------> Pequisa / Nome'
        print 'Digite o ID: '
        search_datas
        choose = gets.chomp.to_i

        if costumers = Costumer.where(id: choose).all
          unless costumers == []
            # O cliente escolhe o seu número de conta
            puts 'Digite o seu número de conta desejado.'
            puts 'Ele será usado para acessar a conta.'
            print 'Número: '
            login = gets.chomp.to_i
            account = Account.new(
              costumer_id: choose,
              access_account: login
            )
            account.save
            accounts = Account
            accounts.each do |acc|
              puts "Número: #{acc.access_account}| #{acc.costumer_id}| #{acc.balance}"
            end
          else
            p 'ID não existe'
          end
        end
        gets        
      when 2
        return
      end
    when 2
      screen.interface_home
      screen.account_financial_transaction
      option = gets.chomp.to_i
      case option
      when 1
        screen.interface_home
        puts 'Deseja depositar em qual conta?'
        search_datas
        option = gets.chomp.to_i
        print 'Valor: '
        value = gets.chomp.to_f
        account = Account.where(costumer_id: option).all
        p account.balance
        value += account
        Account.where(costumer_id: option).update(balance: value)

        account.update(balance: value)
        accounts = Account
        accounts.each do |acc|
          puts "Número: #{acc.access_account}| #{acc.costumer_id}| #{acc.balance}"
        end
        gets
      when 2

      when 3

      when 4
      end
      # Tela de operações com opções TED, PIX e DEPÓSITO
      # Se TED, aplicar juros
      # A opção PÍX não tem juros
      # Em ambas as opções, selecionar conta de saída de dinheiro e a recebedora. Deve ser possível visualizar o saldo
      # Na opção DEPÓSITO, Buscar conta que receberá depósito. Digitar o valor de Entrada e atualizar o valor na conta
    when 3
      return
    else
    
    end
  when 3
    break
  end

  #Teste excepetion
  # begin
    # costumer = Costumer.new(name: 'Aurea', doc: 123456783, address: 'Rua da lua', phone: 1025661)
    # costumer.save
  # rescue Sequel::ValidationFailed
    # puts "Ocorreu um erro. Dados estão faltando"
  # end

  # #Crio uma variável que recebe a classe Costumer
  costumers = Costumer
  costumers.each do |costumer| #Acesso cada objeto dessa classe e exibo dados
    # if costumer.name == 'Alan'
    #   costumer.balance += 100
    #   costumer.save
    # end
    puts "Nome: #{costumer.name}| Documento: #{costumer.doc}| Endereço: #{costumer.address}| Telefone: #{costumer.phone}" #| Saldo: #{costumer.balance}"
  end
end