Steps to deploy nginx sample app with multiple versions and route traffic between them and analyse metrics.
- For local test we will be using minikube for having local k8s cluster, start the minikube service. If minikube is not installed then install it using https://minikube.sigs.k8s.io/docs/start/

```minikube start```

- Download istio, add istio client path and install istio:
```
curl -L https://istio.io/downloadIstio | sh -
cd <istio_dir>
export PATH=$PWD/bin:$PATH
istioctl install - set profile=demo -y
```
- Add a namespace label to instruct istio to automatically inject Envoy sidecar proxies when you deploy your application later:
```
kubectl label namespace default istio-injection=enabled
```
- Clone the repo and execute following cmds to deploy sample app.
```
kubectl apply -f nginx-deployment-version1.yaml
kubectl apply -f nginx-deployment-version2.yaml
kubectl apply -f nginx-service.yaml
kubectl apply -f nginx-virtual-service.yaml
```
- Ensure that there are no issues with the configuration:
```
istioctl analyze
```
- Install kiali and the other addons using following cmds and wait for them to be deployed.
```
kubectl apply -f samples/addons
kubectl rollout status deployment/kiali -n istio-system
```
- Expose service using minikube tunnel and browser the application.
```
minikube service nginx
```
- Expose the kiali dashboard using tunnel to view the istio metrics.
```
minikube service kiali -n istio-system
```
- Similarly other service like grafana and prometheus can also be expose to view the collected metrics:
```
minikube service grafana -n istio-system
minikube service prometheus -n istio-system
```
Metrics using kiali dashboard:
<img width="956" alt="Screenshot 2024-02-14 180346" src="https://github.com/RahulNik25/nginx-istio/assets/154538145/88da13cf-7a53-461d-a87c-740ea09d6a19">

Steps to Uninstall
- Remove installed addons
```
kubectl delete -f samples/addons
```
- Delete istio namespace
```
kubectl delete namespace istio-system
```
- Delete the app
```
Kubectl delete -f .
```
- Remove the added istio label to the namespace
```
kubectl label namespace default istio-injection-
```
