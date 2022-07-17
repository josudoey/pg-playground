#!/bin/bash
set -e

#see https://github.com/docker-library/postgres/blob/2f6878ca854713264ebb27c1ba8530c884bcbca5/14/bullseye/docker-entrypoint.sh
. /usr/local/bin/docker-entrypoint.sh
docker_temp_server_stop

tee -a /var/lib/postgresql/data/postgresql.conf <<EOF
shared_preload_libraries = 'pglogical'
wal_level = 'logical'
max_worker_processes = 10   # one per database needed on provider node
                            # one per node needed on subscriber node
max_replication_slots = 10  # one per node needed on provider node
max_wal_senders = 10        # one per node needed on provider node
EOF

docker_temp_server_start