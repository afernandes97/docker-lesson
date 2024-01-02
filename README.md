# Dockerizando uma Aplicação React

O Docker é uma ferramenta open source que simplifica a criação, distribuição e execução de aplicativos em ambientes isolados chamados containers. Este guia demonstra como usar Docker para empacotar e executar uma aplicação React em um container.

## Conteúdo
1. [O que é Docker?](#o-que-é-docker)
2. [Comandos Básicos](#comandos-básicos)
3. [Criando um Container Personalizado](#criando-um-container-personalizado)
4. [Executando a Aplicação React](#executando-a-aplicação-react)
5. [Dockerfile](#dockerfile)
6. [Documentação](#documentação)

## O que é Docker?

Docker é uma plataforma open source que facilita a criação e administração de ambientes. Com Docker, é possível empacotar uma aplicação ou ambiente dentro de um container, fornecendo consistência em diferentes ambientes.

## Comandos Básicos

### Iniciar, Parar e Remover Containers

- Iniciar um container:
  ```
  docker start nome_do_container
  ```

- Parar um container:
  ```
  docker stop nome_do_container
  ```

- Remover um container:
  ```
  docker rm nome_do_container
  ```

- Visualizar containers em execução:
  ```
  docker ps
  ```

## Criando um Container Personalizado

Após configurar o arquivo Dockerfile [Dockerfile](#dockerfile) na raiz do diretório, execute o seguinte comando para criar a imagem do container:

```bash
docker build -t my_personalized_container .
```

- `-t`: Especifica a tag/nome do container.

## Executando a Aplicação React

Para executar a imagem e iniciar a aplicação React:

```bash
docker run --name nome_imagem -p 3000:3000 my_personalized_container
```

- `-p`: Mapeia a porta definida no container para a porta da máquina.

### Exemplo:

```bash
docker run --name react_app -p 3000:3000 my_personalized_container
```

## Dockerfile

O arquivo Dockerfile define as etapas para a criação da imagem. Abaixo está um exemplo para uma aplicação React:

```Dockerfile
# Define qual pacote será utilizado, podendo passar também a versão
FROM node:16-alpine

# Diretório que será criado no container
WORKDIR /app

# Passo a passo que será executado para subir o container personalizado

# Copia o package.json para o diretório/pacote criado no container
COPY package*.json ./

# Executa a instalação dos pacotes Node
RUN npm install

# Copia para o diretório/pacote criado no container
COPY . .

# Expor o container na porta 3000
EXPOSE 3000

# Comando padrão para iniciar a aplicação
CMD [ "npm", "start"]
```

## Documentação

