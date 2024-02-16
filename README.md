<h1 align="center">
  Automação de testes web Meu Tudo
</h1>

Este documento descreve o passo a passo para rodar o projeto de testes automatizados web feito no [the-internet.herokuapp](https://the-internet.herokuapp.com/).

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
- [Playwright precis do Node JS para rodar, utilizei a 20.11.1](https://nodejs.org/en/download/)

- [Versão mais recente do Playwright, utilizei a 18.1.0](https://github.com/MarketSquare/robotframework-browser)
```
pip install robotframework-browser
rfbrowser init
```
- [Versão mais recente do Json Library, utilizei a 2.0.0](https://pypi.org/project/robotframework-jsonlibrary/)
```
pip install robotframework-jsonlibrary
```

Recomenda-se reiniciar a máquina após a instalação do ambiente

Para rodar o projeto, no terminal, acessar o repositório clonado. Ex: /c/Projetos/web-automation-meutudo
e rodar o arquivo cliques.robot:
```
robot -d ./logs tests/cliques.robot
```

## Features do projeto

- CT001 - Deve clicar nos três botões apresentados na tela
- CT002 - Deve clicar em todos os botões edit e delete da grid