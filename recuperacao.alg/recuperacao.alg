algoritmo "GerenciamentoDeReservas"
// Disciplina: Desenvolver Algoritmos
// Descrição: Sistema de gerenciamento de reservas de restaurante utilizando vetores.

var
   // Estrutura de Dados: Vetores unidimensionais paralelos (máx 10 registros)
   vetorNome: vetor [1..10] de caractere
   vetorPessoas: vetor [1..10] de inteiro
   vetorData: vetor [1..10] de caractere
   vetorStatus: vetor [1..10] de caractere
   
   // Variáveis de controle
   opcao, totalReservas, i, ativas: inteiro
   nomeBusca: caractere
   encontrou: logico

inicio
   totalReservas <- 0
   opcao <- 0

   // O menu deve ser repetido até que o usuário escolha a opção 6
   repita
      escreval("========================================")
      escreval("      MENU DO SISTEMA DE RESERVAS       ")
      escreval("========================================")
      escreval("1 - Registrar reserva")
      escreval("2 - Cancelar reserva pelo nome")
      escreval("3 - Buscar reserva pelo nome")
      escreval("4 - Listar todas as reservas")
      escreval("5 - Exibir total de reservas ativas")
      escreval("6 - Sair")
      escreval("========================================")
      escreva("Escolha uma opcao: ")
      leia(opcao)
      escreval("")

      escolha opcao
         caso 1
            escreval("--- 1. Registrar Reserva ---")
            // Verifica se ainda há espaço nos vetores
            se totalReservas < 10 entao
               totalReservas <- totalReservas + 1
               
               escreva("Nome do cliente: ")
               leia(vetorNome[totalReservas])
               
               escreva("Quantidade de pessoas: ")
               leia(vetorPessoas[totalReservas])
               
               escreva("Data da reserva (Ex: 25/10/2023): ")
               leia(vetorData[totalReservas])
               
               // Status padrão ao criar reserva
               vetorStatus[totalReservas] <- "Ativa"
               
               escreval("-> Reserva registrada com sucesso!")
            senao
               escreval("-> ERRO: Capacidade máxima de 10 reservas atingida.")
            fimse

         caso 2
            escreval("--- 2. Cancelar Reserva ---")
            se totalReservas = 0 entao
               escreval("-> Nenhuma reserva cadastrada no sistema.")
            senao
               escreva("Digite o nome do cliente para cancelar: ")
               leia(nomeBusca)
               encontrou <- falso
               
               para i de 1 ate totalReservas faca
                  se vetorNome[i] = nomeBusca entao
                     // Altera apenas o status para "Cancelada"
                     vetorStatus[i] <- "Cancelada"
                     encontrou <- verdadeiro
                     escreval("-> Reserva de ", nomeBusca, " cancelada com sucesso.")
                  fimse
               fimpara
               
               se nao encontrou entao
                  escreval("-> Reserva não encontrada para o nome informado.")
               fimse
            fimse

         caso 3
            escreval("--- 3. Buscar Reserva ---")
            se totalReservas = 0 entao
               escreval("-> Nenhuma reserva cadastrada no sistema.")
            senao
               escreva("Digite o nome do cliente para buscar: ")
               leia(nomeBusca)
               encontrou <- falso
               
               para i de 1 ate totalReservas faca
                  se vetorNome[i] = nomeBusca entao
                     escreval("Cliente: ", vetorNome[i])
                     escreval("Pessoas: ", vetorPessoas[i])
                     escreval("Data   : ", vetorData[i])
                     escreval("Status : ", vetorStatus[i])
                     escreval("-----------------------")
                     encontrou <- verdadeiro
                  fimse
               fimpara
               
               se nao encontrou entao
                  escreval("-> Reserva não encontrada para o nome informado.")
               fimse
            fimse

         caso 4
            escreval("--- 4. Listar Todas as Reservas ---")
            se totalReservas = 0 entao
               escreval("-> Nenhuma reserva cadastrada no sistema.")
            senao
               para i de 1 ate totalReservas faca
                  escreval("Registro [", i, "]")
                  escreval("Cliente: ", vetorNome[i])
                  escreval("Pessoas: ", vetorPessoas[i])
                  escreval("Data   : ", vetorData[i])
                  escreval("Status : ", vetorStatus[i])
                  escreval("-----------------------")
               fimpara
            fimse

         caso 5
            escreval("--- 5. Total de Reservas Ativas ---")
            ativas <- 0
            // Conta utilizando laço e estrutura de decisão
            para i de 1 ate totalReservas faca
               se vetorStatus[i] = "Ativa" entao
                  ativas <- ativas + 1
               fimse
            fimpara
            escreval("-> Total de reservas ATIVAS no momento: ", ativas)

         caso 6
            escreval("Encerrando o sistema...")

         outrocaso
            escreval("-> Opcao invalida. Tente novamente.")
      fimescolha
      escreval("")
   ate opcao = 6
fimalgoritmo