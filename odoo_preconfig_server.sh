SERVER_HOST_NAME="s06.beopen.cloud"
SERVER_TIMEZONE="Europe/Madrid"

# change server hostname
sudo hostnamectl set-hostname ${SERVER_HOST_NAME}
# change server timezone
timedatectl set-timezone ${SERVER_TIMEZONE}

# change auto update config
cat <<EOF > ~/server-config-upgrades
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "0";
EOF
sudo mv ~/server-config-upgrades /etc/apt/apt.conf.d/20auto-upgrades

# update and upgrade server SO
sudo apt-get update
sudo apt-get upgrade

echo -e "* Preconfig Odoo Server Done!"