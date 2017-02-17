# /**
#  * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
#  *
#  * Author: ThinkGem@163.com
#  */
echo '\n'
echo [信息] 运行 Jetty 服务器
echo '\n'

cd ..

set MAVEN_OPTS=%MAVEN_OPTS% -Xms256m -Xmx512m -XX:PermSize=128m -XX:MaxPermSize=256m

mvn jetty:run
