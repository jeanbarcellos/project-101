# Projeto 101

## Docker

### **Opção 1 - Apenas rodar projeto | Compose com imagens do Docker HUB**

Rodar o Docker Compose:

```bash
docker-compose up -d
```

- `--build`: Crie as imagens antes de iniciar os contêineres.
- `-d` ou `--detach`: Modo desanexado: execute os contêineres em segundo plano, imprima novos nomes de contêineres.

Verificar status

```bash
docker-compose ps
```

Derrubar compose

```bash
docker-compose down
```

_ATENÇÃO_: Na primeira vez, você deve importar os arquivos de criação dos bancos de dados que estão nos diretórios:

- [`./database/00_structure.sql`](database/00_structure.sql)
- [`./database/01_data.sql`](database/01_data.sql)

<br>

### **Opção 2 - Apenas rodar projeto fazendo build**

Se você deseja apenas levantar o banco de dado, para rodar o `backend` e `frontend` separadamente execute.

```bash
docker-compose -f docker-compose_build.yml up -d
```

Derrubar/baixar containers

```bash
docker-compose down
```

<br>

### **Opção 3 - Desenvolvimento - Apenas os recursos**

Se você deseja apenas levantar o banco de dado, para rodar o `backend` e `frontend` separadamente execute.

```bash
docker-compose -f docker-compose_only-resources.yml up -d
```

Derrubar/baixar containers

```bash
docker-compose down
```

<br>

### **Opção 4 - Desenvolvimento - Containers em _bind mount_**

Levantar container em modo desenvolvimento fazendo o _bind mount_ dos arquivos. Neste modo não geramos imagens.

```bash
docker-compose -f docker-compose_dev.yml up -d
```

Após levantar os containers você deve acessar o `project101_frontend-reactjs`, instalar as dependências e startar o app

```bash
# Acesse o terminal do frontend, instale o node
docker exec -it project101_frontend-reactjs bash

# Instalar dependências
yarn install

# Dê permissão 777 para que você consiga apagar o diretório futuramente
chmod -R 777 node_modules/

# Rodar app
yarn start
```

#### **Extra - Rodar individualmente em _bind mount_**

**Backend**

Executar o container

```bash
# Opção 1

docker run -it --rm -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven --name my-maven-project maven:3.6.3-jdk-11-slim bash

docker run -it --rm \
  --network project101_net \
  -p 8080:8080 \
  -v "$(pwd)":/usr/src/mymaven \
  -w /usr/src/mymaven \
  --name my-maven-project \
  maven:3.6.3-jdk-11-slim bash


# Opção 2 - Fazendo cache local

docker volume create --name maven_repo

docker run -it --rm \
  --network project101_net \
  -p 8080:8080 \
  -e DB_HOST=database \
  -e DB_PORT=5432 \
  -v "maven_repo":/root/.m2 \
  -v "$PWD":/usr/src/mymaven  \
  -v "$PWD/target":/usr/src/mymaven/target \
  -w /usr/src/mymaven \
  --name my-maven-project \
  maven:3.6.3-jdk-11-slim bash


# Opção 3 -  Rodar usando diretório de cache .m2 comparilhado

docker run -it --rm \
  --network project101_net \
  -p 8080:8080 \
  -e DB_HOST=database \
  -e DB_PORT=5432 \
  -v "$HOME/.m2":/root/.m2 \
  -v "$PWD":/usr/src/mymaven  \
  -v "$PWD/target:/usr/src/mymaven/target" \
  -w /usr/src/mymaven \
  --name my-maven-project \
  maven:3.6.3-jdk-11-slim bash
```

**Frontend**

Neste modo não geraremos as imagens, apenas executaremos o container fazendo _bind mount_ do arquivos.

Executar o container

```bash
# Linux
docker run --rm --volume "$(pwd):/srv/react-docker" --workdir "/srv/react-docker" --publish 3000:3000 -it node bash

#windows
docker run --rm --volume "<PROJECT-PATH-ABS>:/srv/react-docker" --workdir "/srv/react-docker" --publish 3000:3000 -it node bash
```

- Em `<PROJECT-PATH-ABS>` informar o path absoluto deste projeto+

Exemplo

```bash
docker run --rm --volume "/home/jean.barcellos/www/project-101/frontend-reactjs:/srv/react-docker" --workdir "/srv/react-docker" --publish 3000:3000 -it node bash

```

Segue uma breve explicação sobre os parâmetros deste comando:

- `--volume "/home/project-dir:/srv/react-docker"`: Cria um link entre a pasta do computador hospedeiro (`/home/project-dir`) com a pasta do container (`/srv/react-docker`).
- `--workdir "/srv/react-docker"`: Diretório inicial quando o container for iniciado.
- `--publish 3000:3000`: Cria um link entre a porta `3000` do container com a porta `3000` do computador hospedeiro.
- `-it`: Cria um link entre o terminal do container com o terminal do computador hospedeiro.
- `-rm`: Remove antigos containers (muito útil depois da primeira execução).

<br>

### **Opção 5 - Manual - Geração das imagens manualmente**

Criar rede:

```bash
docker network create project101_net
```

#### **Database**

Criar volume:

```bash
docker volume create project101_database_data
```

Rodar container:

```bash
docker run -d --rm \
  -p 5532:5432 \
  --network project101_net \
  -v "project101_database_data:/var/lib/postgresql/data" \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=project101_java \
  --name project101_database \
  postgres:14.5
```

Importar os scripts para criação do banco:

- `00_structure.sql` - Estrutura
- `01_data.sql` - Dados iniciais como usuários e papeis

<br>

#### **Backend**

Acessar diretorio

```bash
cd backend-java
```

Empacotar o projeto

```bash
mvn clean package -DskipTests
```

Gerar imagem Docker

```bash
docker image build -t jeanbarcellos/project101_backend-java .
```

_ATENÇÃO:_

Para levantar um container com a imagem recém criada, usando o comando:

```bash
docker run -i --rm \
  -p 8081:8080 \
  --network project101_net \
  -e DB_HOST=database \
  -e DB_PORT=5432 \
  --name project101_backend-java \
  jeanbarcellos/project101_backend-java
```

- `-i` ou `--interactive`: Mantenha o STDIN aberto mesmo se não estiver conectado
- `--rm`: Remova automaticamente o contêiner quando ele sair
- `-p` ou `--publish`: Definição da porta
- `--name`: Atribuir um nome ao contêiner
- `--network`: Conectar um contêiner a uma rede
- `-v` ou `--volume`: Vincular montar um volume

#### **Frontend**

Acessar diretorio

```bash
cd frontend-reactjs
```

Fazer o build do projeto

```bash
yarn build
```

Atenção: caso não tenha instalado as dependências ainda, deverá faze-lo antes de gerar o build

```bash
yarn install
```

Gerar imagem Docker

```bash
docker image build -t jeanbarcellos/project101_frontend-reactjs .
```

_ATENÇÃO:_

Para levantar um container com a imagem recém criada, usando o comando:

```bash
docker run -i --rm -p 8082:80 --name project101_frontend-reactjs jeanbarcellos/project101_frontend-reactjs
```

<br>

### **Extra**

Acessar containeres em modo bash

```bash
# Database
docker exec -it project101_database bash

# Backend
docker exec -it project101_backend-java bash

# Frontend
docker exec -it project101_frontend-reactjs bash
```
