def da_boas_vindas
	puts "Bem-vindo ao Jogo da Forca"
	puts "Qual é o seu nome?"
	nome = gets.strip
	puts "Vamos iniciar o jogo para você, #{nome}"
	puts "\n"
end

def escolher_palavra
	puts "Escolhendo uma palavra..."
	palavra = "programador"
	puts "A palavra escolhida tem #{palavra.size} letras, boa sorte!"
	puts "\n"
	palavra
end

def pedir_chute
	puts "Agora insira uma letra ou uma palavra: "
	chute = gets.strip
	chute
end

def iniciar_jogo
	da_boas_vindas
	palavra = escolher_palavra
	acertos = []
	erros = []
	pontos = 1000
	tentativas = 5
	
	for tentativa in 1..tentativas
		puts "Tentativa #{tentativa}"
		puts "Acertos até agora: #{acertos}"
		puts "Erros até agora: #{erros}"
		chute = pedir_chute 
		chutou_uma_letra = chute.size == 1

		if chutou_uma_letra
			letra_procurada = chute[0]
			total_encontrado = palavra.count letra_procurada
			if total_encontrado == 0
				erros << letra_procurada
				puts "Você não encontrou nenhuma letra."
				pontos -= 200
			else
				acertos << letra_procurada
				puts "Você encontrou #{total_encontrado} letras."
			end
		else
			if palavra == chute
				puts "Parabéns, você acertou!"
				break
			else
				pontos -= 200
				puts "Não foi dessa vez... tente novamente"
			end
		end
	end
puts "Você fez #{pontos}."
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