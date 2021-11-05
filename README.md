# README

Pequena aplicação para realizar postagens sobre o tempo no twitter

## Como realizar o buid da aplicação

Para clonar e buildar a aplicação é necessário ter docker-compose instalado na máquina e executaar no terminal:

```
git clone git@github.com:adubas/twitter.git
```
```
cd twitter
```
```
docker-compose build
```

## Como rodar a aplicação

Para executar a aplicação é necessário ter o docker-compose instalado na máquina e executar os seguintes passos

```
docker-compose run web bash
```

Uma vez dentro do bash, é necessário:

```
$ rails s -b 0.0.0.0
```

A aplicação por default irá rodar na porta 3000

## Como testar a aplicação

Para testar a aplicação é necessário ter o docker-compose instalado na máquina e executar os seguintes passos

```
docker-compose run web bash
```

Uma vez dentro do bash, é necessário:

```
$ rspec
```
