class Draw_Interface

    # Clean the screen
    def clean_screen
        system('clear')
    end

    # Draw the first view for the user
    def interface_home
        clean_screen
        puts ' ___________________________________________________'
        puts '|___________________________version:0.0.1(beta)_____|'
        puts '|   _   __    _____      ___     _      _   __  __  |'
        puts '|  | | / /   |  _  \    / _ \   | \    | | | | / /  |'
        puts '|  | |/ /    | |_|  |  / | | \  |  \   | | | |/ /   |'
        puts '|  |   /     |     /  |  |_|  | |   \  | | |   /    |'
        puts '|  | \ \     |  _  \  |   _   | | |\ \ | | | \ \    |'
        puts '|  | |\ \    | |_|  | |  | |  | | | \  \ | | |\ \   |'
        puts '|  |_|_\_\O  |_____/  |__| |__| |_|  \___| |_| \_\  |'
        puts '|___________________________________________________|'
    end

    # Draw the first output message to the user
    def welcome_message
        puts '|             Bem-vindo ao Banco K.Bank             |'
        puts '|    Só aqui o seu dinheiro repousa em segurança    |'
        puts '|                                                   |'
        puts '|     (Pressione qualquer tecla para prosseguir)    |'
        puts '|___________________________________________________|'
    end

    # Draw the first output message to the user
    def advice_message
        puts '|     Este é um software teste que simula um        |'
        puts '|    sistema bancário. Todas as interações são      |'
        puts '|            inteiramente fictícias.                |'
        puts '|     (Pressione qualquer tecla para prosseguir)    |'
        puts '|___________________________________________________|'
    end

    # Draw the first output message to the user
    def main_access_screen
        puts '|                                                   |'
        puts '|              1. Área do Cliente                   |'
        puts '|              2. Conta bancária                    |'
        puts '|              3.      Sair                         |'
        puts '|___________________________________________________|'
    end

    def main_costumer_screen
        puts '|                                                   |'
        puts '|              1. Cadastrar Cliente                 |'
        puts '|              2.       Checar                      |'
        puts '|              3.       Voltar                      |'
        puts '|___________________________________________________|'
    end

    def main_account_screen
        puts '|                                                   |'
        puts '|              1.   Cadastrar Conta                 |'
        puts '|              2.     Transações                    |'
        puts '|              3.       Voltar                      |'
        puts '|___________________________________________________|'
    end

    def account_register_screen
        puts '| -----> Cadastrar com:                             |'
        puts '|                                                   |'
        puts '|              1.   Id do cliente                   |'
        puts '|              2.      Voltar                       |'
        puts '|___________________________________________________|'
    end

    def account_financial_transaction
        puts '| -----> Realizar:                                  |'
        puts '|                                                   |'
        puts '|              1.     Depósito                      |'
        puts '|              2.      Saque                        |'
        puts '|              3.   Transferência                   |'
        puts '|              4.      Voltar                       |'
        puts '|___________________________________________________|'
    end
end