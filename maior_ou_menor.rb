"# encoding: UTF-8"

def boas_vindas
    puts
    puts "        P  /_\\  P                             "
    puts "       /_\\_|_|_/_\\                           "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \\__|_|__/                             "
    puts
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    nome
end

def pede_dificuldade
    puts "Qual o nível de dificuldade?"
    puts "(1) Muito fácil / (2) Fácil / (3) Normal / (4) Difícil / (5) Impossível"
    puts "Escolha: "
    dificuldade = gets.to_i
end

def sorteio(dificuldade)
	case dificuldade 
	when 1
		max = 30
	when 2
		max = 60
	when 3
		max = 100
	when 4
		max = 150
	else
		max = 200	
	end
	puts "Escolhendo um número secreto de 1 até #{max}..."
	sorteado = rand(max)+1
end

def pede_numero(chutes, tentativas, limite_de_tentativas)
	puts "\nVocê chutou: #{chutes}"
	puts "Tentativa #{tentativas} de #{limite_de_tentativas}"
	chute = gets.strip
end

def verifica(numero, chute)
	acertou = chute.to_i == numero
	if acertou
		puts "Acertou!"
		return true
	end

	maior = numero > chute.to_i
	if maior
		puts "O numero secreto é maior!"
	else
		puts "O número secreto é menor!"
	end
	false
end
	
def joga(nome, dificuldade)
	numero = sorteio(dificuldade)

	pontos_ate_agora = 1000
	limite_de_tentativas = 5
	chutes = []

	#tentativas = 1

	for tentativas in 1..limite_de_tentativas
		chute = pede_numero(chutes, tentativas, limite_de_tentativas)
		chutes << chute

		pontos_a_perder = (chute.to_i - numero).abs / 2.0
		pontos_ate_agora -= pontos_a_perder

		if nome == "joao"
			puts "Acertou!"
			break
		end

		break if verifica numero, chute
	end

	puts "Você ganhou #{pontos_ate_agora} pontos."
end

def nao_quer_jogar?
    puts "Deseja jogar novamente? (S/N)"
    nao_quero_jogar = gets.strip
    nao_quero_jogar.upcase == "N"
end

nome = boas_vindas
dificuldade = pede_dificuldade

loop do
	joga(nome, dificuldade)
	break if nao_quer_jogar?
end
