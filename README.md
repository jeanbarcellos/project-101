# Projeto 101

## Docker

Criar rede:

```bash
docker network create project101_net
```

<br>

### **Database**

Criar volume:

```bash
docker volume create project101_database_data
```

Acessar o diretório `database`

```bash
cd database
```

Gerar a imagem com as tabelas já criadas

```bash
docker build -t project101_database .

docker build -t jeanbarcellos/project101_database .
```

_ATENÇÃO:_

Opção 1: Caso queira levantar o container com os o banco já criado e com dados:

```bash
docker run -d --rm \
  -p 5532:5432 \
  --network project101_net \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=project101_java \
  --name project101_database \
  project101_database
```

Opção 2: Caso queira levantar o container e importar manualmente os scripts:

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

<br>

### **Backend**

Empacotar o projeto

```bash
mvn clean package -DskipTests
```

Gerar imagem Docker

```bash
docker image build -t project101_backend-java .
```

_ATENÇÃO:_

Para levantar um container com a imagem recém criada, usando o comando:

```bash
docker run -i --rm \
  -p 8081:8080 \
  --network project101_net \
  -e DB_HOST=database \
  -e DB_PORT=5432 \
  project101_backend-java

  --name project101_backend-java \
#
docker run -i --rm -p 8081:8080 --network project101_net --name project101_backend-java project101_backend-java
```

- `-i` ou `--interactive`: Mantenha o STDIN aberto mesmo se não estiver conectado
- `--rm`: Remova automaticamente o contêiner quando ele sair
- `-p` ou `--publish`: Definição da porta
- `--name`: Atribuir um nome ao contêiner
- `--network`: Conectar um contêiner a uma rede
- `-v` ou `--volume`: Vincular montar um volume

<br>

### **Frontend**

Criar diretório do projeto e dar permissão

```bash
mkdir /home/react-docker

sudo chown -R <USERNAME> /home/react-docker
```

Executar o container

```bash
docker run --rm --volume "/home/react-docker:/srv/react-docker" --workdir "/srv/react-docker" --publish 3000:3000 -it node bash

# Exemplo:
docker run --rm --volume "/home/jean.barcellos/www/project-101/front.reactjs:/srv/react-docker" --workdir "/srv/react-docker" --publish 3000:3000 -it node bash
```

Segue uma breve explicação sobre os parâmetros deste comando:

- `--volume "/home/react-docker:/srv/react-docker"`: Cria um link entre a pasta do computador hospedeiro (`/home/react-docker`) com a pasta do container (`/srv/react-docker`).
- `--workdir "/srv/react-docker"`: Diretório inicial quando o container for iniciado.
- `--publish 3000:3000`: Cria um link entre a porta `3000` do container com a porta `3000` do computador hospedeiro.
- `-it`: Cria um link entre o terminal do container com o terminal do computador hospedeiro.
- `-rm`: Remove antigos containers (muito útil depois da primeira execução).

<br>

**Compose**

Rodar o docker compose:

```bash
docker-compose up --build -d
```

- `up`: Modo desanexado: execute os contêineres em segundo plano, imprima novos nomes de contêineres.
- `--build`: Crie as imagens antes de iniciar os contêineres.
- `-d` ou `--detach`: Executa os containers em background
