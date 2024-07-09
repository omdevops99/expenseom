dnf module disable nodejs -y
dnf module enable nodejs:18 -y


dnf install nodejs -y

dnf install mysql -y 

mysql -h 172.31.30.179 -uroot -pExpenseApp@1 < /app/schema/backend.sql 

cp backend.service /etc/systemd/system/backend.service
useradd expense

mkdir /app 

curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip 
cd /app 
unzip /tmp/backend.zip

cd /app 
npm install 

systemctl deamon-reload
systemctl enable backend 
systemctl start backend

