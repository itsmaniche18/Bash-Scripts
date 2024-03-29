#!/bin/bash

# FOR JENKINS

# Update following values as required
GLASSFISH_PASSWORD_FILE_PATH=/home/pwd

ASADMIN_PATH="/home/glassfish4/glassfish/bin/asadmin"
ASADMIN_BASE_CMD="$ASADMIN_PATH --host 10.10.10.10 --port 9048 --user admin2 --passwordfile $GLASSFISH_PASSWORD_FILE_PATH"

DEPLOY_EAR_FILE_PATH="Dummy-project-ear/target"
DEPLOY_EAR_FILE_NAME="Dummy-project-ear-1.0-SNAPSHOT.ear"

UNDEPLOY_EAR_NAME="Dummy-project-ear-1.0-SNAPSHOT"

# Commands

$ASADMIN_BASE_CMD list-applications
$ASADMIN_BASE_CMD undeploy $UNDEPLOY_EAR_NAME
$ASADMIN_BASE_CMD deploy $DEPLOY_EAR_FILE_PATH/$DEPLOY_EAR_FILE_NAME
