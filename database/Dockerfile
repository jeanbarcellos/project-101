FROM postgres:14.5

COPY 00_structure.sql /docker-entrypoint-initdb.d/
COPY 01_data.sql /docker-entrypoint-initdb.d/
