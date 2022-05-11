#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp -i ~/.ssh/подставляем_созданный_ключ_ssh \
    target/sweater-0.0.1-SNAPSHOT.jar \
    dru@192.168.0.107:/home/dru/

echo 'Restart sever...'

          ключ                               сервер на который всё устанавливаем
ssh -i ~/.ssh/подставляем_созданный_ключ_ssh dru@192.168.0.107 <<EOF

pgrep java |  | xargs kill -9
nohup java -jar sweater-0.0.1-SNAPSHOT.jar > log.txt &

EOF

echo 'Bye'
