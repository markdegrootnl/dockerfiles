#!/bin/sh
set -e

sed -i "s|'username' => 'secret',|'${username}' => '${password}',|g" ${exposeConfigPath}

if [[ $# -eq 0 ]]; then
    exec tini -- /src/expose-server serve ${domain} --port ${port} --validateAuthTokens
else
    exec tini -- /src/expose-server "$@"
fi
