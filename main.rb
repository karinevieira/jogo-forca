require_relative 'ui'

def escolher_palavra
  aviso_escolhendo_palavra
  palavras = File.read("dicionario.txt")
  todas_as_palavras = palavras.split "\n"
  numero_escolhido = rand(todas_as_palavras.size)
  palavra = todas_as_palavras[numero_escolhido].downcase
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

def salva_rank(nome, pontos_totais)
  conteudo = "#{nome}\n#{pontos_totais}"
  File.write "rank.txt", conteudo
end

def ler_rank
  arquivo = File.read("rank.txt")
  dados = arquivo.split "\n"
end

nome = da_boas_vindas
def iniciar_jogo(nome)
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
pontos
end

def nao_quer_jogar?
  aviso_jogar_novamente
  quer_jogar = gets.strip
  quer_jogar.upcase == "N"
end

pontos_totais = 0
loop do 
  pontos_totais += iniciar_jogo(nome)
  aviso_pontos_totais(pontos_totais)
  
  if ler_rank[1].to_i < pontos_totais
    salva_rank(nome, pontos_totais)
  end

  if nao_quer_jogar?
    aviso_campeao_atual(ler_rank)
    aviso_jogo_finalizado
	  break
  end
end