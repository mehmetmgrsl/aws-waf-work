#!/bin/bash
apt update
apt install -y apache2

# Install the AWS CLI
apt install -y awscli

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>My Portfolio</title>
</head>
<body>
  <h1>Terraform Project Server 2</h1>
  <p>Welcome to Server 2</p>
  
</body>
</html>
EOF

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2