require_relative 'ui'

def iniciar_jogo
	da_boas_vindas
	palavra = escolher_palavra
	chutes = []
	erros = 0
	pontos = 0
	tentativas = 5
	
	for tentativa in 1..tentativas
		puts "Tentativa #{tentativa}"
		chute = pedir_chute(chutes, erros)
		if chutes.include? chute
			puts "Você já chutou #{chute}"
			next
		end
		chutes << chute 
		chutou_uma_letra = chute.size == 1

		if chutou_uma_letra
			letra_procurada = chute[0]
			total_encontrado = palavra.count letra_procurada
			if total_encontrado == 0
				erros += 1
				puts "Você não encontrou nenhuma letra."
				pontos -= 30
			else
				puts "Você encontrou #{total_encontrado} letras."
				pontos += 100
			end
		else
			if palavra == chute
				puts "Parabéns, você acertou!"
				pontos = 500
				break
			else
				pontos -= 30
				puts "Não foi dessa vez... tente novamente"
			end
		end
	end
puts "Você fez #{pontos} pontos."
end

def nao_quer_jogar?
	puts "Deseja jogar novamente? (S/N)"
	quer_jogar = gets.strip
	quer_jogar.upcase == "N"
end

loop do 
	iniciar_jogo
	if nao_quer_jogar?
		puts "Jogo finalizado"
		break
	end
end