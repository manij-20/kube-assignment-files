clear
sudo apt update
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter
sudo tee /etc/sysctl.d/kubernetes.conf <<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

sudo sysctl --system
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y containerd.io
containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml
sudo systemctl restart containerd
sudo systemctl enable containerd
sudo systemctl status containerd
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gpg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.33/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.33/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet=1.33.0-1.1 kubeadm=1.33.0-1.1 kubectl=1.33.0-1.1
sudo apt-mark hold kubelet kubeadm kubectl
sudo systemctl enable --now kubelet
vi kubeadm-config.yaml
sudo kubeadm init --config kubeadm-config.yaml
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/calico.yaml
kubectl get nodes
helm repo add aws-cloud-controller-manager https://kubernetes.github.io/cloud-provider-aws
snap install helm
snap install helm --classic
helm repo add aws-cloud-controller-manager https://kubernetes.github.io/cloud-provider-aws
helm repo update
vi aws-ccm-values.yaml
helm install aws-cloud-controller-manager aws-cloud-controller-manager/aws-cloud-controller-manager   --namespace kube-system   --create-namespace   --values aws-ccm-values.yaml
helm status aws-cloud-controller-manager -n kube-system
kubectl get pods -A
c2 -n kub
clear
kubectl get pods
kubectl get pods -A
kubectl get nodes
kubectl get pods -A
kubectl -n kube-system logs aws-cloud-controller-manager-x2bc2
kubectl pods
kubectl get pods
kubectl get pods -A
clear
kubectl get nodes
kubectl get pods -A
kubectl taint nodes --all node-role.kubernetes.io/control-plane-
kubectl get pods -A
kubectl describe pod -n kube-system coredns-674b8bbfcf-9q4bh
kubectl taint nodes ip-172-31-16-141 node.cloudprovider.kubernetes.io/uninitialized-
kubectl get pods -A
kubectl get nodes
helm status aws-cloud-controller-manager -n kube-system
kubeadm token list
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | awk '{print $2}'
clear
kubectl get nodes
kubectl get pods
kubectl get pods -A
kubeadm token list
kubectl get nodes
kubectl get pods -A
crictl ps
kubectl get nodes
clear
kubectl get pods
kubectl get pods -A
vi tomcat-app.yaml
kubectl apply -f tomcat-app.yaml 
kubectl get pods
vi tomcat-lb.yaml
kubectl apply -f tomcat-lb.yaml 
kubectl get svc
kubectl describe svc tomcat-web-app
curl 10.101.225.40:8080
kubectl get pods -owide
curl 10.244.176.129:8080
curl 10.101.225.40:8080
ls
cat tomcat-app.yaml
cat tomcat-lb.yaml
vi tomcat-app.yaml 
vi tomcat-lb.yaml 
kubectl apply -f tomcat-lb.yaml 
curl 10.101.225.40:8080
ˀ
vi external-name.yaml
kubectl -f external-name.yaml 
kubectl apply -f external-name.yaml 
kubectl get svc
curl google.com  
curl google-external.default.svc.local
kubectl get pods
kubectl exec -it tomcat -c tomcat /bin/bash
kubectl exec -it tomcat -c tomcat -- /bin/bash
ls
cat external-name.yaml 
curl https://google.com
kubectl get pods
kubectl delete pod tomcat
kubectl get pods
vi replica-set.yaml
kubectl apply -f replica-set.yaml 
kubectl get pods
kubectl get replicaset
kubectl get pods --show-label
kubectl get pods --show-labels
kubectl get pods
kubectl get nodes
vi replica-set.yaml 
kubectl apply -f replica-set.yaml 
kubectl get pods
kubectl delete pods --all
kubectl get pods
kubectl get replicaset
kubectl get pods --show-labels
kubectl delete pod jenkins-replica-set-w5rwj
kubectl get pods
kubectl scale rs jenkins-replica-set --replicas=2
kubectl get pods
kubectl get pods --show-labels
kubectl delete pods --all
clear
ls
vi tomcat-app.yaml 
mv tomcat-app.yaml jenkins.yaml
ls
kubectl apply -f jenkins.yaml 
cat jenkins.yaml 
vi jenkins-lb.yaml
kubectl apply -f jenkins-lb.yaml
vi external-name.yaml 
cat replica-set.yaml 
vi replica-set.yaml 
kubectl get pods
kubectl get nodes
kubectl get pods -A
kubectl get pods --show-labels
vi jenkins.yaml 
kubectl apply -f jenkins.yaml
vi jenkins.yaml 
vi replica-set.yaml 
vi jenkins.yaml 
kubectl apply -f jenkins.yaml
kubectl get pods --show-labels
kubectl get svc
kubectl get pods -owide
curl ip-172-31-5-192:8080
curl 10.244.176.136:8080
vi 
cat janekins.
cat jankins.
cat jenkins.yaml
vi jenkins-lb.yaml 
kubectl apply -f jenkins-lb.yaml
ls
vi jenkins-lb.yaml
vi jenkins.yaml 
vi replica-set.yaml 
kubectl jenkins.yaml
kubectl apply -f jenkins.yaml
kbectl apply -f jenkins-lb.yaml
kubectl apply -f jenkins-lb.yaml
kubectl get pods --show-labels
kubectl get pods -A
kubectl get pods -owide
curl 10.244.176.136:8085
curl 10.244.176.135:8085
kubectl get nodes
kubectl get pods
kubectl apply -f jenkins.yaml
kubectl get pods
kubectl get nodes
kubectl get pods -A
kubectl describe svc my-pod=my-jenkins
kubectl describe svc my-jenkins
kubectl delete pods --all
kubectl delete pods
kubectl get pods
ls
rm jenkins.yaml
rm jenkins-lb.yaml
ls
cat tomcat-lb.yaml 
kubectl describe svc tomcat-web-app
vi tomcat-pod.yaml
ls
tomcat tomcat-lb.yaml 
vi tomcat-lb.yaml 
kubectl apply -f tomcat-pod.yaml
kubectl apply -f tomcat-lb.yaml
kubectl describe svc tomcat-web-app
kubectl get pods -owide
kubectl delete pods --all
kubectl get pods -owide
curl 10.244.176.141:8080
vi tomcat-nodeport.yaml
kubectl apply -f tomcat-nodeport.yaml
kubectl get svc
kubectl get endpoints jenkins-nodeport
kubectl get pods --show-labels
kubectl get pods
kubectl delete pods --all
kubectl get pods --show-labels
kubectl get svc jenkins-nodeport -o yaml
kubectl edit svc jenkins-nodeport
kubectl get endpoints jenkins-nodeport
kubectl get svc
kubectl get pods -owide
curl 10.244.176.143:8080
curl 10.244.176.143:8085
kubectl get endpoints jenkins
kubectl get svc jenkins -o yaml | grep -A5 selector
kubectl edit svc jenkins
kubectl get endpoints jenkins
kubectl get svc jenkins -o wide
curl 172.31.16.141:31170
curl 3.110.109.109:31170
kubectl get pods -o wide
curl 172.31.5.192:31170
kubectl describe pod jenkins-replica-set-q8d4f | grep -i port -A5
kubectl edit deployment jenkins-replica-set
kubectl edit rs jenkins-replica-set
kubectl delete pod -l my-pod=my-jenkins
kubectl get pods -o wide
kubectl describe pod <new-pod-name> | grep -i port -A5
kubectl edit svc jenkins
kubectl get svc jenkins -o yaml 
kubectl edit svc jenkins
kubectl get svc jenkins -o yaml 
kubectl get endpoints jenkins
curl 172.31.5.192:31170
kubectl get nodes
kubectl get pods
clear
kubectl get nodes
kubectl get pods
kubectl create namespace mani-ns
kubectl get namespace
ls
vi tomcat-pod.yaml 
kubectl apply -f tomcat-pod.yaml 
kubectl get pods
kubectl rs delete --all
kubectl  delete rs --all
kubectl get pods
vi tomcat-pod.yaml 
kubectl apply -f tomcat-pod.yaml 
kubectl get pods
kubectl apply -f tomcat-pod.yaml 
kubectl get pods
kubectl get pods -n mani-ns
kubectl get pods
kubectl get pods -A
kubectl get namespace
ls
kubectl apply -f replica-set.yaml -n mani-ns
vi replica-set.yaml 
kubectl apply -f replica-set.yaml -n mani-ns
kubectl get pods
kubectl get pods -A
kubectl get pods -n mani-ns
kubectl delete rs --all
kubectl delete pods --all
kubectl delete pods --all -n mani-ns
kubectl delete rs --all -n mani-ns
kubectl get pods
clear
vi nginx.yaml 
kubectl apply -f nginx.yaml 
kubectl get pods
vi nginx.yaml 
kubectl apply -f nginx.yaml 
kubectl get pods
kubectl describe pods
kubectl get replicaset
kubectl descibe replicaset
kubectl describe replicaset
kubectl delete pods --all
kubectl get pods
kubectl describe pods
vi nginx-deployment.yaml
kubectl delete rs --all
kubectl apply -f nginx-deployment.yaml
kubectl get pods
kubectl get replicaset
kubectl get deployment
vi nginx-deployment.yaml
kubectl apply -f nginx-deployment.yaml
clear
kubectl get pods -w
clear
kubeadm token list
kubeadm token create --print-join-command
kubectl get nodes
kubectl describe node ip-172-31-2-219 
kubectl taint node ip-172-31-2-219 colour=blue:NoSchedule
kubectl get pods
kubectl get pods -owide
kubectl delete pods --all 
kubectl get pods
kubectl get pods -owide
ls
vi nginx.yaml 
vi nginx-deployment.yaml
vi daemonset.yaml
kubectl apply -f daemonset.yaml 
kubectl get pods
kubectl get pods -owide
ls
kubectl delete deployment nginx-deployment
kubectl get pods
kubectl get pods -owide
kubectl describe node <master-node-name> | grep Taints
kubectl taint nodes <master-node-name> node-role.kubernetes.io/control-plane=:NoSchedule
kubectl taint nodes ip-172-31-16-141 node-role.kubernetes.io/control-plane=:NoSchedule
kubectl describe node ip-172-31-16-141 | grep Taints
kubectl delete pods --all
kubectl apply -f daemonset.yaml 
kubectl get pods
kubectl get pods -owide
kubectl label node ip-172-31-2-219 env=dev
kubectl get nodes --show-lables
kubectl get nodes --show-labels
kubectl describe node ip-172-31-2-219 
kubectl get pods
kubectl delete daemonset jenkins-daemonset
kubectl get pods
ls
vi nginx-deployment.yaml 
kubectl apply -f nginx-deployment.yaml 
kubectl get pods
kubectl get pods -owide
vi nginx-deployment.yaml 
kubectl label node ip-172-31-5-192 env=prod
kubectl delete pods --all
kubectl get pods -owide
kubectl label node ip-172-31-5-192 env=dev
kubectl label node ip-172-31-5-192 env=dev --overwrite
kubectl delete pods --all
kubectl get pods -owide
kubectl label node ip-172-31-5-192 env=prod --overwrite
vi nginx-deployment.yaml 
kubectl apply -f nginx-deployment.yaml
kubectl get pods -owide
vi nginx-deployment.yaml 
kubectl apply -f nginx-deployment.yaml
kubectl get pods -owide
vi nginx-deployment.yaml 
kubectl apply -f nginx-deployment.yaml
kubectl get pods -owide
vi nginx-deployment.yaml 
kubectl apply -f nginx-deployment.yaml
vi nginx-deployment.yaml 
kubectl apply -f nginx-deployment.yaml
kubectl get pods -owide
vi nginx-deployment.yaml 
kubectl apply -f nginx-deployment.yaml
kubectl get pods -owide
vi nginx-deployment.yaml 
kubectl apply -f nginx-deployment.yaml
vi nginx-deployment.yaml 
kubectl apply -f nginx-deployment.yaml
kubectl get pods -owide
vi nginx-deployment.yaml 
ls
cat replica-set.yaml 
ls
cat replica-set.yaml 
clear
ls
vi nginx-hostPath-vol.yaml
kubectl apply -f nginx-hostPath-vol.yaml
kubectl get pods
kubectl get pods -owide
kubectl exec -it hostpath-nginx -- /bin/bash
kubectl exec -it hostpath-nginx 
kubectl get pods -owide
kubectl exec -it hostpath-nginx -- sh
kubectl delete deployment nginx-deployment
kubectl get pods -owide
kubectl exec -it hostpath-nginx -- sh
