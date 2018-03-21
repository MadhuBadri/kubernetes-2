#!/bin/bash

[[ "TRACE" ]] && set -x

: ${INSTALL_PATH:=$MOUNT_PATH/kubernetes/install_scripts}
#NODE_IP=$2
source $INSTALL_PATH/../config
#HOSTNAME=$1

while [[ $# -gt 0 ]]
do
key="$1"
case $key in
 -i|--ip)
 NODE_IP="$2"
 shift
 shift
 ;;
 -h|--host)
 HOSTNAME="$2"
 shift
 shift
 ;;
esac
done

if [ -z "$NODE_IP" ]
then
	echo "Please provide node ip"
	exit 0
fi
if [ -z "$HOSTNAME" ]
then
        echo "Please provide node hostname"
        exit 0
fi



: ${COUNTRY:=IN}
: ${STATE:=UP}
: ${LOCALITY:=GN}
: ${ORGANIZATION:=CloudInc}
: ${ORGU:=IT}
: ${EMAIL:=cloudinc.gmail.com}
: ${COMMONNAME:=kube-system}

mkdir -p $CERTIFICATE/certs
pushd $CERTIFICATE/certs


cat <<EOF | sudo tee node-openssl.cnf
[req]
req_extensions = v3_req
distinguished_name = req_distinguished_name
[req_distinguished_name]
[ v3_req ]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName = @alt_names
[alt_names]
IP.1 = $NODE_IP
EOF

#Create a private key
openssl genrsa -out node.key 2048

#Create CSR for the node
openssl req -new -key node.key -subj "/CN=$NODE_IP" -out node.csr -config node-openssl.cnf

#Create a self signed certificate
openssl x509 -req -in node.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out node.crt -days 10000 -extensions v3_req -extfile node-openssl.cnf

#Verify a Private Key Matches a Certificate
openssl x509 -noout -text -in node.crt

cat <<EOF | sudo tee kubeconfig
apiVersion: v1
kind: Config
clusters:
- name: local
  cluster:
    certificate-authority: $CERTIFICATE/certs/ca.crt
users:
- name: kube-node
  user:
    client-certificate: $CERTIFICATE/certs/node.crt
    client-key: $CERTIFICATE/certs/node.key
contexts:
- context:
    cluster: local
    user: kube-node
  name: kubelet-context
current-context: kubelet-context
EOF

popd
