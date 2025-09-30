#  git hub repo link to confiure gmail setup ook.
###  https://github.com/daws-86s/concepts/blob/main/sending-gmail.MD


Install msmtp

sudo dnf install msmtp -y
2 Factor authentication should be switched on, go to your google account and switch on. Then

Create your app-password in Google

https://myaccount.google.com/apppasswords
Create Global Config File

sudo vi /etc/msmtprc
defaults
auth           on
tls            on
tls_trust_file /etc/ssl/certs/ca-bundle.crt
logfile        /var/log/msmtp.log

account        gmail
host           smtp.gmail.com
port           587
from           your_email@gmail.com
user           your_email@gmail.com
password       your_app_password

account default : gmail
Set Secure, World-Readable Permissions

sudo chmod 644 /etc/msmtprc
Create Logfile

sudo touch /var/log/msmtp.log
sudo chmod 666 /var/log/msmtp.log
Test as Any User

{
echo "To: s.veerarajesh@gmail.com"
echo "Subject: Mail alert from JoinDevOps"
echo "Content-Type: text/html"
echo ""
echo "This is Text mail"
} | msmtp "s.veerarajesh@gmail.com"