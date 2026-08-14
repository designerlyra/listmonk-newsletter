#!/bin/sh

# Remove qualquer arquivo config.toml do disco
rm -f config.toml

echo "=== INICIANDO LISTMONK PURAMENTE VIA VARIAVEIS DE AMBIENTE ==="
echo "Host: $LISTMONK_db__host"
echo "Usuario: $LISTMONK_db__user"
echo "=============================================================="

# Executa puramente via variaveis de ambiente
./listmonk --install --idempotent --yes --config ""
./listmonk --config ""
