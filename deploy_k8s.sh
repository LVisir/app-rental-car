#!/bin/bash -e

BLUE="\033[34m"
UNDERLINE="\033[4m"
RESET="\033[0m"

echo "creating namespace app-rental-car"
kubectl create namespace app-rental-car

echo "creating configmap for mysql"
kubectl create configmap mysql-initdb --from-file=./backend/initdb -n app-rental-car

echo "🏗️ create pod mysql..."
kubectl apply -f k8s/mysql-deployment.yaml -n app-rental-car

echo "🏗️ building backend image..."
docker build -t my-backend:latest ./backend

echo "📦 create pod backend"
kubectl apply -f k8s/backend-deployment.yaml -n app-rental-car

echo "🏗️ building angular-frontend image..."
docker build -t my-angular-frontend:latest ./angular-frontend

echo "📦 create pod angular-frontend"
kubectl apply -f k8s/angular-frontend-deployment.yaml -n app-rental-car

echo "🏗️ building react-frontend image..."
docker build -t my-react-frontend:latest ./react-frontend

echo "📦 create pod react-frontend"
kubectl apply -f k8s/react-frontend-deployment.yaml -n app-rental-car

echo "⏳ Waiting a few seconds for pods to start..."
kubectl wait --for=condition=ready pod -l app=backend -n app-rental-car --timeout=300s
kubectl wait --for=condition=ready pod -l app=angular-frontend -n app-rental-car --timeout=300s
kubectl wait --for=condition=ready pod -l app=react-frontend -n app-rental-car --timeout=300s
sleep 10

kubectl -n app-rental-car get po

echo -e "Visit ${BLUE}${UNDERLINE}http://localhost:30000${RESET} for the react-frontend"
echo -e "Visit ${BLUE}${UNDERLINE}http://localhost:30001${RESET} for the angular-frontend"
echo -e "Visit ${BLUE}${UNDERLINE}http://localhost:32091/swagger-ui/index.html${RESET} for the backend's swagger"