# Install Docker
* https://docs.docker.com/install/linux/docker-ce/ubuntu/
```
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce
```
# Install Kubernets
```
apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
systemctl daemon-reload
systemctl restart kubelet
```
# Create a local kubernetes cluster
```
kubeadm init

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Apply Network
sysctl net.bridge.bridge-nf-call-iptables=1
export kubever=$(kubectl version | base64 | tr -d '\n')
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"

# Isolate master
kubectl taint nodes --all node-role.kubernetes.io/master-
```

Not you should be able use `kubectl` to access your local cluster.

# Setup a local docker registry:
```
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

# Debug Cycle
```
./debug.sh
# This script builds new images from the latest code, pushes it to the local
# docker registry, and then tries to create a new pod of a single grading using :
# kube_specs/vizdoom2018_grading_pod.yaml
# This also copies over the modified version of VizDoom and setups up run script
# to install VizDoom from this version instead.
#
# and then check logs of the host or submission pod by :
# kubectl logs vizdoom2018-grading-pod-debug -c host -f
# or
# kubectl logs vizdoom2018-grading-pod-debug -c submission -f
```
