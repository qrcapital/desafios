# Desafio Backend Pleno

Olá pessoa desenvolvedora, tudo bem?

Nosso desafio será tanto uma avaliação técnica, quanto a sua capacidade de entender um domínio de problema.

## Domínio do problema

O objetivo é criar uma API que analisa opniões de tweets sobre Bitcoin. A API permitirá cadastrar usuário do twitter e o tweet e posteriormente processar a opnião geral do usuário é positiva ou negativa.

## Desafio

Vamos dividir o sistema em duas partes:

A primeira parte é construir uma API (REST), que possui os seguintes endpoints:

- **Adicionar tweet para análise**: Através de um POST, esse endpoint cadastra o usuário deve cadastrar autor, texto e link do tweet para ser processado. Ex:

Formato JSON:
```json
{
    "author": "michael_saylor",
    "text": "Beginning is easy, continuing is hard. -Japanese proverb on #Bitcoin",
    "link": "https://twitter.com/michael_saylor/status/1406936342664290307",
}
```

A verificação do texto deve ocorrer antes do cadastro.

- **Opnião do autor**: Através de um GET, retorna a média das opniões do autor, e o resumo (se é positiva ou negativa). A forma de pesquisa é pelo author, direto na URL, Ex: 

```rest
GET http://[URL]/opnion/[AUTOR]

EX: http://localhost:3000/opnion/michael_saylor
```

Retorno

```json
{
    "opnion": "positive",
    "date": "2021-06-21",
    "avg": 0.8
}
```

**Sobre o algoritmo**

O algoritmo VADER é um modelo usado para análise de sentimentos de textos, analisando polaridade (postivo/negativo) e intensidade de emoção. Nosso projeto focará apenas na polaridade (Veja em referências).

## Requisitos

- Ser escrito em qualquer linguagem, porém damos preferência para Javascript e/ou Python
- Banco de dados pode ser PostgreSQL, SQLite ou MySQL
- Ter testes automatizados
- Forkar esse desafio e criar o seu projeto (ou workspace) usando a sua versão desse repositório, tão logo acabe o desafio, submeta um _pull request_. 

## Dúvidas

Quaisquer dúvidas que você venha a ter, consulte as _issues_ para ver se alguém já não a fez e caso você não ache sua resposta, abra você mesmo uma nova issue!

Ou se preferir, encaminhe um email para <showmecode@qr.capital>, colocando seu nome e desafio no assunto do email.

## Referências
* [Bliblioteca VADER para Python](https://github.com/cjhutto/vaderSentiment)
* [Bliblioteca VADER para Javascript](https://github.com/vaderSentiment/vaderSentiment-js)
