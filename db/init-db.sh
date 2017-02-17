@echo off
# /**
# * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
# *
# * Author: ThinkGem@163.com
# */

echo [信息] 重建您的数据库并导入初始数据。
echo [信息] 此操作会清空您的数据表和数据，并恢复初始状态。
echo [信息] 确认继续吗？否则请关闭窗口。
echo [信息] 您真的确认继续吗？否则请关闭窗口。

cd .. && mvn antrun:run -Pinit-db

