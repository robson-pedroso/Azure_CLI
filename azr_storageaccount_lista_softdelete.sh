#!/usr/bin/env bash
#set -x

for NAME in $(az storage account list --query [*].name -o tsv); do
    echo -e "\033[33;1m $NAME $(az storage account blob-service-properties show \
            -n $NAME --query '{SOFT_DEL_CONTAINERS_DAYS:containerDeleteRetentionPolicy.days, SOFT_DEL_BLOB_DAYS:deleteRetentionPolicy.days}') \
            \033[m"

    if [ $? -ne 0 ]; then
        echo "Falha no Script"
        exit 1
    fi
    echo "LISTA DE POLICY DE BACKUP - STORAGE ACCOUNT"
done
