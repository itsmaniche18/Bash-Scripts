mv app-reloaded-ear-1.0.0-SNAPSHOT.ear backup/ear/app-reloaded-ear-1.0.0-SNAPSHOT.ear-$(date +%Y-%m-%d)?
mv glassfish4/glassfish/domains/app/config/app-server-config.yml backup/yml/app-server-config.yml-$(date +%Y-%m-%d)
scp root@10.13.222.112:/home/app/app-reloaded-ear-1.0.0-SNAPSHOT.ear .
scp root@10.13.222.112:/home/app/glassfish4/glassfish/domains/app/config/app-server-config.yml .
mv app-server-config.yml glassfish4/glassfish/domains/app/config/
glassfish4/bin/asadmin undeploy --port 9048 app-reloaded-ear-1.0.0-SNAPSHOT
glassfish4/bin/asadmin restart-domain app
glassfish4/bin/asadmin deploy --port 9048 app-reloaded-ear-1.0.0-SNAPSHOT.ear
glassfish4/bin/asadmin restart-domain app











scp admin@10.10.10.10:/share/nfs/app/* .
glassfish4/bin/asadmin undeploy --port 9048 app-reloaded-ear-1.0.0-SNAPSHOT


glassfish4/bin/asadmin restart-domain app
