yum update -y
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=http://yum.kubernetes.io/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
setenforce 0
yum install -y docker kubelet kubeadm kubectl kubernetes-cni
systemctl enable docker && systemctl start docker
systemctl enable kubelet && systemctl start kubelet
kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-advertise-address=18.218.191.166
kubectl taint nodes --all node-role.kubernetes.io/master-
#kubeadm join --token=e49bcc.2d4ba0c53d6d616f 172.31.27.54
kubectl apply -f https://git.io/weave-kube-1.6
kubectl apply -f http://docs.projectcalico.org/v2.3/getting-started/kubernetes/installation/hosted/kubeadm/1.6/calico.yaml
kubectl create -f https://rawgit.com/kubernetes/dashboard/master/src/deploy/kubernetes-dashboard.yaml
kubectl apply -f 'https://cloud.weave.works/launch/k8s/weavescope.yaml?service-token=<token>'
kubectl patch node k8s-node-1 -p '{"spec":{"unschedulable":true}}'
