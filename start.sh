#!/bin/sh

echo "=== DIAGNOSTICO DE CREDENCIAIS ==="
echo "Host: $LISTMONK_db__host"
echo "Porta: $LISTMONK_db__port"
echo "Usuario: $LISTMONK_db__user"
echo "Banco: $LISTMONK_db__database"
echo "Tamanho da Senha Recebida: ${#LISTMONK_db__password} caracteres"
echo "=================================="

cat <<EOF > config.toml
[app]
address = "0.0.0.0:9000"

[db]
host = "${LISTMONK_db__host}"
port = ${LISTMONK_db__port}
user = "${LISTMONK_db__user}"
password = "${LISTMONK_db__password}"
database = "${LISTMONK_db__database}"
ssl_mode = "${LISTMONK_db__ssl_mode}"
params = "${LISTMONK_db__params}"
EOF

./listmonk --install --idempotent --yes --config config.toml
./listmonk --config config.toml
