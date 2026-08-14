#!/bin/sh

# Cria o config.toml com sintaxe literal do TOML ('''
cat <<EOF > config.toml
[app]
address = "0.0.0.0:9000"

[db]
host = "${LISTMONK_db__host}"
port = ${LISTMONK_db__port}
user = "${LISTMONK_db__user}"
password = '''${LISTMONK_db__password}'''
database = "${LISTMONK_db__database}"
ssl_mode = "${LISTMONK_db__ssl_mode}"
params = "${LISTMONK_db__params}"
EOF

echo "=== ARQUIVO CONFIG.TOML GERADO (SEM MOSTRAR SENHA) ==="
grep -v "password" config.toml
echo "======================================================"

./listmonk --install --idempotent --yes --config config.toml
./listmonk --config config.toml
