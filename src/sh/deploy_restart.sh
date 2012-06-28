#!/bin/bash
echo "cp to webapps/Hello/WEB-INF/classes/"
cp -r /Users/fujisaki/Documents/workspace/mjqueue/bin/* /opt/apache-tomcat-6.0.29/webapps/mjqueue/WEB-INF/classes/
echo "shutdown tomcat..."
/opt/apache-tomcat-6.0.29/bin/shutdown.sh
sleep 2
echo "startup tomcat..."
/opt/apache-tomcat-6.0.29/bin/startup.sh
