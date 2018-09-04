#! /bin/bash
echo "Installing Nomad on server\n"
wget https://releases.hashicorp.com/nomad/0.8.4/nomad_0.8.4_linux_amd64.zip
unzip nomad_0.8.4_linux_amd64.zip
cp nomad /usr/bin/
if [ $1 == "server" ]; then
	nomad agent -config server.hcl &
  sleep 5
  nomad agent -config client1.hcl &
else
	nomad agent -config client2.hcl &
fi
echo "Installation of Nomad complete\n"
exit 0
