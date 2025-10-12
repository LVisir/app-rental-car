#!/bin/bash

docker stop app-rental-car-angular-frontend-1 || echo "container app-rental-car-angular-frontend-1 stopped"

docker rm app-rental-car-angular-frontend-1 || echo "container app-rental-car-angular-frontend-1 removed"

docker stop app-rental-car-backend-1 || echo "container app-rental-car-backend-1 stopped"

docker rm app-rental-car-backend-1 || echo "container app-rental-car-backend-1 removed"

docker stop app-rental-car-mysql-1 || echo "container app-rental-car-mysql-1 stopped"

docker rm app-rental-car-mysql-1 || echo "container app-rental-car-mysql-1 removed"

docker stop app-rental-car-react-frontend-1 || echo "container app-rental-car-react-frontend-1 stopped"

docker rm app-rental-car-react-frontend-1 || echo "container app-rental-car-react-frontend-1 removed"

docker rmi app-rental-car-angular-frontend || echo "image app-rental-car-angular-frontend removed"

docker rmi app-rental-car-backend || echo "image spring-rental-car-backend removed"

docker rmi app-rental-car-react-frontend || echo "image app-rental-car-react-frontend removed"

docker rmi mysql:8 || echo "image mysql:8 removed"