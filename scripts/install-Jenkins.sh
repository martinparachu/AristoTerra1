#confirm that your cluster is running (optional)
#gcloud container clusters list

#get the credentials
gcloud container clusters get-credentials milan-gke-cluster --region us-east1

#verify connection to the cluster (optional)
#kubectl cluster-info

#add cluster administrator in the cluster's RBAC
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value account)

#grant Tiller the cluster-admin role
kubectl create serviceaccount tiller --namespace kube-system
kubectl create clusterrolebinding tiller-admin-binding --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

#initialize/update Helm
helm init --service-account=tiller
helm update

#verify Helm (Optional)
#helm version

#install Jenkins using Helm
helm install -n cd stable/jenkins -f values.yaml --version 1.2.2 --wait

#Configure the Jenkins service account to be able to deploy
kubectl create clusterrolebinding jenkins-deploy --clusterrole=cluster-admin --serviceaccount=default:cd-jenkins

#setup port forwarding to the Jenkins UI
export POD_NAME=$(kubectl get pods -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 8080:8080 >> /dev/null &

#retrieve Jenkins admin password
printf $(kubectl get secret cd-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo