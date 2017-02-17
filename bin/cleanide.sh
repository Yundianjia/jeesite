# /**
#  * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
#  *
#  * Author: ThinkGem@163.com
#  */
echo '\n'
echo [信息] 清理Eclipse工程文件。
echo '\n'

cd ../ && mvn -Declipse.workspace=. eclipse:clean eclipse:eclipse

rm .classpath
rm .project
