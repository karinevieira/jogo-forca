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

def pedir_chute(chutes, erros)
	puts "Chutes até agora: #{chutes}"
	puts "Erros até agora: #{erros}"
	puts "Agora insira uma letra ou uma palavra: "
	chute = gets.strip
	chute
end