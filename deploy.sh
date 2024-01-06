docker build -t abhinayreddydocker/multi-client:latest -t abhinayreddydocker/multi-client:$SHA -f ./complex-gh-copy/client/Dockerfile ./complex-gh-copy/client/Dockerfile
docker build -t abhinayreddydocker/multi-server:latest -t abhinayreddydocker/multi-server:$SHA -f ./complex-gh-copy/server/Dockerfile ./complex-gh-copy/server/Dockerfile
docker build -t abhinayreddydocker/multi-worker:latest -t abhinayreddydocker/multi-worker:$SHA -f ./complex-gh-copy/worker/Dockerfile ./complex-gh-copy/worker/Dockerfile
docker push abhinayreddydocker/multi-client:latest
docker push abhinayreddydocker/multi-server:latest
docker push abhinayreddydocker/multi-worker:latest
docker push abhinayreddydocker/multi-client:$SHA
docker push abhinayreddydocker/multi-server:$SHA
docker push abhinayreddydocker/multi-worker:$SHA
kubectl apply -f simplek8s
kubectl set image deployments/server-deployment server=abhinayreddydocker/multi-server:$SHA
kubectl set image deployments/client-deployment client=abhinayreddydocker/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=abhinayreddydocker/multi-worker:$SHA
