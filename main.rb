require_relative 'ui'

def escolher_palavra
  aviso_escolhendo_palavra
  palavras = File.read("dicionario.txt")
  todas_as_palavras = palavras.split "\n"
  numero_escolhido = rand(todas_as_palavras.size)
  palavra = todas_as_palavras[numero_escolhido]
  aviso_palavra_escolhida(palavra)
  palavra
end

def palavra_mascarada(palavra, chutes)
  mascara = ""
  for letra in palavra.chars
    if chutes.include? letra
      mascara += letra
    else
      mascara += "_"
    end
  end
  mascara
end

def iniciar_jogo
  da_boas_vindas
  palavra = escolher_palavra
  chutes = []
  erros = 0
  pontos = 0
  tentativas = 5
	
  for tentativa in 1..tentativas
    mascara = palavra_mascarada(palavra, chutes)
    chute = pedir_chute(chutes, erros, tentativa, mascara)
    
	if chutes.include? chute
	  aviso_chute_repetido(chute)
	  next
    end
    
	chutes << chute 
	chutou_uma_letra = chute.size == 1

	if chutou_uma_letra
	  letra_procurada = chute[0]
	  total_encontrado = palavra.count letra_procurada
	  if total_encontrado == 0
		erros += 1
		pontos -= 30
	  else
		pontos += 100
	  end
	else
	  if palavra == chute
		aviso_palavra_encontrada
		pontos = 500
		break
	  else
		pontos -= 30
		aviso_palavra_nao_encontrada
	  end
	end
  end
aviso_pontuacao(pontos)
end

def nao_quer_jogar?
  aviso_jogar_novamente
  quer_jogar = gets.strip
  quer_jogar.upcase == "N"
end

loop do 
  iniciar_jogo
  if nao_quer_jogar?
    aviso_jogo_finalizado
	break
  end
end