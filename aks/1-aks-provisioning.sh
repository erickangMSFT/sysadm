az provider register -n Microsoft.ContainerService
az provider register -n Microsoft.Compute
az provider register -n Microsoft.Network

az group create -n k8aksResourceGroup -l westus2

az aks create -g k8aksResourceGroup \
    -n arisK8Cluster \
    --agent-count 8 \
    --agent-vm-size Standard_D8s_v3 \
    --generate-ssh-keys

az aks install-cli

az aks get-credentials \
    -g k8aksResourceGroup \
    -n arisK8Cluster

kubectl config get-contexts