sudo apt-get update
sudo apt-get -y install lxde > /dev/null 2>&1
sudo apt-get install xrdp -y > /dev/null 2>&1
clear
sudo adduser desktop --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "desktop:Debian" | sudo chpasswd
sudo usermod -aG sudo,adm desktop
rm -rf ngrok  ngrok.zip  ng.sh > /dev/null 2>&1
wget -O ng.sh https://bit.ly/GCngr0k > /dev/null 2>&1
chmod +x ng.sh
./ng.sh
clear
echo "======================="
echo choose ngrok region
echo "======================="
echo "us - United States (Ohio)"
echo "eu - Europe (Frankfurt)"
echo "ap - Asia/Pacific (Singapore)"
echo "au - Australia (Sydney)"
echo "sa - South America (Sao Paulo)"
echo "jp - Japan (Tokyo)"
echo "in - India (Mumbai)"
read -p "choose ngrok region: " CRP
./ngrok tcp --region $CRP 3389 &>/dev/null &
echo "===================================="
echo "RDP Is bring started"
echo "===================================="
clear
echo "===================================="
echo "Start RDP"
echo "===================================="
echo "===================================="
echo "username : desktop"
echo "password : Debian"
echo "RDP Address:"
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
