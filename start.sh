#!/bin/sh
# 1. Instala o banco se estiver limpo (ou ignora se ja existir)
./listmonk --install --idempotent --yes --config ''

# 2. Inicia o servidor web do Listmonk na porta 9000
./listmonk
