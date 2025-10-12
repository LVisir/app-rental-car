#!/bin/bash

echo "Deleting namespace app-rental-car..."
echo "Deleting the images installed..."
kubectl delete namespace app-rental-car

docker rmi my-react-frontend
docker rmi my-angular-frontend
docker rmi my-backend

