% Base de conhecimento para o jogo de adivinhação de países
% Formato: pais(Nome, População, Idioma, ExpectativaVida, AreaTerritorial, Pib, TaxaNascimento).
:- encoding(utf8).
:- module(paises_dados, [
    continente/2, 
    pais/7,
    populacao_grande/1,
    populacao_media/1,
    populacao_pequena/1,
    fala_idioma/2,
    expectativa_alta/1,
    expectativa_media/1,
    expectativa_baixa/1,
    area_grande/1,
    area_media/1,
    area_pequena/1,
    pib_muito_alto/1,
    pib_alto/1,
    pib_medio/1,
    pib_baixo/1,
    natalidade_alta/1,
    natalidade_media/1,
    natalidade_baixa/1,
    comeca_com/2,
    termina_com/2,
    nome_curto/1,
    nome_longo/1
]).

% Definição dos continentes para cada país
continente(afeganistao, asia).
continente(albania, europa).
continente(argelia, africa).
continente(andorra, europa).
continente(angola, africa).
continente(antigua_e_barbuda, america_norte).
continente(argentina, america_sul).
continente(armenia, asia).
continente(australia, oceania).
continente(austria, europa).
continente(azerbaijao, asia).
continente(bahamas, america_norte).
continente(bahrein, asia).
continente(bangladesh, asia).
continente(barbados, america_norte).
continente(bielorrussia, europa).
continente(belgica, europa).
continente(belize, america_norte).
continente(benin, africa).
continente(butao, asia).
continente(bolivia, america_sul).
continente(bosnia_herzegovina, europa).
continente(botsuana, africa).
continente(brasil, america_sul).
continente(brunei, asia).
continente(bulgaria, europa).
continente(burkina_faso, africa).
continente(burundi, africa).
continente(costa_do_marfim, africa).
continente(cabo_verde, africa).
continente(camboja, asia).
continente(camaroes, africa).
continente(canada, america_norte).
continente(republica_centro_africana, africa).
continente(chade, africa).
continente(chile, america_sul).
continente(china, asia).
continente(colombia, america_sul).
continente(comores, africa).
continente(congo, africa).
continente(costa_rica, america_norte).
continente(croacia, europa).
continente(cuba, america_norte).
continente(chipre, europa).
continente(republica_tcheca, europa).
continente(republica_democratica_do_congo, africa).
continente(dinamarca, europa).
continente(djibouti, africa).
continente(dominica, america_norte).
continente(republica_dominicana, america_norte).
continente(equador, america_sul).
continente(egito, africa).
continente(el_salvador, america_norte).
continente(guine_equatorial, africa).
continente(eritreia, africa).
continente(estonia, europa).
continente(eswatini, africa).
continente(etiopia, africa).
continente(fiji, oceania).
continente(finlandia, europa).
continente(franca, europa).
continente(gabao, africa).
continente(gambia, africa).
continente(georgia, asia).
continente(alemanha, europa).
continente(gana, africa).
continente(grecia, europa).
continente(granada, america_norte).
continente(guatemala, america_norte).
continente(guine, africa).
continente(guine_bissau, africa).
continente(guiana, america_sul).
continente(haiti, america_norte).
continente(vaticano, europa).
continente(honduras, america_norte).
continente(hungria, europa).
continente(islandia, europa).
continente(india, asia).
continente(indonesia, asia).
continente(ira, asia).
continente(iraque, asia).
continente(irlanda, europa).
continente(israel, asia).
continente(italia, europa).
continente(jamaica, america_norte).
continente(japao, asia).
continente(jordania, asia).
continente(cazaquistao, asia).
continente(quenia, africa).
continente(kiribati, oceania).
continente(kuwait, asia).
continente(quirguistao, asia).
continente(laos, asia).
continente(letonia, europa).
continente(libano, asia).
continente(lesoto, africa).
continente(liberia, africa).
continente(libia, africa).
continente(liechtenstein, europa).
continente(lituania, europa).
continente(luxemburgo, europa).
continente(madagascar, africa).
continente(malawi, africa).
continente(malasia, asia).
continente(maldivas, asia).
continente(mali, africa).
continente(malta, europa).
continente(ilhas_marshall, oceania).
continente(mauritania, africa).
continente(mauricia, africa).
continente(mexico, america_norte).
continente(micronesia, oceania).
continente(moldavia, europa).
continente(monaco, europa).
continente(mongolia, asia).
continente(montenegro, europa).
continente(marrocos, africa).
continente(mocambique, africa).
continente(mianmar, asia).
continente(namibia, africa).
continente(nauru, oceania).
continente(nepal, asia).
continente(holanda, europa).
continente(nova_zelandia, oceania).
continente(nicaragua, america_norte).
continente(niger, africa).
continente(nigeria, africa).
continente(coreia_do_norte, asia).
continente(macedonia_do_norte, europa).
continente(noruega, europa).
continente(oma, asia).
continente(paquistao, asia).
continente(palau, oceania).
continente(palestina, asia).
continente(panama, america_norte).
continente(papua_nova_guine, oceania).
continente(paraguai, america_sul).
continente(peru, america_sul).
continente(filipinas, asia).
continente(polonia, europa).
continente(portugal, europa).
continente(catar, asia).
continente(romenia, europa).
continente(russia, europa).
continente(ruanda, africa).
continente(sao_cristovao_e_nevis, america_norte).
continente(santa_lucia, america_norte).
continente(sao_vicente_e_granadinas, america_norte).
continente(samoa, oceania).
continente(san_marino, europa).
continente(sao_tome_principe, africa).
continente(arabia_saudita, asia).
continente(senegal, africa).
continente(servia, europa).
continente(seychelles, africa).
continente(serra_leoa, africa).
continente(singapura, asia).
continente(eslovaquia, europa).
continente(eslovenia, europa).
continente(ilhas_salomao, oceania).
continente(somalia, africa).
continente(africa_do_sul, africa).
continente(coreia_do_sul, asia).
continente(sudao_do_sul, africa).
continente(espanha, europa).
continente(sri_lanka, asia).
continente(sudao, africa).
continente(suriname, america_sul).
continente(suecia, europa).
continente(suica, europa).
continente(siria, asia).
continente(tajiquistao, asia).
continente(tanzania, africa).
continente(tailandia, asia).
continente(timor_leste, asia).
continente(togo, africa).
continente(tonga, oceania).
continente(trinidad_e_tobago, america_norte).
continente(tunisia, africa).
continente(turquia, asia).
continente(turcomenistao, asia).
continente(tuvalu, oceania).
continente(uganda, africa).
continente(ucrania, europa).
continente(emirados_arabes_unidos, asia).
continente(reino_unido, europa).
continente(estados_unidos, america_norte).
continente(uruguai, america_sul).
continente(uzbequistao, asia).
continente(vanuatu, oceania).
continente(venezuela, america_sul).
continente(vietna, asia).
continente(iemen, asia).
continente(zambia, africa).
continente(zimbabue, africa).

% Definição dos países com suas principais características
% pais(Nome, População, Idioma, ExpectativaVida, AreaTerritorial, Pib, TaxaNascimento).
pais(afeganistao, 38041754, pashto, 64.5, 652230, 19.29, 4.44).
pais(albania, 2854191, albanes, 78.5, 28748, 15.28, 1.37).
pais(argelia, 43053054, arabe, 76.7, 2381741, 167.56, 2.94).
pais(andorra, 77142, catalao, 83.0, 468, 3.66, 1.15).
pais(angola, 31825295, portugues, 60.8, 1246700, 94.64, 5.55).
pais(antigua_e_barbuda, 97118, ingles, 76.9, 443, 1.63, 1.87).
pais(argentina, 44938712, espanhol, 76.5, 2780400, 449.66, 2.25).
pais(armenia, 2957731, armenio, 74.9, 29743, 13.67, 1.44).
pais(australia, 25766605, ingles, 82.7, 7741220, 1392.68, 1.76).
pais(austria, 8877067, alemao, 81.6, 83871, 477.07, 1.47).
pais(azerbaijao, 10023318, azerbaijano, 72.9, 86600, 46.94, 2.12).
pais(bahamas, 389482, ingles, 73.8, 13880, 12.16, 1.82).
pais(bahrein, 1501635, arabe, 77.2, 765, 38.57, 1.91).
pais(bangladesh, 167310838, bengali, 72.3, 148460, 302.57, 2.03).
pais(barbados, 287025, ingles, 79.1, 430, 5.37, 1.66).
pais(bielorrussia, 9466856, russo, 74.2, 207600, 63.08, 1.38).
pais(belgica, 11484055, frances, 81.6, 30528, 529.61, 1.64).
pais(belize, 390353, ingles, 74.5, 22966, 1.92, 2.31).
pais(benin, 11801151, frances, 61.5, 112622, 14.39, 4.91).
pais(butao, 727145, dzongkha, 71.5, 38394, 2.53, 2.17).
pais(bolivia, 11513100, espanhol, 71.2, 1098581, 40.29, 2.71).
pais(bosnia_herzegovina, 3301000, bosnio, 77.3, 51197, 20.16, 1.26).
pais(botsuana, 2346179, ingles, 69.3, 581730, 17.41, 2.87).
pais(brasil, 212559417, portugues, 75.7, 8515770, 2208.79, 1.72).
pais(brunei, 433285, malaio, 75.7, 5765, 12.13, 1.66).
pais(bulgaria, 6975761, bulgaro, 74.9, 110879, 65.13, 1.56).
pais(burkina_faso, 20321378, frances, 61.2, 274200, 15.75, 5.23).
pais(burundi, 11530580, kirundi, 61.2, 27830, 3.01, 5.65).
pais(costa_do_marfim, 25716544, frances, 57.4, 322463, 58.79, 4.68).
pais(cabo_verde, 483628, portugues, 72.8, 4033, 1.98, 2.33).
pais(camboja, 16486542, khmer, 69.6, 181035, 27.09, 2.48).
pais(camaroes, 25876380, frances, 58.9, 475440, 38.68, 4.59).
pais(canada, 36991981, frances, 81.9, 9984670, 1643.41, 1.47).
pais(republica_centro_africana, 4745185, frances, 52.8, 622984, 2.22, 4.78).
pais(chade, 15946876, frances, 54.0, 1284000, 11.32, 5.78).
pais(chile, 18952038, espanhol, 80.0, 756096, 282.32, 1.76).
pais(china, 1397715000, chines, 77.0, 9596960, 14342.90, 1.69).
pais(colombia, 50339443, espanhol, 77.1, 1138910, 323.62, 1.83).
pais(comores, 850886, frances, 64.1, 2235, 1.18, 4.23).
pais(congo, 5380508, frances, 64.3, 342000, 13.68, 4.66).
pais(costa_rica, 5047561, espanhol, 80.1, 51100, 61.77, 1.77).
pais(croacia, 4067500, croata, 78.1, 56594, 60.42, 1.41).
pais(cuba, 11333483, espanhol, 78.7, 110860, 100.02, 1.72).
pais(chipre, 1198575, grego, 80.8, 9251, 27.72, 1.37).
pais(republica_tcheca, 10669709, tcheco, 79.0, 78867, 245.22, 1.57).
pais(republica_democratica_do_congo, 86790567, frances, 60.4, 2344858, 50.57, 5.77).
pais(dinamarca, 5818553, dinamarques, 81.0, 43094, 347.24, 1.73).
pais(djibouti, 973560, frances, 66.6, 23200, 3.41, 2.91).
pais(dominica, 71808, ingles, 76.6, 751, 0.56, 2.01).
pais(republica_dominicana, 10738958, espanhol, 73.9, 48670, 89.47, 2.36).
pais(equador, 17373662, espanhol, 76.8, 283561, 107.43, 2.21).
pais(egito, 100388073, arabe, 71.8, 1001450, 363.07, 3.28).
pais(el_salvador, 6453553, espanhol, 73.1, 21041, 27.01, 2.01).
pais(guine_equatorial, 1355986, espanhol, 58.4, 28051, 12.27, 4.43).
pais(eritreia, 6333135, tigrinya, 65.9, 117600, 6.72, 4.06).
pais(estonia, 1331824, estoniano, 78.2, 45228, 30.73, 1.56).
pais(eswatini, 1093238, ingles, 60.0, 17364, 4.72, 3.28).
pais(etiopia, 112078730, amharico, 66.2, 1104300, 96.61, 4.12).
pais(fiji, 889953, fijiano, 67.3, 18274, 5.06, 2.68).
pais(finlandia, 5520314, sueco, 81.7, 338145, 269.28, 1.47).
pais(franca, 67059887, frances, 82.5, 643801, 2715.52, 1.83).
pais(gabao, 2172579, frances, 66.2, 267667, 16.87, 3.58).
pais(gambia, 2347706, ingles, 61.7, 11300, 1.87, 4.41).
pais(georgia, 3720382, georgiano, 73.6, 69700, 16.22, 1.74).
pais(alemanha, 83132799, alemao, 80.9, 357022, 3845.63, 1.54).
pais(gana, 30792608, ingles, 63.8, 238533, 72.35, 3.89).
pais(grecia, 10716322, grego, 81.3, 131957, 189.41, 1.35).
pais(granada, 112003, ingles, 72.4, 349, 1.21, 2.15).
pais(guatemala, 16604026, espanhol, 74.1, 108889, 85.96, 2.93).
pais(guine, 12771246, frances, 61.2, 245857, 12.47, 4.88).
pais(guine_bissau, 1920922, portugues, 58.0, 36125, 1.47, 4.92).
pais(guiana, 782766, ingles, 69.8, 214969, 6.07, 2.25).
pais(haiti, 11263077, frances, 63.7, 27750, 8.41, 2.98).
pais(vaticano, 836, italiano, 0, 0, 0, 0).
pais(honduras, 9746117, espanhol, 75.1, 112090, 25.32, 2.48).
pais(hungria, 9769949, hungaro, 75.8, 93028, 155.98, 1.49).
pais(islandia, 361313, islandes, 82.7, 103000, 24.19, 1.73).
pais(india, 1366417754, hindi, 69.4, 3287263, 2875.14, 2.24).
pais(indonesia, 270203917, indonesio, 71.5, 1904569, 1119.19, 2.34).
pais(ira, 82913906, persa, 76.5, 1648195, 191.72, 2.15).
pais(iraque, 39309783, arabe, 70.5, 438317, 192.05, 4.27).
pais(irlanda, 5007069, irlandes, 82.3, 70273, 388.70, 1.61).
pais(israel, 9053300, hebraico, 82.8, 20770, 395.10, 3.09).
pais(italia, 60297396, italiano, 82.9, 301340, 2001.24, 1.29).
pais(jamaica, 2948279, ingles, 74.4, 10991, 15.72, 2.01).
pais(japao, 126226568, japones, 84.2, 377944, 5081.77, 1.37).
pais(jordania, 10101694, arabe, 74.4, 89342, 44.69, 2.74).
pais(cazaquistao, 18513930, russo, 73.2, 2724900, 179.33, 2.76).
pais(quenia, 52573973, swahili, 66.3, 580367, 95.50, 3.52).
pais(kiribati, 117606, ingles, 68.1, 811, 0.21, 3.60).
pais(kuwait, 4207083, arabe, 75.4, 17818, 134.62, 2.03).
pais(quirguistao, 6456900, russo, 71.4, 199951, 8.45, 2.95).
pais(laos, 7169455, lao, 67.6, 236800, 18.17, 2.74).
pais(letonia, 1912789, letao, 74.7, 64589, 34.29, 1.54).
pais(libano, 6855713, arabe, 78.9, 10400, 55.14, 1.72).
pais(lesoto, 2125268, ingles, 53.7, 30355, 2.58, 3.28).
pais(liberia, 4937374, ingles, 63.7, 111369, 3.29, 4.41).
pais(libia, 6777452, arabe, 72.7, 1759540, 25.42, 2.27).
pais(liechtenstein, 38019, alemao, 83.0, 160, 6.91, 1.25).
pais(lituania, 2786844, lituano, 75.7, 65300, 55.11, 1.61).
pais(luxemburgo, 645397, luxemburgues, 82.1, 2586, 73.26, 1.38).
pais(madagascar, 26969307, frances, 66.7, 587041, 14.47, 4.01).
pais(malawi, 18628747, ingles, 63.8, 118484, 10.90, 4.25).
pais(malasia, 32447385, malaio, 76.0, 329847, 364.70, 2.01).
pais(maldivas, 530953, dhivehi, 78.6, 298, 5.69, 1.81).
pais(mali, 19658031, frances, 58.9, 1240192, 17.35, 5.92).
pais(malta, 502653, maltes, 82.3, 316, 14.96, 1.45).
pais(ilhas_marshall, 58791, marshallese, 65.2, 181, 0.22, 3.50).
pais(mauritania, 4525696, arabe, 64.7, 1030700, 8.27, 4.43).
pais(mauricia, 1265711, frances, 74.4, 2040, 13.26, 1.38).
pais(mexico, 126014024, espanhol, 75.0, 1964375, 1192.25, 2.12).
pais(micronesia, 113815, ingles, 67.8, 702, 0.37, 3.20).
pais(moldavia, 2657637, romeno, 71.8, 33851, 11.91, 1.55).
pais(monaco, 38964, frances, 0, 2, 7.18, 1.52).
pais(mongolia, 3225167, mongol, 69.7, 1564116, 14.06, 2.87).
pais(montenegro, 622137, montenegrino, 76.8, 13812, 5.45, 1.66).
pais(marrocos, 36910560, arabe, 76.5, 446550, 124.00, 2.42).
pais(mocambique, 30366036, portugues, 60.2, 799380, 15.33, 4.89).
pais(mianmar, 54045420, birmanes, 66.9, 676578, 76.19, 2.18).
pais(namibia, 2494530, ingles, 63.4, 824292, 12.47, 3.28).
pais(nauru, 10084, ingles, 0, 21, 0.11, 2.90).
pais(nepal, 28608710, nepales, 70.5, 147181, 34.19, 2.05).
pais(holanda, 17332850, holandes, 81.8, 41543, 912.84, 1.66).
pais(nova_zelandia, 4841000, ingles, 81.9, 268838, 206.93, 1.87).
pais(nicaragua, 6545502, espanhol, 74.3, 130370, 13.81, 2.16).
pais(niger, 23310715, frances, 62.0, 1267000, 12.91, 6.82).
pais(nigeria, 200963599, ingles, 54.3, 923768, 448.12, 5.39).
pais(coreia_do_norte, 25666161, coreano, 72.1, 120538, 28.50, 1.91).
pais(macedonia_do_norte, 1836713, macedonio, 0, 25713, 12.55, 1.43).
pais(noruega, 5347896, noruegues, 82.8, 323802, 403.34, 1.53).
pais(oma, 5266535, arabe, 77.6, 309500, 76.33, 2.88).
pais(paquistao, 216565318, urdu, 67.1, 796095, 278.22, 3.55).
pais(palau, 18233, ingles, 69.1, 459, 0.32, 1.90).
pais(palestina, 0, arabe, 0, 0, 0, 0).
pais(panama, 4246439, espanhol, 78.3, 75420, 66.80, 2.01).
pais(papua_nova_guine, 8776109, tok_pisin, 64.3, 462840, 24.32, 3.59).
pais(paraguai, 7044636, espanhol, 74.1, 406752, 38.29, 2.23).
pais(peru, 32510453, espanhol, 76.5, 1285216, 202.01, 2.23).
pais(filipinas, 108116615, ingles, 71.1, 300000, 376.80, 2.53).
pais(polonia, 37970874, polones, 77.6, 312685, 595.86, 1.38).
pais(portugal, 10269417, portugues, 81.3, 92212, 238.91, 1.42).
pais(catar, 2832067, arabe, 80.1, 11586, 146.37, 1.90).
pais(romenia, 19356544, romeno, 75.4, 238391, 250.08, 1.44).
pais(russia, 144373535, russo, 72.7, 17098240, 1699.90, 1.50).
pais(ruanda, 12626950, swahili, 68.7, 26338, 10.21, 3.91).
pais(sao_cristovao_e_nevis, 52823, ingles, 71.3, 261, 1.05, 1.78).
pais(santa_lucia, 182790, ingles, 76.1, 616, 2.12, 1.72).
pais(sao_vicente_e_granadinas, 100455, ingles, 72.4, 389, 0.81, 1.86).
pais(samoa, 202506, samoano, 73.2, 2831, 0.86, 3.20).
pais(san_marino, 33860, italiano, 85.4, 61, 1.64, 1.31).
pais(sao_tome_principe, 215056, portugues, 70.2, 964, 0.43, 3.60).
pais(arabia_saudita, 34268528, arabe, 75.0, 2149690, 792.97, 2.32).
pais(senegal, 16296364, frances, 67.7, 196722, 24.13, 4.43).
pais(servia, 6944975, servio, 75.5, 77474, 52.96, 1.48).
pais(seychelles, 97625, frances, 72.8, 455, 1.70, 2.30).
pais(serra_leoa, 7813215, ingles, 54.3, 71740, 4.12, 4.23).
pais(singapura, 5703569, malaio, 83.1, 716, 372.06, 1.20).
pais(eslovaquia, 5454073, eslovaco, 77.2, 49035, 106.50, 1.52).
pais(eslovenia, 2087946, esloveno, 81.0, 20273, 54.18, 1.58).
pais(ilhas_salomao, 669823, ingles, 72.8, 28896, 1.55, 3.50).
pais(somalia, 15442905, arabe, 57.1, 637657, 4.92, 6.12).
pais(africa_do_sul, 58558270, africaner, 63.9, 1219090, 351.43, 2.38).
pais(coreia_do_sul, 51709098, coreano, 82.6, 99720, 1630.53, 0.92).
pais(sudao_do_sul, 11062113, ingles, 57.6, 644329, 4.04, 5.52).
pais(espanha, 47076781, espanhol, 83.3, 505370, 1402.37, 1.23).
pais(sri_lanka, 21803000, tamil, 76.8, 65610, 84.01, 2.20).
pais(sudao, 42813238, arabe, 65.1, 1861484, 30.87, 4.43).
pais(suriname, 581372, holandes, 71.6, 163820, 3.67, 2.47).
pais(suecia, 10285453, sueco, 82.5, 450295, 530.88, 1.66).
pais(suica, 8574832, alemao, 83.6, 41277, 703.08, 1.52).
pais(siria, 17070135, arabe, 71.8, 185180, 20.28, 2.83).
pais(tajiquistao, 9321018, persa, 70.9, 144100, 8.24, 3.32).
pais(tanzania, 58005463, swahili, 65.0, 947300, 62.22, 4.95).
pais(tailandia, 69625582, tailandes, 76.9, 513120, 543.55, 1.53).
pais(timor_leste, 3500000, portugues, 69.3, 14874, 1.91, 4.01).
pais(togo, 8082366, frances, 60.8, 56785, 7.55, 4.28).
pais(tonga, 100209, tonganes, 70.8, 747, 0.49, 3.60).
pais(trinidad_e_tobago, 1394973, ingles, 73.4, 5128, 23.99, 1.65).
pais(tunisia, 11694719, arabe, 76.5, 163610, 39.88, 2.17).
pais(turquia, 83429615, turco, 77.4, 783562, 720.10, 2.01).
pais(turcomenistao, 5942089, turcomeno, 68.1, 488100, 45.23, 2.80).
pais(tuvalu, 11646, tuvaluano, 0, 26, 0.04, 2.80).
pais(uganda, 44269594, swahili, 63.0, 241038, 34.39, 4.78).
pais(ucrania, 44385155, ucraniano, 71.6, 603550, 153.78, 1.50).
pais(emirados_arabes_unidos, 9770529, arabe, 77.8, 83600, 421.14, 1.38).
pais(reino_unido, 66834405, ingles, 81.3, 243610, 2827.11, 1.65).
pais(estados_unidos, 328239523, ingles, 78.5, 9833517, 21433.23, 1.80).
pais(uruguai, 3461734, espanhol, 77.8, 176215, 65.37, 1.44).
pais(uzbequistao, 33580650, uzbeque, 71.6, 447400, 57.92, 2.30).
pais(vanuatu, 299882, frances, 70.3, 12189, 0.82, 3.50).
pais(venezuela, 28515829, espanhol, 72.1, 912050, 99.25, 2.47).
pais(vietna, 96462106, vietnamita, 75.3, 331210, 340.82, 2.09).
pais(iemen, 29161922, arabe, 66.1, 527968, 22.58, 3.83).
pais(zambia, 17861030, ingles, 63.5, 752618, 23.07, 4.70).
pais(zimbabue, 14645468, shona, 61.2, 390757, 21.44, 3.50).

% Predicados para verificação de características dos países
% Predicado para verificar o tamanho da população
populacao_grande(Pais) :-
    pais(Pais, Pop, _, _, _, _, _),
    Pop > 100000000.
    
populacao_media(Pais) :-
    pais(Pais, Pop, _, _, _, _, _),
    Pop > 10000000,
    Pop =< 100000000.
    
populacao_pequena(Pais) :-
    pais(Pais, Pop, _, _, _, _, _),
    Pop =< 10000000.

% Predicado para verificar o idioma oficial
fala_idioma(Pais, Idioma) :-
    pais(Pais, _, Idioma, _, _, _, _).

% Predicado para verificar a expectativa de vida
expectativa_alta(Pais) :-
    pais(Pais, _, _, Exp, _, _, _),
    Exp >= 75.
    
expectativa_media(Pais) :-
    pais(Pais, _, _, Exp, _, _, _),
    Exp >= 65,
    Exp < 75.
    
expectativa_baixa(Pais) :-
    pais(Pais, _, _, Exp, _, _, _),
    Exp > 0,
    Exp < 65.

% Predicado para verificar a área territorial
area_grande(Pais) :-
    pais(Pais, _, _, _, Area, _, _),
    Area > 1000000.
    
area_media(Pais) :-
    pais(Pais, _, _, _, Area, _, _),
    Area > 100000,
    Area =< 1000000.
    
area_pequena(Pais) :-
    pais(Pais, _, _, _, Area, _, _),
    Area =< 100000.

% Predicado para verificar o PIB
pib_muito_alto(Pais) :-
    pais(Pais, _, _, _, _, Pib, _),
    Pib > 1000.

pib_alto(Pais) :-
    pais(Pais, _, _, _, _, Pib, _),
    Pib > 100,
    Pib =< 1000.

pib_medio(Pais) :-
    pais(Pais, _, _, _, _, Pib, _),
    Pib > 10,
    Pib =< 100.

pib_baixo(Pais) :-
    pais(Pais, _, _, _, _, Pib, _),
    Pib =< 10.

% Predicado para verificar a taxa de nascimento
natalidade_alta(Pais) :-
    pais(Pais, _, _, _, _, _, Taxa),
    Taxa > 4.

natalidade_media(Pais) :-
    pais(Pais, _, _, _, _, _, Taxa),
    Taxa > 2,
    Taxa =< 4.

natalidade_baixa(Pais) :-
    pais(Pais, _, _, _, _, _, Taxa),
    Taxa =< 2.

% Predicados para verificar primeira e última letra do nome do país
comeca_com(Pais, Letra) :-
    atom_string(Pais, PaisString),
    string_lower(PaisString, PaisLower),
    sub_string(PaisLower, 0, 1, _, LetraInicialStr),
    atom_string(Letra, LetraInicialStr).

termina_com(Pais, Letra) :-
    atom_string(Pais, PaisString),
    string_lower(PaisString, PaisLower),
    string_length(PaisLower, Len),
    UltimoIdx is Len - 1,
    sub_string(PaisLower, UltimoIdx, 1, 0, LetraFinalStr),
    atom_string(Letra, LetraFinalStr).

% Predicados para verificar o tamanho do nome do país
nome_curto(Pais) :-
    atom_string(Pais, PaisString),
    string_length(PaisString, Len),
    Len =< 6.
    
nome_longo(Pais) :-
    atom_string(Pais, PaisString),
    string_length(PaisString, Len),
    Len > 12.