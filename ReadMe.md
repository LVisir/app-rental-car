recap:

dentro app-rental-car:

kubectl create configmap mysql-initdb --from-file=./backend/initdb
kubectl apply -f k8s/mysql-deployment.yaml
docker build -t my-backend:latest ./backend
kubectl apply -f k8s/backend-deployment.yaml
docker build -t my-angular-frontend:latest ./angular-frontend
docker build -t my-react-frontend:latest ./react-frontend
kubectl apply -f k8s/angular-frontend-deployment.yaml
kubectl apply -f k8s/react-frontend-deployment.yaml

kubectl port-forward service/backend 8091:8091 >/dev/null 2>&1 &
kubectl port-forward service/angular-frontend 4200:4200 >/dev/null 2>&1 &
kubectl port-forward service/react-frontend 3000:3000 >/dev/null 2>&1 &