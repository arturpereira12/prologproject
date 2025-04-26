% Jogo de adivinhação de países
% Este arquivo contém a lógica do jogo, separada dos dados.
:- encoding(utf8).

% Importa o módulo de dados dos países
:- use_module(paises_dados).

% Variáveis dinâmicas para controle do jogo
:- dynamic paises_possiveis/1.
:- dynamic perguntas_feitas/1.
:- dynamic nivel_dificuldade/1.
:- dynamic tentativas_restantes/1.
:- dynamic jogos_ganhos/1.
:- dynamic jogos_perdidos/1.
:- dynamic perguntas_ineficientes/1.

% Inicializa variáveis do jogo
inicializa_jogo :-
    retractall(paises_possiveis(_)),
    findall(Pais, pais(Pais, _, _, _, _, _, _), Paises),
    assert(paises_possiveis(Paises)),
    retractall(perguntas_feitas(_)),
    assert(perguntas_feitas([])),
    retractall(perguntas_ineficientes(_)),
    assert(perguntas_ineficientes(0)),
    
    % Define o número de tentativas baseado na dificuldade
    nivel_dificuldade(Nivel),
    (Nivel = facil ->
        NumTentativas = 20
    ; Nivel = medio ->
        NumTentativas = 15
    ; Nivel = dificil ->
        NumTentativas = 10
    ; % Padrão
        NumTentativas = 15
    ),
    retractall(tentativas_restantes(_)),
    assert(tentativas_restantes(NumTentativas)).

% Inicializa estatísticas do jogo
inicializa_estatisticas :-
    (jogos_ganhos(_) -> true; assert(jogos_ganhos(0))),
    (jogos_perdidos(_) -> true; assert(jogos_perdidos(0))),
    (nivel_dificuldade(_) -> true; assert(nivel_dificuldade(medio))).

% Tipos de perguntas disponíveis por categoria
tipo_pergunta(continente_europa, continente, europa).
tipo_pergunta(continente_asia, continente, asia).
tipo_pergunta(continente_america_norte, continente, america_norte).
tipo_pergunta(continente_america_sul, continente, america_sul).
tipo_pergunta(continente_africa, continente, africa).
tipo_pergunta(continente_oceania, continente, oceania).
tipo_pergunta(populacao_grande, populacao_grande, _).
tipo_pergunta(populacao_media, populacao_media, _).
tipo_pergunta(populacao_pequena, populacao_pequena, _).
tipo_pergunta(fala_ingles, fala_idioma, ingles).
tipo_pergunta(fala_espanhol, fala_idioma, espanhol).
tipo_pergunta(fala_frances, fala_idioma, frances).
tipo_pergunta(fala_arabe, fala_idioma, arabe).
tipo_pergunta(fala_portugues, fala_idioma, portugues).
tipo_pergunta(fala_russo, fala_idioma, russo).
tipo_pergunta(fala_alemao, fala_idioma, alemao).
% Perguntas sobre idiomas adicionais
tipo_pergunta(fala_italiano, fala_idioma, italiano).
tipo_pergunta(fala_chines, fala_idioma, chines).
tipo_pergunta(fala_japones, fala_idioma, japones).
tipo_pergunta(fala_coreano, fala_idioma, coreano).
tipo_pergunta(fala_hindi, fala_idioma, hindi).
tipo_pergunta(fala_holandes, fala_idioma, holandes).
tipo_pergunta(fala_sueco, fala_idioma, sueco).
tipo_pergunta(fala_grego, fala_idioma, grego).
tipo_pergunta(fala_turco, fala_idioma, turco).
tipo_pergunta(fala_polones, fala_idioma, polones).
tipo_pergunta(expectativa_alta, expectativa_alta, _).
tipo_pergunta(expectativa_media, expectativa_media, _).
tipo_pergunta(expectativa_baixa, expectativa_baixa, _).
tipo_pergunta(area_grande, area_grande, _).
tipo_pergunta(area_media, area_media, _).
tipo_pergunta(area_pequena, area_pequena, _).
% Perguntas sobre PIB
tipo_pergunta(pib_muito_alto, pib_muito_alto, _).
tipo_pergunta(pib_alto, pib_alto, _).
tipo_pergunta(pib_medio, pib_medio, _).
tipo_pergunta(pib_baixo, pib_baixo, _).
% Perguntas sobre taxa de nascimento
tipo_pergunta(natalidade_alta, natalidade_alta, _).
tipo_pergunta(natalidade_media, natalidade_media, _).
tipo_pergunta(natalidade_baixa, natalidade_baixa, _).
% Perguntas sobre letras dos nomes
tipo_pergunta(comeca_com_a, comeca_com, a).
tipo_pergunta(comeca_com_b, comeca_com, b).
tipo_pergunta(comeca_com_c, comeca_com, c).
tipo_pergunta(comeca_com_d, comeca_com, d).
tipo_pergunta(comeca_com_e, comeca_com, e).
tipo_pergunta(comeca_com_f, comeca_com, f).
tipo_pergunta(comeca_com_g, comeca_com, g).
tipo_pergunta(comeca_com_h, comeca_com, h).
tipo_pergunta(comeca_com_i, comeca_com, i).
tipo_pergunta(comeca_com_j, comeca_com, j).
tipo_pergunta(comeca_com_l, comeca_com, l).
tipo_pergunta(comeca_com_m, comeca_com, m).
tipo_pergunta(comeca_com_n, comeca_com, n).
tipo_pergunta(comeca_com_o, comeca_com, o).
tipo_pergunta(comeca_com_p, comeca_com, p).
tipo_pergunta(comeca_com_r, comeca_com, r).
tipo_pergunta(comeca_com_s, comeca_com, s).
tipo_pergunta(comeca_com_t, comeca_com, t).
tipo_pergunta(comeca_com_u, comeca_com, u).
tipo_pergunta(comeca_com_v, comeca_com, v).
tipo_pergunta(termina_com_a, termina_com, a).
tipo_pergunta(termina_com_e, termina_com, e).
tipo_pergunta(termina_com_i, termina_com, i).
tipo_pergunta(termina_com_o, termina_com, o).
tipo_pergunta(termina_com_r, termina_com, r).
tipo_pergunta(termina_com_s, termina_com, s).
tipo_pergunta(pais_curto, nome_curto, _).
tipo_pergunta(pais_longo, nome_longo, _).

% Predicados auxiliares para contagem e checagem
esta_no_continente_wrapper(Continente, Pais) :-
    continente(Pais, Continente).

fala_idioma_wrapper(Idioma, Pais) :-
    fala_idioma(Pais, Idioma).

comeca_com_wrapper(Letra, Pais) :-
    comeca_com(Pais, Letra).

termina_com_wrapper(Letra, Pais) :-
    termina_com(Pais, Letra).

% Predicate to clear the console screen - improved version
clear_console :-
    write('\n\n'),  % Double newline for better visibility
    (   current_prolog_flag(windows, true)
    ->  shell('cls', _), !
    ;   shell('clear', _), !
    ).

% Menu principal do jogo
menu_principal :-
    inicializa_estatisticas,
    menu_loop.

% Novo predicado jogo como ponto de entrada
jogo :-
    inicializa_estatisticas,
    menu_loop.

% Loop do menu principal com verificação de saída
menu_loop :-
    nl, nl,
    write('======= JOGO DE ADIVINHACAO DE PAISES ======='), nl,
    nivel_dificuldade(Nivel),
    (Nivel = facil -> NivelTexto = 'Facil (20 perguntas)';
     Nivel = medio -> NivelTexto = 'Medio (15 perguntas)';
     Nivel = dificil -> NivelTexto = 'Dificil (10 perguntas)'
    ),
    format('Dificuldade atual: ~w~n~n', [NivelTexto]),
    write('1. Iniciar novo jogo'), nl,
    write('2. Selecionar dificuldade'), nl, 
    write('3. Ver estatisticas'), nl,
    write('4. Ver regras do jogo'), nl,
    write('5. Sair'), nl,
    write('Escolha uma opcao: '),
    read_line_to_string(user_input, Input),
    (atom_number(Input, Opcao) -> 
        (processa_opcao(Opcao) -> 
            % Se processa_opcao retornar true (finalizar), encerra
            Opcao == 5
        ; 
            % Caso contrário, continua no loop
            menu_loop
        )
    ; 
        write('Opcao invalida! Por favor, escolha uma opcao entre 1 e 5.'), nl,
        menu_loop
    ).

% Processamento de opções do menu - retorna true apenas para a opção Sair
processa_opcao(1) :- adivinha_pais, !, false.  % Continua no menu após jogar
processa_opcao(2) :- selecionar_dificuldade, !, false.  % Continua no menu após alterar dificuldade
processa_opcao(3) :- ver_estatisticas, !, false.  % Continua no menu após ver estatísticas
processa_opcao(4) :- ver_regras, !, false.  % Continua no menu após ver regras
processa_opcao(5) :- write('Obrigado por jogar!'), nl, !, true.  % Finaliza o jogo
processa_opcao(_) :- write('Opcao invalida! Por favor, escolha uma opcao entre 1 e 5.'), nl, !, false.

% Menu para selecionar dificuldade
selecionar_dificuldade :-
    nl, write('==== SELECIONAR DIFICULDADE ===='), nl,
    write('1. Facil (20 perguntas)'), nl,
    write('2. Medio (15 perguntas)'), nl,
    write('3. Dificil (10 perguntas)'), nl,
    write('Escolha uma dificuldade: '),
    read_line_to_string(user_input, Input),
    (atom_number(Input, Opcao) ->
        (
            Opcao = 1 -> 
                retractall(nivel_dificuldade(_)), 
                assert(nivel_dificuldade(facil)), 
                write('Dificuldade alterada para Facil.'), nl;
            Opcao = 2 -> 
                retractall(nivel_dificuldade(_)), 
                assert(nivel_dificuldade(medio)), 
                write('Dificuldade alterada para Medio.'), nl;
            Opcao = 3 -> 
                retractall(nivel_dificuldade(_)), 
                assert(nivel_dificuldade(dificil)), 
                write('Dificuldade alterada para Dificil.'), nl;
            write('Opcao invalida! Mantendo a dificuldade atual.'), nl
        )
    ;
        write('Opcao invalida! Mantendo a dificuldade atual.'), nl
    ).

% Ver estatísticas do jogo
ver_estatisticas :-
    nl, write('==== ESTATISTICAS DO JOGO ===='), nl,
    jogos_ganhos(Ganhos),
    jogos_perdidos(Perdidos),
    Total is Ganhos + Perdidos,
    format('Total de jogos: ~w~n', [Total]),
    format('Jogos ganhos: ~w~n', [Ganhos]),
    format('Jogos perdidos: ~w~n', [Perdidos]),
    (Total > 0 -> 
        Taxa is (Ganhos / Total) * 100,
        format('Taxa de sucesso: ~2f%~n', [Taxa])
    ; true).

% Ver regras do jogo
ver_regras :-
    clear_console,
    nl, write('==== REGRAS DO JOGO ===='), nl,
    write('1. Pense em um pais e o computador tentara adivinhar qual eh.'), nl,
    write('2. Responda as perguntas com "s" (sim), "n" (nao) ou "ns" (nao sei).'), nl,
    nivel_dificuldade(Nivel),
    (Nivel = facil -> 
        write('3. O jogo utiliza 20 perguntas para tentar adivinhar o pais.'), nl
    ; Nivel = medio ->
        write('3. O jogo utiliza 15 perguntas para tentar adivinhar o pais.'), nl
    ; Nivel = dificil ->
        write('3. O jogo utiliza 10 perguntas para tentar adivinhar o pais.'), nl
    ),
    write('4. Se apos as perguntas o computador nao conseguir identificar o pais,'), nl,
    write('   ele fara um palpite aleatorio entre os paises restantes.'), nl,
    write('5. O jogo termina quando o computador adivinhar o pais ou apos o palpite final.'), nl,
    write('6. Perguntas sobre letras iniciais e finais so aparecem na segunda metade do jogo.'), nl,
    
    nl, write('Pressione Enter para voltar ao menu principal...'),
    read_line_to_string(user_input, _),
    clear_console.

% Motor de jogo - perguntas para adivinhar o país
adivinha_pais :-
    clear_console,
    nl, write('Pense em um pais e eu tentarei adivinhar!'), nl,
    write('Responda com "s" (sim), "n" (nao) ou "ns" (nao sei)'), nl,
    inicializa_jogo,
    adivinha_pais_recursivo,
    nl, write('Pressione Enter para voltar ao menu principal...'),
    read_line_to_string(user_input, _),
    clear_console.

adivinha_pais_recursivo :-
    paises_possiveis(Paises),
    length(Paises, NumPaises),
    tentativas_restantes(Tentativas),
    
    (NumPaises =:= 1 ->
        % Apenas um país restante - vitória
        Paises = [Pais],
        format('O pais em que voce esta pensando e ~w!~n', [Pais]),
        retract(jogos_ganhos(G)),
        NovoG is G + 1,
        assert(jogos_ganhos(NovoG)),
        mostra_info_pais(Pais)
    ; NumPaises =:= 0 ->
        % Sem países possíveis - erro
        write('Nao consegui adivinhar com base nas suas respostas.'), nl,
        write('Por favor, verifique se respondeu corretamente ou tente novamente.'), nl,
        retract(jogos_perdidos(P)),
        NovoP is P + 1,
        assert(jogos_perdidos(NovoP))
    ; Tentativas =:= 0 ->
        % Acabaram as tentativas - faz um palpite aleatório
        write('Acabaram minhas tentativas, vou fazer um palpite aleatorio!'), nl,
        escolhe_pais_aleatorio(Paises, PaisEscolhido),
        format('Acho que o pais em que voce esta pensando e ~w!~n', [PaisEscolhido]),
        write('(Este foi um palpite aleatorio entre as opcoes restantes)'), nl,
        % Verifica se a adivinhação está correta
        write('Acertei? (sim/nao): '),
        read_line_to_string(user_input, Resposta),
        string_lower(Resposta, RespostaLower),
        (
            (RespostaLower = "sim"; RespostaLower = "sim."; RespostaLower = "s") -> 
                retract(jogos_ganhos(G)),
                NovoG is G + 1,
                assert(jogos_ganhos(NovoG)),
                mostra_info_pais(PaisEscolhido)
            ;
                format('Que pena! Ainda haviam ~w possibilidades: ', [NumPaises]), nl,
                mostra_paises_restantes(Paises, 5),
                retract(jogos_perdidos(P)),
                NovoP is P + 1,
                assert(jogos_perdidos(NovoP))
        )
    ; 
        % Continua o jogo
        format('Tentativas restantes: ~w | Paises possiveis: ~w~n', [Tentativas, NumPaises]),
        melhor_pergunta(Paises, Pergunta),
        faz_pergunta_validada(Pergunta, Resposta),
        atualiza_conhecimento(Pergunta, Resposta),
        retract(tentativas_restantes(T)),
        NovoT is T - 1,
        assert(tentativas_restantes(NovoT)),
        adivinha_pais_recursivo
    ).

% Mostra os primeiros N países da lista de países restantes
mostra_paises_restantes([], _) :- nl.
mostra_paises_restantes(_, 0) :- 
    write('... (e outros paises)'), nl.
mostra_paises_restantes([P|Ps], N) :-
    write(P), write(', '),
    N1 is N - 1,
    mostra_paises_restantes(Ps, N1).

% Mostra informações detalhadas sobre o país adivinhado
mostra_info_pais(Pais) :-
    pais(Pais, Pop, Idioma, ExpVida, Area, Pib, TaxaNascimento),
    continente(Pais, Continente),
    nl, write('=== Informacoes sobre o pais ==='), nl,
    format('Nome: ~w~n', [Pais]),
    format('Continente: ~w~n', [Continente]),
    format('Populacao: ~w habitantes~n', [Pop]),
    format('Idioma oficial: ~w~n', [Idioma]),
    format('Expectativa de vida: ~w anos~n', [ExpVida]),
    format('Area territorial: ~w km2~n', [Area]),
    format('PIB: ~w bilhoes de dolares~n', [Pib]),
    format('Taxa de nascimento: ~w filhos por mulher~n', [TaxaNascimento]).

% Gera lista de perguntas possíveis que ainda não foram feitas
perguntas_possiveis(PergsNaoFeitas) :-
    findall(P, tipo_pergunta(P, _, _), Todas),
    perguntas_feitas(Feitas),
    subtract(Todas, Feitas, PergsNaoFeitas).

% Calcula a melhor pergunta (elimina o maior número de países possíveis)
melhor_pergunta(Paises, MelhorPergunta) :-
    perguntas_possiveis(PergsNaoFeitas),
    perguntas_feitas(Feitas),
    tentativas_restantes(Tentativas),
    perguntas_ineficientes(PI),
    
    % Se for a primeira pergunta, escolhe uma pergunta aleatória
    (Feitas = [] -> 
        % Filtramos apenas perguntas básicas para a primeira pergunta
        findall(P, (
            member(P, PergsNaoFeitas),
            (sub_atom(P, 0, 11, _, continente_); 
             sub_atom(P, 0, 11, _, populacao_); 
             sub_atom(P, 0, 5, _, fala_);
             sub_atom(P, 0, 12, _, expectativa_);
             sub_atom(P, 0, 5, _, area_))
        ), PerguntasIniciais),
        % Escolha "aleatória" (a primeira da lista, mas em uma implementação real seria random)
        (PerguntasIniciais = [MelhorPergunta|_] -> true ; MelhorPergunta = continente_europa)
    % Se estamos na metade final das perguntas, permite perguntas sobre letras
    ; Tentativas =< 10 -> 
        % Avalia todas as perguntas e escolhe a melhor
        melhor_pergunta_aux(PergsNaoFeitas, Paises, MelhorPergunta)
    % Se tivermos muitas perguntas ineficientes consecutivas, também permitir perguntas sobre letras
    ; PI >= 2 ->
        % Houve perguntas ineficientes recentes, usar também perguntas sobre letras
        melhor_pergunta_aux(PergsNaoFeitas, Paises, MelhorPergunta)
    % Na primeira metade do jogo e sem muitas perguntas ineficientes, exclui perguntas sobre letras
    ; 
        findall(P, (
            member(P, PergsNaoFeitas),
            \+ sub_atom(P, 0, 11, _, comeca_com_),
            \+ sub_atom(P, 0, 12, _, termina_com_),
            \+ P = pais_curto,
            \+ P = pais_longo
        ), PerguntasSemLetras),
        % Se ainda houver perguntas disponíveis
        (PerguntasSemLetras = [] -> 
            melhor_pergunta_aux(PergsNaoFeitas, Paises, MelhorPergunta)
        ;
            melhor_pergunta_aux(PerguntasSemLetras, Paises, MelhorPergunta)
        )
    ).

% Avalia todas as perguntas e escolhe a que divide melhor o conjunto de países
melhor_pergunta_aux(Perguntas, Paises, MelhorPergunta) :-
    findall(
        Valor-(Perg),
        (
            member(Perg, Perguntas),
            calcula_valor_pergunta(Perg, Paises, Valor)
        ),
        Valores
    ),
    % Ordena as perguntas pelo valor (do maior para o menor)
    sort(0, @>=, Valores, [_-MelhorPergunta|_]).

% Calcula o valor de uma pergunta com base na divisão que causa
calcula_valor_pergunta(Pergunta, Paises, Valor) :-
    tipo_pergunta(Pergunta, Pred, ValorPred),
    avalia_pergunta(Pred, ValorPred, Paises, Sim, Nao),
    length(Sim, NumSim),
    length(Nao, NumNao),
    length(Paises, Total),
    
    % Ajustar a estratégia dependendo do número de países restantes
    (Total =< 20 ->
        % Com poucos países, priorize perguntas de idioma e características únicas
        (Pred = fala_idioma -> 
            % Idiomas são muito específicos e úteis quando há poucos países
            Bonus = 0.2
        ; (Pergunta = fala_portugues; Pergunta = fala_russo; Pergunta = fala_alemao) -> 
            % Idiomas menos comuns são ainda mais úteis
            Bonus = 0.3
        ; Bonus = 0),
        
        % Calcular o valor base
        (NumSim > 0, NumNao > 0 ->
            % O ideal é dividir em grupos iguais (próximo a 50/50)
            Proporcao is min(NumSim, NumNao) / Total,
            % Eliminar qualquer país é melhor que nada
            Valor is Proporcao + Bonus
        ; Valor = 0)  % Sem eliminação = valor zero
    ;
        % Com muitos países, buscar dividir o mais próximo possível de 50/50
        (NumSim > 0, NumNao > 0 ->
            Equilibrio is 0.5 - abs(0.5 - (NumSim / Total)),
            Valor is Equilibrio + 0.1 * min(NumSim, NumNao) / Total
        ; Valor = 0)
    ).

% Avalia uma pergunta para um conjunto de países
avalia_pergunta(continente, Valor, Paises, Sim, Nao) :-
    include(esta_no_continente_wrapper(Valor), Paises, Sim),
    exclude(esta_no_continente_wrapper(Valor), Paises, Nao).
avalia_pergunta(fala_idioma, Valor, Paises, Sim, Nao) :-
    include(fala_idioma_wrapper(Valor), Paises, Sim),
    exclude(fala_idioma_wrapper(Valor), Paises, Nao).
avalia_pergunta(populacao_grande, _, Paises, Sim, Nao) :-
    include(populacao_grande, Paises, Sim),
    exclude(populacao_grande, Paises, Nao).
avalia_pergunta(populacao_media, _, Paises, Sim, Nao) :-
    include(populacao_media, Paises, Sim),
    exclude(populacao_media, Paises, Nao).
avalia_pergunta(populacao_pequena, _, Paises, Sim, Nao) :-
    include(populacao_pequena, Paises, Sim),
    exclude(populacao_pequena, Paises, Nao).
avalia_pergunta(expectativa_alta, _, Paises, Sim, Nao) :-
    include(expectativa_alta, Paises, Sim),
    exclude(expectativa_alta, Paises, Nao).
avalia_pergunta(expectativa_media, _, Paises, Sim, Nao) :-
    include(expectativa_media, Paises, Sim),
    exclude(expectativa_media, Paises, Nao).
avalia_pergunta(expectativa_baixa, _, Paises, Sim, Nao) :-
    include(expectativa_baixa, Paises, Sim),
    exclude(expectativa_baixa, Paises, Nao).
avalia_pergunta(area_grande, _, Paises, Sim, Nao) :-
    include(area_grande, Paises, Sim),
    exclude(area_grande, Paises, Nao).
avalia_pergunta(area_media, _, Paises, Sim, Nao) :-
    include(area_media, Paises, Sim),
    exclude(area_media, Paises, Nao).
avalia_pergunta(area_pequena, _, Paises, Sim, Nao) :-
    include(area_pequena, Paises, Sim),
    exclude(area_pequena, Paises, Nao).
avalia_pergunta(pib_muito_alto, _, Paises, Sim, Nao) :-
    include(pib_muito_alto, Paises, Sim),
    exclude(pib_muito_alto, Paises, Nao).
avalia_pergunta(pib_alto, _, Paises, Sim, Nao) :-
    include(pib_alto, Paises, Sim),
    exclude(pib_alto, Paises, Nao).
avalia_pergunta(pib_medio, _, Paises, Sim, Nao) :-
    include(pib_medio, Paises, Sim),
    exclude(pib_medio, Paises, Nao).
avalia_pergunta(pib_baixo, _, Paises, Sim, Nao) :-
    include(pib_baixo, Paises, Sim),
    exclude(pib_baixo, Paises, Nao).
avalia_pergunta(natalidade_alta, _, Paises, Sim, Nao) :-
    include(natalidade_alta, Paises, Sim),
    exclude(natalidade_alta, Paises, Nao).
avalia_pergunta(natalidade_media, _, Paises, Sim, Nao) :-
    include(natalidade_media, Paises, Sim),
    exclude(natalidade_media, Paises, Nao).
avalia_pergunta(natalidade_baixa, _, Paises, Sim, Nao) :-
    include(natalidade_baixa, Paises, Sim),
    exclude(natalidade_baixa, Paises, Nao).
% Avaliações para as perguntas sobre letras e tamanho de nome
avalia_pergunta(comeca_com, Valor, Paises, Sim, Nao) :-
    include(comeca_com_wrapper(Valor), Paises, Sim),
    exclude(comeca_com_wrapper(Valor), Paises, Nao).
avalia_pergunta(termina_com, Valor, Paises, Sim, Nao) :-
    include(termina_com_wrapper(Valor), Paises, Sim),
    exclude(termina_com_wrapper(Valor), Paises, Nao).
avalia_pergunta(nome_curto, _, Paises, Sim, Nao) :-
    include(nome_curto, Paises, Sim),
    exclude(nome_curto, Paises, Nao).
avalia_pergunta(nome_longo, _, Paises, Sim, Nao) :-
    include(nome_longo, Paises, Sim),
    exclude(nome_longo, Paises, Nao).

% Pergunta validando resposta (aceita s, n, ns) - mais robusto
faz_pergunta_validada(Pergunta, Resposta) :-
    formata_pergunta(Pergunta, TextoPergunta),
    repeat,
    format('~w', [TextoPergunta]),
    catch(read_line_to_string(user_input, UserInput), _, UserInput = ""),
    (UserInput = end_of_file ->
        write('Entrada encerrada. Por favor, responda com "s", "n" ou "ns".'), nl, fail
    ;
        string_lower(UserInput, LowerInput),
        (   (LowerInput = "sim"; LowerInput = "sim."; LowerInput = "s") -> 
                Resposta = sim, !
        ;   (LowerInput = "nao"; LowerInput = "não"; LowerInput = "nao."; LowerInput = "não."; LowerInput = "n") -> 
                Resposta = nao, !
        ;   (LowerInput = "ns"; LowerInput = "nao sei"; LowerInput = "não sei"; LowerInput = "nsei") -> 
                Resposta = nao_sei, !
        ;   write('Por favor, responda com "s", "n" ou "ns" (não sei).'), nl, 
            fail
        )
    ).

% Formato textual das perguntas
formata_pergunta(continente_europa, 'O pais esta na Europa? ').
formata_pergunta(continente_asia, 'O pais esta na Asia? ').
formata_pergunta(continente_america_norte, 'O pais esta na America do Norte? ').
formata_pergunta(continente_america_sul, 'O pais esta na America do Sul? ').
formata_pergunta(continente_africa, 'O pais esta na Africa? ').
formata_pergunta(continente_oceania, 'O pais esta na Oceania? ').
formata_pergunta(populacao_grande, 'O pais tem uma populacao grande (mais de 100 milhoes)? ').
formata_pergunta(populacao_media, 'O pais tem uma populacao media (entre 10 e 100 milhoes)? ').
formata_pergunta(populacao_pequena, 'O pais tem uma populacao pequena (menos de 10 milhoes)? ').
formata_pergunta(fala_ingles, 'A lingua oficial do pais e o ingles? ').
formata_pergunta(fala_espanhol, 'A lingua oficial do pais e o espanhol? ').
formata_pergunta(fala_frances, 'A lingua oficial do pais e o frances? ').
formata_pergunta(fala_arabe, 'A lingua oficial do pais e o arabe? ').
formata_pergunta(fala_portugues, 'A lingua oficial do pais e o portugues? ').
formata_pergunta(fala_russo, 'A lingua oficial do pais e o russo? ').
formata_pergunta(fala_alemao, 'A lingua oficial do pais e o alemao? ').
% Formatos para os novos idiomas
formata_pergunta(fala_italiano, 'A lingua oficial do pais e o italiano? ').
formata_pergunta(fala_chines, 'A lingua oficial do pais e o chines? ').
formata_pergunta(fala_japones, 'A lingua oficial do pais e o japones? ').
formata_pergunta(fala_coreano, 'A lingua oficial do pais e o coreano? ').
formata_pergunta(fala_hindi, 'A lingua oficial do pais e o hindi? ').
formata_pergunta(fala_holandes, 'A lingua oficial do pais e o holandes? ').
formata_pergunta(fala_sueco, 'A lingua oficial do pais e o sueco? ').
formata_pergunta(fala_grego, 'A lingua oficial do pais e o grego? ').
formata_pergunta(fala_turco, 'A lingua oficial do pais e o turco? ').
formata_pergunta(fala_polones, 'A lingua oficial do pais e o polones? ').
formata_pergunta(expectativa_alta, 'A expectativa de vida no pais e alta (mais de 75 anos)? ').
formata_pergunta(expectativa_media, 'A expectativa de vida no pais e media (entre 65 e 75 anos)? ').
formata_pergunta(expectativa_baixa, 'A expectativa de vida no pais e baixa (menos de 65 anos)? ').
formata_pergunta(area_grande, 'O pais tem uma area territorial grande (mais de 1 milhao de km2)? ').
formata_pergunta(area_media, 'O pais tem uma area territorial media (entre 100 mil e 1 milhao de km2)? ').
formata_pergunta(area_pequena, 'O pais tem uma area territorial pequena (menos de 100 mil km2)? ').
formata_pergunta(pib_muito_alto, 'O pais tem um PIB muito alto (mais de 1000 bilhoes de dolares)? ').
formata_pergunta(pib_alto, 'O pais tem um PIB alto (entre 100 e 1000 bilhoes de dolares)? ').
formata_pergunta(pib_medio, 'O pais tem um PIB medio (entre 10 e 100 bilhoes de dolares)? ').
formata_pergunta(pib_baixo, 'O pais tem um PIB baixo (menos de 10 bilhoes de dolares)? ').
formata_pergunta(natalidade_alta, 'O pais tem uma taxa de natalidade alta (mais de 4 filhos por mulher)? ').
formata_pergunta(natalidade_media, 'O pais tem uma taxa de natalidade media (entre 2 e 4 filhos por mulher)? ').
formata_pergunta(natalidade_baixa, 'O pais tem uma taxa de natalidade baixa (menos de 2 filhos por mulher)? ').
% Formatos para perguntas sobre letras e tamanho de nome
formata_pergunta(comeca_com_a, 'O nome do pais comeca com a letra A? ').
formata_pergunta(comeca_com_b, 'O nome do pais comeca com a letra B? ').
formata_pergunta(comeca_com_c, 'O nome do pais comeca com a letra C? ').
formata_pergunta(comeca_com_d, 'O nome do pais comeca com a letra D? ').
formata_pergunta(comeca_com_e, 'O nome do pais comeca com a letra E? ').
formata_pergunta(comeca_com_f, 'O nome do pais comeca com a letra F? ').
formata_pergunta(comeca_com_g, 'O nome do pais comeca com a letra G? ').
formata_pergunta(comeca_com_h, 'O nome do pais comeca com a letra H? ').
formata_pergunta(comeca_com_i, 'O nome do pais comeca com a letra I? ').
formata_pergunta(comeca_com_j, 'O nome do pais comeca com a letra J? ').
formata_pergunta(comeca_com_l, 'O nome do pais comeca com a letra L? ').
formata_pergunta(comeca_com_m, 'O nome do pais comeca com a letra M? ').
formata_pergunta(comeca_com_n, 'O nome do pais comeca com a letra N? ').
formata_pergunta(comeca_com_o, 'O nome do pais comeca com a letra O? ').
formata_pergunta(comeca_com_p, 'O nome do pais comeca com a letra P? ').
formata_pergunta(comeca_com_r, 'O nome do pais comeca com a letra R? ').
formata_pergunta(comeca_com_s, 'O nome do pais comeca com a letra S? ').
formata_pergunta(comeca_com_t, 'O nome do pais comeca com a letra T? ').
formata_pergunta(comeca_com_u, 'O nome do pais comeca com a letra U? ').
formata_pergunta(comeca_com_v, 'O nome do pais comeca com a letra V? ').
formata_pergunta(termina_com_a, 'O nome do pais termina com a letra A? ').
formata_pergunta(termina_com_e, 'O nome do pais termina com a letra E? ').
formata_pergunta(termina_com_i, 'O nome do pais termina com a letra I? ').
formata_pergunta(termina_com_o, 'O nome do pais termina com a letra O? ').
formata_pergunta(termina_com_r, 'O nome do pais termina com a letra R? ').
formata_pergunta(termina_com_s, 'O nome do pais termina com a letra S? ').
formata_pergunta(pais_curto, 'O nome do pais e curto (ate 6 letras)? ').
formata_pergunta(pais_longo, 'O nome do pais e longo (mais de 12 letras)? ').

% Atualiza lista de perguntas feitas e filtra países com base na resposta
atualiza_conhecimento(Pergunta, Resposta) :-
    perguntas_feitas(Feitas),
    retract(perguntas_feitas(_)),
    assert(perguntas_feitas([Pergunta|Feitas])),
    
    % Verificar eficiência da pergunta para as respostas "não sei"
    (Resposta == nao_sei -> 
        % Apenas registra a pergunta sem filtrar
        true
    ; % Caso contrário (sim ou não)
        paises_possiveis(PaisesAntigos),
        length(PaisesAntigos, NumPaisesAntigos),
        
        % Aplica filtro de acordo com a resposta
        (Resposta == sim ->
            aplica_filtro_sim(Pergunta, PaisesAntigos, PaisesNovos)
        ; % Resposta é não
            aplica_filtro_nao(Pergunta, PaisesAntigos, PaisesNovos)
        ),
        
        % Verifica se a pergunta foi eficiente
        length(PaisesNovos, NumPaisesNovos),
        (NumPaisesNovos =:= NumPaisesAntigos -> 
            % A pergunta não eliminou nenhum país
            retract(perguntas_ineficientes(PI)),
            PI1 is PI + 1,
            assert(perguntas_ineficientes(PI1))
        ; true),
        
        retract(paises_possiveis(_)),
        assert(paises_possiveis(PaisesNovos))
    ).

% Aplica filtro para respostas afirmativas
aplica_filtro_sim(Pergunta, Paises, PaisesNovos) :-
    tipo_pergunta(Pergunta, Pred, Valor),
    (Pred = continente ->
        include(esta_no_continente_wrapper(Valor), Paises, PaisesNovos)
    ; Pred = fala_idioma ->
        include(fala_idioma_wrapper(Valor), Paises, PaisesNovos)
    ; Pred = populacao_grande ->
        include(populacao_grande, Paises, PaisesNovos)
    ; Pred = populacao_media ->
        include(populacao_media, Paises, PaisesNovos)
    ; Pred = populacao_pequena ->
        include(populacao_pequena, Paises, PaisesNovos)
    ; Pred = expectativa_alta ->
        include(expectativa_alta, Paises, PaisesNovos)
    ; Pred = expectativa_media ->
        include(expectativa_media, Paises, PaisesNovos)
    ; Pred = expectativa_baixa ->
        include(expectativa_baixa, Paises, PaisesNovos)
    ; Pred = area_grande ->
        include(area_grande, Paises, PaisesNovos)
    ; Pred = area_media ->
        include(area_media, Paises, PaisesNovos)
    ; Pred = area_pequena ->
        include(area_pequena, Paises, PaisesNovos)
    ; Pred = pib_muito_alto ->
        include(pib_muito_alto, Paises, PaisesNovos)
    ; Pred = pib_alto ->
        include(pib_alto, Paises, PaisesNovos)
    ; Pred = pib_medio ->
        include(pib_medio, Paises, PaisesNovos)
    ; Pred = pib_baixo ->
        include(pib_baixo, Paises, PaisesNovos)
    ; Pred = natalidade_alta ->
        include(natalidade_alta, Paises, PaisesNovos)
    ; Pred = natalidade_media ->
        include(natalidade_media, Paises, PaisesNovos)
    ; Pred = natalidade_baixa ->
        include(natalidade_baixa, Paises, PaisesNovos)
    ; Pred = comeca_com ->
        include(comeca_com_wrapper(Valor), Paises, PaisesNovos)
    ; Pred = termina_com ->
        include(termina_com_wrapper(Valor), Paises, PaisesNovos)
    ; Pred = nome_curto ->
        include(nome_curto, Paises, PaisesNovos)
    ; Pred = nome_longo ->
        include(nome_longo, Paises, PaisesNovos)
    ).

% Aplica filtro para respostas negativas
aplica_filtro_nao(Pergunta, Paises, PaisesNovos) :-
    tipo_pergunta(Pergunta, Pred, Valor),
    (Pred = continente ->
        exclude(esta_no_continente_wrapper(Valor), Paises, PaisesNovos)
    ; Pred = fala_idioma ->
        exclude(fala_idioma_wrapper(Valor), Paises, PaisesNovos)
    ; Pred = populacao_grande ->
        exclude(populacao_grande, Paises, PaisesNovos)
    ; Pred = populacao_media ->
        exclude(populacao_media, Paises, PaisesNovos)
    ; Pred = populacao_pequena ->
        exclude(populacao_pequena, Paises, PaisesNovos)
    ; Pred = expectativa_alta ->
        exclude(expectativa_alta, Paises, PaisesNovos)
    ; Pred = expectativa_media ->
        exclude(expectativa_media, Paises, PaisesNovos)
    ; Pred = expectativa_baixa ->
        exclude(expectativa_baixa, Paises, PaisesNovos)
    ; Pred = area_grande ->
        exclude(area_grande, Paises, PaisesNovos)
    ; Pred = area_media ->
        exclude(area_media, Paises, PaisesNovos)
    ; Pred = area_pequena ->
        exclude(area_pequena, Paises, PaisesNovos)
    ; Pred = pib_muito_alto ->
        exclude(pib_muito_alto, Paises, PaisesNovos)
    ; Pred = pib_alto ->
        exclude(pib_alto, Paises, PaisesNovos)
    ; Pred = pib_medio ->
        exclude(pib_medio, Paises, PaisesNovos)
    ; Pred = pib_baixo ->
        exclude(pib_baixo, Paises, PaisesNovos)
    ; Pred = natalidade_alta ->
        exclude(natalidade_alta, Paises, PaisesNovos)
    ; Pred = natalidade_media ->
        exclude(natalidade_media, Paises, PaisesNovos)
    ; Pred = natalidade_baixa ->
        exclude(natalidade_baixa, Paises, PaisesNovos)
    ; Pred = comeca_com ->
        exclude(comeca_com_wrapper(Valor), Paises, PaisesNovos)
    ; Pred = termina_com ->
        exclude(termina_com_wrapper(Valor), Paises, PaisesNovos)
    ; Pred = nome_curto ->
        exclude(nome_curto, Paises, PaisesNovos)
    ; Pred = nome_longo ->
        exclude(nome_longo, Paises, PaisesNovos)
    ).

% Escolhe um país aleatório da lista de países restantes usando um método alternativo
escolhe_pais_aleatorio([], _) :- 
    write('Erro: Nao ha paises disponiveis para selecao aleatoria!'), nl,
    fail.
escolhe_pais_aleatorio([Pais], Pais) :- !.  % Se só há um país, retorna ele
escolhe_pais_aleatorio(Paises, PaisEscolhido) :- 
    % Método simple: usa o primeiro país da lista
    % Em um ambiente sem restrições, usaríamos random/3 aqui
    Paises = [PaisEscolhido|_].

% Ponto de entrada do programa
main :- jogo.
% Inicializa o jogo

% Inicialização - define que o programa não inicia automaticamente
:- initialization(main, program).