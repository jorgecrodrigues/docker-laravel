# Docker Laravel

Projeto para facilitar a configuração e execução de uma aplicação Laravel diretamente e um container do Docker.

## Requisitos

* Docker 18+

## Instalação

A partir do Dockerfile, constrói uma imagem baseada no Ubuntu, com as dependências necessárias para executar a aplicação.
``` 
docker build -t image .
 ```

Após criar a imagem, execute o comando abaixo para criar e executar o container em _background_ e fazer o mapeamento do volume do diretório do _host_ atual `/var/www/` dentro do container.

``` 
docker run --detach --publish 80:80 --volume `pwd`:/var/www/:rw --name app image
``` 

Execute o comando abaixo para ter acesso ao terminal interativo.

``` 
docker exec -it app /bin/bash
``` 

No terminal execute o comando abaixo, esse comando irá criar a aplicação no diretório _application_.

```
root@CONTAINER ID:/var/www# ./build

```

Para ver o IP do container pelo host atual execute o código abaixo.

```
docker inspect app | grep IPAddress

```