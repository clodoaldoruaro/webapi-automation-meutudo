<h1 align="center">
  Automação de testes web e api Meu Tudo
</h1>

Este documento descreve o passo a passo para rodar o projeto de testes automatizados

## Tecnologias utilizadas

- [Python](https://www.python.org/)
- [Robotframework](https://robotframework.org/)
- [Lib Playwright](https://playwright.dev/)
- [VSCode](https://code.visualstudio.com/)
- [Node JS](https://nodejs.org/)


## Arquivos e Bibliotecas obrigatórias para rodar o projeto

- [Versão mais recente do Python, utilizei a 3.12.2](https://www.python.org/downloads/)

- Atualizar o gerenciador de pacotes (pip)
```
pip install -U pip
```
- [Versão mais recente do Robotframework, utilizei a 7.0](https://robotframework.org/)
```
pip install robotframework
```
- [Playwright precisa do Node JS para rodar, utilizei a 20.11.1](https://nodejs.org/en/download/)
- [Versão mais recente do Playwright, utilizei a 18.1.0](https://github.com/MarketSquare/robotframework-browser)
```
pip install robotframework-browser
rfbrowser init
```
- [Versão mais recente do Json Library, utilizei a 0.5](https://pypi.org/project/robotframework-jsonlibrary/)
```
pip install robotframework-jsonlibrary
```
- [Versão mais recente do Requests Library, 0.9.6](https://docs.robotframework.org/docs/different_libraries/requests)
```
pip install robotframework-requests
```
IMPORTANTE: Recomenda-se reiniciar a máquina após a configuração do ambiente

Para rodar o projeto, no terminal, acessar o repositório clonado. Ex: /c/Projetos/web-automation-meutudo
e rodar o caminho que contém os arquivos de testes do robot:
```
robot -d ./logs tests/
```

## Features da suíte web

- CT001 - Deve clicar nos três botões apresentados na tela
- CT002 - Deve clicar em todos os botões edit e delete da grid

## Features da suíte api

- CT001 - GET no /users, valida response, schema e status code
- CT002 - GET no /posts, valida response, schema e status code
- CT003 - GET no /comments, valida response, schema e status code
- CT004 - POST no /posts e valida response status
- CT005 - PUT no /posts/1 e valida response status
- CT006 - DELETE no /posts/1 e valida response status