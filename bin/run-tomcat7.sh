# /**
#  * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
#  *
#  * Author: ThinkGem@163.com
#  */

echo '\n'
echo [信息] 运行 Tomcat7 应用服务器
echo '\n'

set MAVEN_OPTS=%MAVEN_OPTS% -Xms256m -Xmx512m -XX:PermSize=128m -XX:MaxPermSize=256m

cd .. && mvn tomcat7:run
