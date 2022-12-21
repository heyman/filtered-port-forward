build:
	docker build --platform=linux/amd64 -t heyman/filtered-port-forward .

push:
	docker push heyman/filtered-port-forward
