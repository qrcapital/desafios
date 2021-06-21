# Desafio Frontend Pleno

Olá pessoa desenvolvedora, tudo bem?

Nosso desafio será tanto uma avaliação técnica, quanto a sua capacidade de entender um domínio de problema.

## Domínio do problema

Gostariamos que fosse criado uma dashboard de pesquisa de criptomoedas, onde é possível pesquisar, selecionar quais moedas o usuário deseja acompanhar a cotação do preço.

**Buscador:** O componente de busca funciona no modelo _autocomplete_, ou seja, quando o usuário escreve os possíveis resultados começam a surgir. Além disso, uma vez que o usuário clica em um item do _autocomplete_, a moeda pesquisada é adicionada no _dashboard_.

**Dashboard:** O componente _dashboard_ agrupa todas as moedas que serão acompanhadas pelo usuário. Cada item de _dashboard_ deve apresentar as seguinte informações:

* **Nome:** Exibe o nome da moeda.
* **Símbolo:** Exibe o símbolo da moeda.
* **Preço:** Exibe o preço da moeda.
* **Sinalização:** Exibe a variação (em %) do preço da moeda nas últimas 24h. Caso tenha aumentado, a variação precisa estar com a cor verde, do contrário, vermelha.

## Desafio

O desafio consiste em implementar a solução discutida acima utlizando a API da CyptoCompare.

## Requisitos

- Utilizar React.
- Utilizar BulmaCSS ou TailwindCSS.
- Utilizar Javascript ou Typescript.
- Ter testes automatizados.
- README explicando como executar seu projeto.
- Forkar esse desafio e criar o seu projeto (ou workspace) usando a sua versão desse repositório, tão logo acabe o desafio, submeta um _pull request_. 

## Critério de avaliação

-   **Organização do código**: Separação de módulos, view e model, back-end e front-end
-   **Clareza**: O README explica de forma resumida qual é o problema e como pode rodar a aplicação?
-   **Assertividade**: A aplicação está fazendo o que é esperado? Se tem algo faltando, o README explica o porquê?
-   **Legibilidade do código** (incluindo comentários)
-   **Cobertura de testes** (Não esperamos cobertura completa)
-   **Histórico de commits** (estrutura e qualidade)


## Dúvidas

Quaisquer dúvidas que você venha a ter, consulte as _issues_ para ver se alguém já não a fez e caso você não ache sua resposta, abra você mesmo uma nova issue!

Ou se preferir, encaminhe um email para <showmecode@qr.capital>, colocando seu nome e desafio no assunto do email.

## Referências
* [CryptoCompare API](https://min-api.cryptocompare.com/)