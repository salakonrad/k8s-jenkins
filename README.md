# k8s-jenkins

## Spin up VMs Environment
`sudo vagrant up`

## Install vagrant scp plugin
`vagrant plugin install vagrant-scp`

## copy Jenkins k8s manifest files
`sudo vagrant scp k8s/ node1:~`

## SSH into node1 (master in k8s cluster)
`sudo vagrant ssh node1`

## Apply k8s configurations
```
kubectl create namespace jenkins
kubectl --namespace jenkins apply -f jenkins-deployment.yml
kubectl --namespace jenkins apply -f jenkins-service.yml
```

[comment]: <> (## Ansible k8s setup)

[comment]: <> (ansible-galaxy install -r requirements.yml)

[comment]: <> (vagrant ssh-config >> ~/.ssh/config)

[comment]: <> (ansible-playbook -i kubernetes.inventory install.yml)
