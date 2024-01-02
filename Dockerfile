# define qual pacote sera utilizado sendo possivel passar tambem a versão
FROM node:16-alpine

# diretorio que sera criado no container
WORKDIR /app

# passo a passo que sera executado para subir o container personalizado

# passa o package.json para o diretorio/pacote criado no container
COPY package*.json ./

# executa a instalação dos pacotes node
RUN npm install

# copia para o diretorio/pacote criado no container
COPY . .

# expor o container na rota
EXPOSE 3000

CMD [ "npm", "start"]
