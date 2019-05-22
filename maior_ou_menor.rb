"# encoding: UTF-8"

def boas_vindas
	puts "Bem vindo ao jogo da adivinhação"
	puts "\nInsira seu nome:" 
	nome = gets

	puts "\nComeçaremos o jogo para você, " + nome 	
end
def sorteio
	puts "Escolhendo um número secreto de 0 a 10..."
	sorteado = 7
end
def pede_numero(tentativas, limite_de_tentativas)
	puts "\nTentativa " + tentativas.to_s + " de " + limite_de_tentativas.to_s
	chute = gets
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

#tentativas = 1

for tentativas in 1..limite_de_tentativas
	chute = pede_numero tentativas, limite_de_tentativas
	break if verifica numero, chute
end
