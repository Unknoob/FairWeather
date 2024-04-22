1, 2, 3, Testando.

## Como rodar:
O projeto foi desenvolvido no XCode 14.3.1, mas não deve ter problemas para rodar no XCode 15.
A única dependência externa do projeto é o SwiftLint.

## Descrição:
Esse projeto foi criado uns dois anos atrás por mim como teste para uma outra empresa. Como me disseram que o projeto que eu precisava mandar podia ser um que eu já tinha pronto resolvi partir desse e implementar mais coisas. (Nessa outra empresa o tempo de desenvolvimento foi só de 3 horas)

## Features:

#### WeatherViewController
É a ViewController principal do projeto, ela utiliza UIKit e arquitetura VIP. (Foi um legado do teste anterior)
As classes de Interactor, Presenter e Factory dessa ViewController têm testes unitários.
Ela usa uma classe de network legada baseada em completion para as chamadas.
Originalmente ela usava uma API mockada de previsão do tempo com apenas 1 cidade, eu melhorei ela pra usar a API OpenWeather e pegar uma cidade salva pelo usuário como Home.

#### CitySearchView
Desenvolvida do zero em SwiftUI, utilizei uma outra classe de Network baseada em async/await.
Ela serve para realizar a busca de cidades por nome, pra fim de geolocalização(A API do OpenWeather recebe os parâmetros de latitude e longitude nas chamadas de previsão do tempo)

#### WeatherForecastView
Também desenvolvida em SwiftUI e com async/await. Essa tela mostra a previsão do tempo retornada pelo OpenWeather para as próximas horas. Ela é utilizada tanto após a busca, permitindo setar uma cidade específica para aparecer na `WeatherViewController`, quanto para mostrar a previsão pelo botão `Forecast` da própria `WeatherViewController`

## Problemas
- Não tive tempo de implementar telas de erro ou tratamentos melhores para os erros.
- Não tive tempo de criar testes para a parte de SwiftUI. (Precisaria dar uma pesquisada melhor também)
- Sim, a chave de API do OpenWeather está comitada(um abraço pessoal de segurança), deixei pra facilitar a avaliação, mas assim que avaliarem eu vou revogar ela.

## Considerações finais
- Foi minha primeira vez integrando SwiftUI + UIKit e acabou sendo bem mais fácil do que imaginei.
- SwiftUI + ViewModel é muito mais rápido do que criar Interactor + Presenter + Router + ViewController, a decisão de fazer as partes novas em SwiftUI me economizou muito tempo.
- Perdi bastante tempo criando uma tela de previsão do tempo que usava a API mockada do outro teste pois achei que integrar com a OpenWeather ia demorar muito, no final acabei integrando mesmo assim e exclui a tela nova que criei.
- Das tecnologias usadas, eu sou mais habituado com VIP e Testes Unitários, a parte de AsyncAwait e SwiftUI foi um exercício pra me habituar mais nessas tecnologias novas.
- As telas são feias, o foco do projeto acabou ficando em mostrar Arquitetura + Testes + SwiftUI + AsyncAwait.
- A ideia original era mostrar um mapa onde o usuário pudesse tocar em um ponto e carregar a previsão do tempo naquelas coordenadas, mas a implementação de mapas no SwiftUI é horrível no XCode 14. Como precisaria atualizar meu MacOS para o Sonoma e depois o Xcode para o 15 preferi só mudar para a busca por cidade pois achei que seria menos arriscado.
- A interface do app é em inglês mas eu puxo os resultados da OpenWeather em português pois ninguém merece Brasil com Z e temperatura em Farenheit.
- O histórico completo do GIT está nesse repositório, se quiserem ver como o projeto era na entrega de dois anos atrás é só voltar pro commit `0bd8fd077c95c143b3d2b9d174b67ad39b276f33`

## O que eu faria diferente
Quis economizar tempo usando um teste antigo e acabei reescrevendo 90% dele, talvez eu ganhasse mais tempo se tivesse feito tudo em SwiftUI desde o começo.
Teria atualizado meu MacOS/XCode antes para poder usar a ideia do mapa.
