# Projeto 101 - Database

## Docker

### **Opção 1 - Rodar com imagem Postgres**

Criar volume:

```bash
docker volume create project101_database_data
```

Rodar container

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

### **Opção 2 - Gerar a prórpia imagem**

Nesta opção vocẽ pode gerar a imagem com as tabelas já criadas.

```bash
docker build -t jeanbarcellos/project101_database .
```

Rodar container

```bash
docker run -d --rm \
  -p 5532:5432 \
  --network project101_net \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=project101_java \
  --name project101_database \
  jeanbarcellos/project101_database
```

<br>
