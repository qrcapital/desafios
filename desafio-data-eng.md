# Desafio Data Enginner

Olá pessoa engenheira de dados, tudo bem?

Nosso desafio será tanto uma avaliação técnica, quanto a sua capacidade de entender um domínio de problema.

## Domínio do problema

O objetivo é criar um stream de dados que coleta preço em tempo real do bitcoin, na exchange Kraken e registrar no formato csv. 

## Desafio

Vamos dividir o sistema em duas partes:

Primeira parte consiste em consumir a api da exchange de cripto Kraken, usando alguma plataforma de streamming de dados, como Apache Kafka ou Apache Flink.

Segunda parte consiste em estruturar os dados em arquivos csv, respeitando a seguinte nomenclatura de pastas e arquivos.

- ./Exhange/24HH_DIA_MÊS_ANO_simbolo_de_negociacao.csv

Ex:

Registrar cotação do preço das  do dia 4/11/2022, iniciando às 14h horas:

- ./KRAKEN/14_11_04_22_BTC_USD.csv


## Requisitos
- Utilizar Apache Kafka ou Apache Flink;
- Utilizar Docker para montagem do ambiente;
- Pode escrever em qualquer linguagem, mas damos preferência para Java/Python;
- Forkar esse desafio e criar o seu projeto (ou workspace) usando a sua versão desse; repositório, tão logo acabe o desafio, submeta um _pull request_; 

## Opcional, mas seria muito bom
- Orquestrar a criação dos arquivos usando Apache Airflow;

## Dúvidas

Quaisquer dúvidas que você venha a ter, consulte as _issues_ para ver se alguém já não a fez e caso você não ache sua resposta, abra você mesmo uma nova issue!

Ou se preferir, encaminhe um email para <showmecode@qr.capital>, colocando seu nome e desafio no assunto do email.

# Referências
[1] API da Kraken [aqui](https://docs.kraken.com/websockets/);
