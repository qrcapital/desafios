# Desafio Backend Sênior

Olá pessoa desenvolvedora, tudo bem?

Nosso desafio será tanto uma avaliação técnica, quanto a sua capacidade de entender um domínio de problema.

## Domínio do problema

Gostariamos que fosse construído um painel de arbitragem, exibindo oportunidades de trade do par BTC/USD (ticker) entre Deribit e Binance, em tempo-real.

É isso!

Confundiu tudo? Não se preocupe, nós explicamos para você.

**Arbitragem:** É um tipo de negociação muito comum no mercado financeiro, onde basicamente você *compra mais barato* um ativo em um mercado/exchange e *vende mais caro* esse ativo em outro mercado/exchange.

Por exemplo:

Suponhamos que na Binance o preço de compra do bitcoin esteja U$ 5.000,00 e na Deribit o preço de venda do bitcoin esteja U$ 5.900,00. Neste cenário, a arbitragem correta seria comprar na Binance e vender na Deribit. 

**Spread:** A diferência entre o preço de compra imediato e o preço de venda imediato.

**Ticker:** É nome único de um ativo em um mercado/exchange. Geralmente o ticker é utilizado como identificador único de um tick, que é um conjunto de informações sobre as negociações de um ativo, em um determinado intervá-lo de tempo (geralmente em milisegundos).

**Deribit/Binance:** Exchanges para compra e venda de criptomoedas.

## Desafio

Vamos dividir o sistema em duas partes:

A primeira parte é construir uma API (REST), que possui os seguintes endpoints:

- *Adicionar o valor do Spread para o alerta*: Esse valor determina o valor mínimo de spread para ser enviado no canal de WebSocket.
- *Histórico das oportunidades*: Retorna o histórico de todas de oportunidades de compra, de acordo com o spread determinado. Caso o spread não foi adicionado pelo usuário, o padrão é 2%. 

Formato JSON:
```json
{
    "timestamp": "",  // timestamp de consulta
    "data": [
        {
            "symbol": "BTC/USD",    // ticker
            "spread": 15.00,        // spread
            "buyOn": "binance",     // onde compra mais barato
            "timestamp": ""         // timestamp da oportunidade de arbitragem
        },
        (...)
    ]
}
```

A segunda parte é um endpoint, com suporte a websocket, que possui as seguintes caracteristicas:

- *Canal de HB (heart beat)*: Para identificar se o websocket está com a conexão.
- *Canal de alertas*: Caso a arbitragem seja maior ou igual do spread de alerta, exibir a oportunidade no WebSocket. 

Formato JSON:
```json
{
    "symbol": "BTC/USD",    // ticker
    "spread": 15.00,        // spread
    "buyOn": "binance",     // onde compra mais barato
    "timestamp": ""         // timestamp da oportunidade de arbitragem
}
```

## Requisitos

- Ser escrito em qualquer linguagem, porém damos preferência para Javascript e/ou Python
- Banco de dados pode ser PostgreSQL, SQLite ou MySQL
- Usar Docker ou Kubernetes
- Ter testes automatizados
- Forkar esse desafio e criar o seu projeto (ou workspace) usando a sua versão desse repositório, tão logo acabe o desafio, submeta um _pull request_. 

## Critério de avaliação

-   **Organização do código**: Separação de módulos, view e model, back-end e front-end
-   **Clareza**: O README explica de forma resumida qual é o problema e como pode rodar a aplicação?
-   **Assertividade**: A aplicação está fazendo o que é esperado? Se tem algo faltando, o README explica o porquê?
-   **Legibilidade do código** (incluindo comentários)
-   **Cobertura de testes** (Não esperamos cobertura completa)
-   **Histórico de commits** (estrutura e qualidade)
-   **Usabilidade**: A API é intuitiva?
-   **Escolhas técnicas**: A escolha das bibliotecas, banco de dados, arquitetura, etc, é a melhor escolha para a aplicação?

## Dúvidas

Quaisquer dúvidas que você venha a ter, consulte as _issues_ para ver se alguém já não a fez e caso você não ache sua resposta, abra você mesmo uma nova issue!

## Referências
* [API de consulta de preços Binance (websocket)](https://binance-docs.github.io/apidocs/spot/en/#individual-symbol-book-ticker-streams)
* [API de consulta de preços Deribit (websocket)](https://docs.deribit.com/#public-get_order_book) 
