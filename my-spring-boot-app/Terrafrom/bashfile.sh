# Update package index
sudo apt update

# Install prerequisites
sudo apt install ca-certificates curl apt-transport-https lsb-release gnupg -y

# Add Microsoft GPG key
curl -sL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-archive-keyring.gpg

# Add Azure CLI repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

# Update and install
sudo apt update
sudo apt install azure-cli -y

# Verify installation
az version
