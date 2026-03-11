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
kubectl get pods -owide
kubectl exec -it hostpath-nginx -- sh
vi pv.yaml
kubectl apply -f pv.yaml 
vi pvc.yaml
vi nginx-pvc.yaml
kubectl apply -f pvc.yaml 
kubectl get pv -owide
kubectl get pvc -owide
kubectl get pods
kubectl delete pods hostpath-nginx
kubectl apply -f nginx-pvc.yaml
kubectl get pods
kubectl get pv -owide
kubectl get pvc 
kubectl get pods -owide
kubectl exec -it my-app -- sh
kubectl get pods -A
helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver
helm repo update
helm install aws-ebs-csi-driver aws-ebs-csi-driver/aws-ebs-csi-driver   -n kube-system   --create-namespace
kubectl get pods -A
vi ebs-sc.yaml
kubectl ebs-sc.yaml 
kubectl apply -f ebs-sc.yaml 
kubectl get sc
vi ebs-pvc.yaml
kubectl apply -f ebs-pvc.yaml 
kubectl get pvc
vi nginx-ebs.yaml
kubectl apply -f nginx-ebs.yaml
kubectl get pvc
kubectl get pods
kubectl delete pods my-app 
kubectl get pods
kubectl describe pod ebs-test-pod
kubectl get pods
kubectl get pods -n kube-system | grep ebs
kubectl logs -n kube-system ebs-csi-controller-7b99666bc9-rqcqz -c ebs-plugin
kubectl get pods
kubectl delete pod -n kube-system -l app.kubernetes.io/name=aws-ebs-csi-driver
kubectl get pods -n kube-system | grep ebs
kubectl delete pod -n kube-system -l app.kubernetes.io/name=aws-ebs-csi-driver
kubectl get pods -n kube-system | grep ebs
kubectl get pods
kubectl get pvc
kubectl get pv
kubectl delete pvc ebs-test-pvc
kubectl get pvc
kubectl delete -f ebs-test-pvc 
kubectl get pvc
kubectl get pods
kubectl delete pods ebs-test-pod 
kubectl get pvc
helm repo add aws-efs-csi-driver https://kubernetes-sigs.github.io/aws-efs-csi-driver
helm repo update
helm install aws-efs-csi-driver aws-efs-csi-driver/aws-efs-csi-driver   -n kube-system   --create-namespace
kubectl get pods -n kube-system | grep efs
vi efs-sc.yaml
kubectl apply -f efs-sc.yaml 
vi efs-pvc.yaml
kubectl apply -f efs-pvc.yaml 
kubectl get pvc
vi nginx-efs.yaml
kubectl apply -f nginx-efs.yaml
kubectl get pods
kubectl get pods -n kube-system | grep efs
kubectl describe pvc efs-test-pvc
kubectl describe sc efs-sc
kubectl get sc
kubectl delete sc efs-sc
vi efs-sc.yaml
kubectl apply -f efs-sc.yaml
kubectl delete pvc efs-test-pvc
kubectl get pvc
vi efs-pvc.yaml 
kubectl apply -f efs-pvc.yaml 
kubectl get pvc
kubectl get pods
kubectl get pods -owide
kubectl describe pod efs-test-pod
kubectl get pods -owide
kubectl delete pods efs-test-pod 
kubectl apply -f efs-test-pod 
kubectl apply -f nginx-efs.yaml 
kubectl get pods -owide
kubectl exec -it efs-test-pod -- sh
ls
git init
git add .
git status
git commit -m "Assignment files"
git remote add origin https://github.com/manij-20/Kuberenetes-yml-files/assignment-docs.git
git branch -M main

git remote add origin https://github.com/manij-20/Kuberenetes-yml-files/.git
git push -u origin main
git remote add origin https://github.com/manij-20/Kuberenetes-yml-files.git
git push -v
git remote -v
git branch -M main
git push -u origin main
git remote set-url origin https://github.com/manij-20/Kuberenetes-yml-files.git
git branch -M main
git push -u origin main
git pull origin main --allow-unrelated-histories
git push -u origin main
clear
kubectl get nodes
kubectl get svc
df -h
kubectl get pods
kubectl delete pods efs-test-pod 
df -h
sudo du -h --max-depth=1 / | sort -hr
sudo du -h --max-depth=1 /var | sort -hr
sudo du -h --max-depth=1 /var/lib | sort -hr
crictl images
crictl rmi --prune
crictl images
df -h
dh -h
df -h
lsblk
sudo growpart /dev/nvme0n1 1
sudo resize2fs /dev/nvme0n1p1
df -h
kubectl get pods
clear
kubectl get pv
kubectl get pvv
kubectl get pvc
kubectl delete pv pvc-9b2b5062-9abf-42ff-a14a-816b89cd8758 
kubectl delete pvc efs-test-pvc  
kubectl get sc
kubectl delete efs-sc 
kubectl delete sc efs-sc 
ls
clear
kubectl get pods -A
ls
vi efs-sc.yaml 
kubectl apply -f efs-sc.yaml
kubectl get sc
vi jenkins-pvc.yaml
kubectl apply -f jenkins-pvc.yaml
kubectl get pvc
kubectl get pv
vi jenkins-deploy.yaml
kubectl apply -f jenkins-deploy.yaml
kubectl get pods -owide
kubectl describe pod jenkins-556ff5f587-5f8lx
kubectl delete pod --field-selector=status.phase=Failed
kubectl get pods -owide
kubectl describe pod jenkins-556ff5f587-d975w 
sudo systemctl restart kubelet
kubectl get nodes
kubectl describe node <node-name> | grep -i pressure
kubectl describe node ip-172-31-2-219 
kubectl describe node ip-172-31-5-192
sudo systemctl restart kubelet
kubectl get nodes
kubectl describe node ip-172-31-5-192
sudo systemctl restart kubelet
kubectl describe node ip-172-31-2-219 
kubectl describe node ip-172-31-5-192
kubectl get pods -owide
sudo systemctl restart containerd
sudo systemctl restart kubelet
kubectl describe node ip-172-31-5-192
kubectl get pods -owide
kubectl delete pods jenkins-556ff5f587-d975w
kubectl get pods -owide
kubectl get svc
vi configmap.yaml
vi nginx-config.yaml
kubectl apply -f configmap.yaml
kubectl get pods
kubectl delete deployment jenkins
kubectl get pods
kubectl apply -f nginx-config.yaml
kubectl get pods
kubectl exec -it configmap-env-pod /bin/bash
kubectl exec -it configmap-env-pod -- /bin/bash
config.properties: |     timeout=30
vi config.properties
kubectl create configmap app-config --from-file=config.properties
kubectl delete configmap app-config
kubectl create configmap app-config --from-file=config.properties
kubectl get configmap app-config -o yaml
kubectl get configmap app-config -o json
ls
vi nginx-deploy-conf.yaml
kubectl apply -f nginx-deploy-conf.yaml
kubectl get pods
kubectl exec -it myapp-6c9748676c-6hnl8 -- /bin/bash
kubectl exec -it myapp-6c9748676c-j2k2z -- /bin/bash
clear
vi tomcat-users.xml
vi server.xml
kubectl create configmap tomcat-config --from-file=tomcat-users.xml --from-file=server.xml
kubectl get configmap tomcat-config -o yaml
kubectl get configmap tomcat-config -o json
vi tomcat-deployment-conf.yaml
kubectl apply -f tomcat-deployment.yaml
kubectl apply -f tomcat-deployment-conf.yaml
kubectl get pods
kubectl exec -it tomcat-deployment-88fbcf54-hxpk7 -- /bin/bash
kubectl get nodes
vi statefulset.yaml
kubectl apply -f statefulset.yaml 
kubectl get pods
kubectl get pvc
kubectl delete pod web-2 
kubectl get pods
ls
vi limitrange.yaml
vi Resourcequota.yaml
kubectl apply -f Resourcequota.yaml 
kubectl get resourcequota 
kubectl get pods
kubectl delete stateful web
kubectl delete statefulset web
kubectl get pods
kubectl apply -f statefulset.yaml 
kubectl get pods
kubectl apply -f statefulset.yaml 
kubectl get pods
kubectl delete pods myapp
kubectl delete pods myapp-6c9748676c-6hnl8
kubectl delete pods myapp-6c9748676c-j2k2z
kubectl get pods
kubectl delete deployment --all
kubectl get pods
kubectl apply -f statefulset.yaml 
kubectl get pods
vi statefulset.yaml 
kubectl apply -f statefulset.yaml 
kubectl get pods
kub
kubectl delete resourcequota pod-quota
vi Limitrange.yaml
kubectl apply -f Limitrange.yaml 
kubectl get limitrange
kubectl get pods
kubectl describe pod web-0
vi statefulset.yaml 
kubectl delete statefulset web
kubectl apply -f statefulset.yaml 
kubectl get pods
kubectl describe pod web-0
vi Limitrange.yaml 
vi statefulset.yaml 
vi Limitrange.yaml 
kubectl get pods
vi Limitrange.yaml
kubectl get limitrange
kubectl get pods
vi nginx-limit.yaml
kubectl apply -f nginx-limit.yaml
kubectl get pods
kubectl describe pod nginx
vi limit-gur.yaml
kubectl apply -f limit-gur.yaml
kubectl get pods
kubectl describe pod nginx-guaranteed
vi limit-gur.yaml
kubectl apply -f limit-gur.yaml
kubectl delete pod nginx-guaranteed
kubectl apply -f limit-gur.yaml
kubectl describe pod nginx-guaranteed
kubectl describe pod configmap-env-pod
kubectl describe limitrange cpu-resource-constraint
clear
ls
pwd
mkdir kube-files
ls
cd kube-files
ls
cd ..
cp *.yaml /root /root/kube-files
cp -r *.yaml /root /root/kube-files
cp *.yaml /root/kube-files/
cd kube-files/
ls
git init
git remote add origin https://github.com/manij-20/Kuberenetes-yml-files.git
git add *.yaml
git commit -m "Added Kubernetes YAML files"
git branch -M main
git push -u origin main
git init
git remote add origin https://github.com/manij-20/kube-assignment-files.git
git init
git remote remove origin
git init
git remote -v
git remote add origin https://github.com/manij-20/kube-assignment-files.git
git remote -v
git add .
git commit -m "Added Kubernetes assignment YAML files"
git pull origin main --allow-unrelated-histories
git push -u origin main
clear
kubectl get nodes
df -h
https://nodejs.org
node --version
docker --version
kubectl version --client
minikube version
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt install -y nodejs
node --version
docker --version
apt install -y docker.io
systemctl start docker
systemctl enable docker
docker --version
mkdir two-tier-app
cd two-tier-app
mkdir frontend backend k8s
ls
cd backend
vi server.js
npm init -y
npm install express mysql
vi Dockerfile
docker build -t yourdockerhub/backend-app .
sudo apt update
sudo apt install docker.io -y
sudo apt remove containerd containerd.io docker docker-engine docker.io -y
sudo apt autoremove -y
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version
docker build -t yourdockerhub/backend-app .
cd ../frontend
vi index.html
vi style.css
vi app.js
vi Dockerfile
docker build -t yourdockerhub/frontend-app .
docker login
docker login -u mani2009
docker push yourdockerhub/frontend-app
docker push yourdockerhub/backend-app
docker tag yourdockerhub/frontend-app mani2009/frontend-app
docker tag yourdockerhub/backend-app mani2009/backend-app
docker push mani2009/frontend-app
docker push mani2009/backend-app
cd ../k8s
vi mysql-deploy.yaml
vi mysql-service.yaml
vi backend-deploy.yaml
vi backend-service.yaml
vi frontend-deploy.yaml
vi mysql-deploy.yaml
vi backend-deploy.yaml
vi frontend-deploy.yaml
vi frontend-service.yaml
kubectl apply -f .
kubectl get pods
kubectl get svc
kubectl describe pod mysql-7959f8868f-8qjk6
kubectl get pods
kubectl delete stateful web 
kubectl delete statefulset web 
kubectl get pods
kubectl get svc
kubectl exec -it backend-798c6484b-ftk5h -- curl backend:3000
kubectl edit svc backend
kubectl get svc backend
cd ../frontend/
ls
vi app.js
docker build -t mani2009/frontend-app .
docker push mani2009/frontend-app
kubectl rollout restart deployment frontend
vi app.js
v
docker build -t mani2009/frontend-app .
docker push mani2009/frontend-app
kubectl rollout restart deployment frontend
kubectl get pods
cd ~/two-tier-app/backend
vi server.js
docker build -t mani2009/backend-app .
docker push mani2009/backend-app
kubectl rollout restart deployment backend
kubectl get pods
kubectl exec -it mysql-7959f8868f-8qjk6 -- bash
cd ../k8s
vi mysql-deploy.yaml 
kubectl apply -f mysql-deployment.yaml
kubectl apply -f mysql-deploy.yaml
kubectl delete pod -l app=mysql
kubectl get pods
kubectl exec -it <mysql-pod-name> -- bash
cd ../backend/
kubectl exec -it <mysql-pod-name> -- bash
kubectl exec -it mysql-5f5f944b77-nzsc4 -- bash
npm install mysql
vi server.js
kubectl rollout restart deployment backend
curl http://<backend-nodeport>/users
curl http://3.110.198.236:32503/users
cat server.js
vi server.js
docker build -t two-tier-backend .
kubectl get pods
kubectl logs -l app=backend
kubectl exec -it $(kubectl get pod -l app=backend -o jsonpath="{.items[0].metadata.name}") -- sh
vi server.js
docker build -t two-tier-backend .
kubectl rollout restart deployment backend
kubectl get pods
kubectl exec -it backend-6754c46898-66cjp -- cat server.js
vi server.js
docker build -t two-tier-backend .
ls
kubectl edit deployment backend
cd ../k8s
ls
cat backend-deploy.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
spec:
vi backend-deploy.yaml
kubectl apply -f backend-deploy.yaml
kubectl rollout restart deployment backend
kubectl get pods
kubectl exec -it backend-845888ff55-86t26 -- cat server.js
kubectl exec -it backend-7b86fcd9c-htm5l -- cat server.js
cat server.js
cd ~/two-tier-app/backend
cat server.js
docker build -t mani2009/backend-app:latest .
docker push mani2009/backend-app:latest
kubectl rollout restart deployment backend
kubectl get pods
cd ..
ls
clear
cd two-tier-app/
ls
cd backend/
ls
cat Dockerfile 
cd node_modules/
ls
cat package.json
cat serve-static/
cat server.js
cd ..
cat server.js
cd ../frontend/
ls
vi index.html 
vi Dockerfile
vi app.js 
vi style.css
cd ../k8s/
ls
vi mysql-deploy.yaml
cat mysql-service.yaml
cat backend-deploy.yaml
cay backend-service.yaml 
cat backend-service.yaml 
cat frontend-deploy.yaml 
cat frontend-service.yaml 
kubectl get svc
cd
ls
vi jenkins-deploy.yaml
cat jenkins-deploy.yaml
kubectl apply -f jenkins-deploy.yaml 
vi jenkins-service.yaml
kubectl apply -f jenkins-service.yaml 
kubectl get svc
kubectl delete svc jenkins-nodeport
kubectl delete svc jenkins
kubectl get svc
cat jenkins-deploy.yaml 
cat jenkins-service.yaml 
kubectl get pods
kubectl exac -it jenkins-556ff5f587-6sk6x -- bash
kubectl exec -it jenkins-556ff5f587-6sk6x -- bash
kubectl exec -it jenkins-556ff5f587-6sk6x -- cat /var/jenkins_home/secrets/initialAdminPassword
ll
ls -a
history
ll
kubectl get nodes
kubectl get nodes -owide
kubectl get pods
kubectl get pods -A
kubctl get pods- A
kubectl grt pods -A -owide
kubectl get pods -A -owide
crictl --help
crictl ps
sysstemctl status kublet
sysstemctl status kubelet
systemctl status kubelet
kubectl get pods -n kube -system
ll
kubectl get pods
kubectl get pods -n kube-system
kubectl get -n
kubectl get -ns
kubectl get namespace
ll
cd kube-files/
ll
cat tomcat-pod.yaml 
cd ..
ll
mkdir march2026
ll
ls -l
df -h
ls -l
cd march2026/
ll
vi jenkins.pod.yml
ll
kubectl get pods
kubectl apply -f jenkins.pod.yml 
kubectl get pods
kubcetl get pods -A
kubectl get pods
kubectl get pods -owide
kubectl get pods
ll
route -n
apt install net-tools
route -n
kubectl get pods -owide
clear
k get pods
kubectl get pods
kubectl get nodes
kubectl get pods
kubectl get svc backend
kubectl get endpoints backend
kubectl logs backend-7f6c976cc4-85rzk
curl localhost:32503/users
curl 15.207.119.145:32503/users
curl localhost:32503
curl 15.207.119.145:32503
curl 172.31.16.141:32503
kubectl get pods -n kube-system | grep kube-proxy
kubectl delete pod -n kube-system -l k8s-app=kube-proxy
kubectl get pods -n kube-system | grep kube-proxy
curl 15.207.119.145:32503
sudo iptables -L -n | grep 32503
kubectl get nodes -o wide
clear
df -h
kubectl get pods
kubectl delete deployment backend frontend
lubectl delete deployment mysql-5f5f944b77-nzsc4
kubectl delete deployment mysql-5f5f944b77-nzsc4
kubectl get pods
kubectl get all
kubectl delete deployment mysql
kubectl get pods
df -h
kubectl get svc
kubectl delete svc frontend backend mysql google-external
kubectl get svc
mkdir wordpress-k8s
ls
cd wordpress-k8s/
vi mysql-secret.yaml
kubectl apply -f mysql-secret.yaml
vi mysql-pv.yaml
kubectl apply -f mysql-pv.yaml
vi mysql-deployment.yaml
kubectl apply -f mysql-deployment.yaml
mysql-service.yaml
vi mysql-service.yaml
kubectl apply -f mysql-service.yaml
vi wordpress-deployment.yaml
kubectl apply -f wordpress-deployment.yaml
vi wordpress-service.yaml
kubectl apply -f wordpress-service.yaml
kubectl get pods
kubectl describe pod wordpress-mysql-86f575b76b-fzhpm
kubectl get pvc
kubectl get storageclass
vi mysql-pv.yaml
kubectl delete pvc mysql-pvc
kubectl apply -f mysql-pvc.yaml
kubectl apply -f mysql-pv.yaml
mv mysql-pv.yaml mysql-pvc.yaml
kubectl apply -f mysql-pvc.yaml
kuvecrtl get svc
kubectl get pvc
kubectl get pods
kubectl logs wordpress-mysql-86f575b76b-fzhpm
kubectl delete deployment wordpress-mysql
kubectl delete pvc mysql-pvc
kubectl apply -f mysql-pvc.yaml
kubectl apply -f mysql-deployment.yaml
kubectl apply -f mysql-service.yaml
kubectl get pods
kubectl describe pod wordpress-mysql-86f575b76b-84c5r
kubectl delete deployment wordpress-mysql
kubectl delete pvc mysql-pvc
kubectl get pvc
kubectl get pv
kubectl apply -f mysql-pvc.yaml
kubectl get pv
kubectl get pvc
kubectl get pods -o wide
kubectl describe pvc mysql-pvc
kubectl get deploy
kubectl get pvc
kubectl apply -f mysql-deployment.yaml
kubectl get pods
vi mysql-deployment.yaml
kubectl apply -f mysql-deployment.yaml
kubectl get pods
kubectl get pvc
kubectl get svc
kubectl get pods
kubectl get pods -owide
kubectl get svc
kubectl describe pod wordpress-58bcb7c8dd-7vdj5
kubectl logs wordpress-mysql-7b4c7dbc44-xprr4
kubectl edit deployment wordpress
kubectl get pods
kubectl rollout restart deployment wordpress
kubectl get pods
cat wordpress-mysq.yaml
cat wordpress-mysql.yaml
ls
kubectl edit deployment wordpress-mysql
kubectl delete pod -l app=wordpress-mysql
kubectl get pod
jkubectl delete pod wordpress-mysql-7b4c7dbc44-xprr4 
kubectl delete pod wordpress-mysql-7b4c7dbc44-xprr4 
kubectl get pvc
kubectl delete pvc mysql-pvc
kubectl get pvc
kubectl get pods
kubectl get pods -w
kubectl describe pod wordpress-mysql-7b4c7dbc44-mt26q
kubectl logs wordpress-mysql-7b4c7dbc44-mt26q
ls
vi mysql-deployment.yaml
cat mysql-deployment.yaml
cat wordpress-deployment.yaml
vi mysql-deployment.yaml
vi wordpress-deployment.yaml
kubectl delete deployment wordpress wordpress-mysql
kubectl delete pvc mysql-pvc
kubectl apply -f mysql-deployment.yaml
kubectl apply -f wordpress-deployment.yaml
kubectl get pods -w
kubectl get pods
kubectl describe pod wordpress-mysql-74c8757fdd-s7xpx
kubectl get pvc
ls
cat mysql-pvc.yaml
vi mysql-pvc.yaml
kubectl apply -f mysql-pvc.yaml
kubectl get pods
kubectl get pods -w
kubectl get pods
kubectl get pvc
kubectl get services
kubectl logs wordpress-67c66d84cd-fwnmh
kubectl logs wordpress-mysql-74c8757fdd-s7xpx
cat mysql-service.yaml
vi mysql-service.yaml
kubectl apply -f mysql-service.yaml
kubectl get endpoints wordpress-mysql
kubectl exec -it wordpress-mysql-74c8757fdd-s7xpx --   mysql -u wordpress -p$(kubectl get secret mysql-pass -o jsonpath='{.data.password}' | base64 --decode)   -e "SHOW DATABASES;"
kubectl exec -it wordpress-mysql-74c8757fdd-s7xpx --   mysql -u wordpress -p$(kubectl get secret mysql-pass -o jsonpath='{.data.password}' | base64 --decode)   -e "USE wordpress; SHOW TABLES;"
kubectl get pods -n ingress-nginx
kubectl get ingressclass
cd ..
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/aws/deploy.yaml
kubectl get pods -n ingress-nginx -w
kubectl get svc -n ingress-nginx
kubectl get pods -owide
kubectl delete deployment jenkins
kubectl get pods -owide
kubectl get services
vi ingress.yaml
kubectl apply -f ingress.yaml
kubectl get ingress
kubectl describe ingress wordpress-jenkins-ingress
sudo nano /etc/hosts
nslookup
nslookup a33a611b083a844ab8894f732eb40ff2-36a1a771e4ae7cc3.elb.ap-south-1.amazonaws.com
sudo nano /etc/hosts
cat /etc/hosts
kubectl get ingress
kubectl describe ingress wordpress-jenkins-ingress
vi ingress.yaml 
kubectl apply -f ingress.yaml
kubectl get ingress
kubectl get deployments
kubectl describe svc jenkins-service
kubectl get pods | grep jenkins
kubectl describe pod jenkins | grep -i image
ls
vi jenkins-deployment.yaml
kubectl apply -f jenkins-deployment.yaml
kubectl get pods -w
kubectl get endpoints jenkins-service
vi ingress.yaml 
kubectl get ingress 
kubectl logs -n ingress-nginx deployment/ingress-nginx-controller | tail -20
kubectl describe ingress wordpress-jenkins-ingress
cat <<EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: wordpress-jenkins-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /$2
    nginx.ingress.kubernetes.io/use-regex: "true"
spec:
  ingressClassName: nginx
  rules:
  - http:
      paths:
      - path: /wordpress(/|$)(.*)
        pathType: ImplementationSpecific
        backend:
          service:
            name: wordpress-service
            port:
              number: 80
      - path: /jenkins(/|$)(.*)
        pathType: ImplementationSpecific
        backend:
          service:
            name: jenkins-service
            port:
              number: 8080
EOF

curl -v http://a33a611b083a844ab8894f732eb40ff2-36a1a771e4ae7cc3.elb.ap-south-1.amazonaws.com/wordpress
kubectl get svc -n ingress-nginx ingress-nginx-controller
v
curl -v http://localhost:32585/wordpress
curl -v http://172.31.16.141:32585/wordpress
# Verify from server
curl -v http://a33a611b083a844ab8894f732eb40ff2-36a1a771e4ae7cc3.elb.ap-south-1.amazonaws.com/wordpress
kubectl exec -it wordpress-mysql-74c8757fdd-s7xpx --   mysql -u wordpress -p$(kubectl get secret mysql-pass -o jsonpath='{.data.password}' | base64 --decode)   wordpress -e "
UPDATE wp_options SET option_value='http://a33a611b083a844ab8894f732eb40ff2-36a1a771e4ae7cc3.elb.ap-south-1.amazonaws.com' WHERE option_name='siteurl';
UPDATE wp_options SET option_value='http://a33a611b083a844ab8894f732eb40ff2-36a1a771e4ae7cc3.elb.ap-south-1.amazonaws.com' WHERE option_name='home';"
kubectl exec -it wordpress-mysql-74c8757fdd-s7xpx --   mysql -u wordpress -p$(kubectl get secret mysql-pass -o jsonpath='{.data.password}' | base64 --decode)   wordpress -e "SELECT option_name, option_value FROM wp_options WHERE option_name IN ('siteurl','home');"
curl -v http://a33a611b083a844ab8894f732eb40ff2-36a1a771e4ae7cc3.elb.ap-south-1.amazonaws.com/wordpress 2>&1 | grep Location
clear
curl -v http://a33a611b083a844ab8894f732eb40ff2-36a1a771e4ae7cc3.elb.ap-south-1.amazonaws.com/wordpress
```





exit

clear
kubectl set env deployment/jenkins JENKINS_OPTS="--prefix=/jenkins"
kubectl get pods -w
kubectl get pods | grep jenkins
kubectl set env deployment/jenkins JENKINS_OPTS="--prefix=/jenkins"
kubectl rollout status deployment/jenkins
kubectl exec -it <jenkins-pod-name> -- env | grep JENKINS
kubectl get pods
kubectl exec -it jenkins-596b646cd8-whf7z -- env | grep JENKINS
cat <<EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: wordpress-jenkins-ingress
  annotations:
    nginx.ingress.kubernetes.io/use-regex: "true"
    nginx.ingress.kubernetes.io/proxy-redirect-from: "http://a33a611b083a844ab8894f732eb40ff2-36a1a771e4ae7cc3.elb.ap-south-1.amazonaws.com/"
    nginx.ingress.kubernetes.io/proxy-redirect-to: "http://a33a611b083a844ab8894f732eb40ff2-36a1a771e4ae7cc3.elb.ap-south-1.amazonaws.com/jenkins/"
spec:
  ingressClassName: nginx
  rules:
  - http:
      paths:
      - path: /wordpress(/|$)(.*)
        pathType: ImplementationSpecific
        backend:
          service:
            name: wordpress-service
            port:
              number: 80
      - path: /jenkins(/|$)(.*)
        pathType: ImplementationSpecific
        backend:
          service:
            name: jenkins-service
            port:
              number: 8080
EOF

curl -v http://localhost:32585/jenkins
kubectl get pods
kubectl get pods -owide
kubectl get svc
kubectl get pvc
kubectl get ingress
ls
ls -lert
ls -lrt
