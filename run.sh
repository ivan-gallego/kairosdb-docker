#!/bin/bash
sed -i "s/^kairosdb.datastore.cassandra.cql_host_list.*$/kairosdb.datastore.cassandra.cql_host_list=$CASSANDRA_HOSTS/" /opt/kairosdb/conf/kairosdb.properties
/opt/kairosdb/bin/kairosdb.sh run