### secret and mongodb
kubectl delete -f travel-agency-service/secret.yaml
kubectl delete -f travel-agency-service/mongo-deployment.yaml

### travel-agency-service
kubectl delete -f travel-agency-service/travel-agency-deployment.yaml
kubectl create -f travel-agency-service/travel-agency-deployment.yaml


### client-service
kubectl delete configmap client-service
kubectl delete -f client-service/client-service-deployment.yaml
kubectl delete -f client-service/rbac.yaml

