"# encoding: UTF-8"

def boas_vindas
	puts "Bem vindo ao jogo da adivinhação"
	puts "\nInsira seu nome:" 
	nome = gets

	puts "\nComeçaremos o jogo para você, #{nome}"	
end
def sorteio
	puts "Escolhendo um número secreto de 0 a 10..."
	sorteado = 7
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
	
boas_vindas
numero = sorteio

limite_de_tentativas = 5
chutes = []

#tentativas = 1

for tentativas in 1..limite_de_tentativas
	chute = pede_numero(chutes, tentativas, limite_de_tentativas)
	chutes << chute
	break if verifica numero, chute
end
