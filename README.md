# Stable Diffusion UI setup on NRP Nautilus

## One time setup

Building the Docker containers:

```
git clone https://github.com/AbdBarho/stable-diffusion-webui-docker.git

docker build -t <project name>/download services/download/
docker build -t <project name>/auto services/AUTOMATIC1111/
```

Push to the gitlab registry:

```
docker push <project name>/download
docker push <project name>/auto
```

Pushing the auto container (the UI) may be slow as it is a large container.

Create the PVC and job to download the data:

```
kubectl apply -f one-time/data-pvc.yaml
kubectl apply -f one-time/download-job.yaml
```

## Starting the UI

Each UI needs a separate directory, preferably named after the user.  You can copy the `example` directory and make a few modifications.

Edit the `kustomization.yaml` file to fill in the `namePrefix` and the URLs in the `patchesJSON6902` section.

Start the UI with the kubectl command, replacing `directory` with the directory you copied from the `example`.

```
kubectl apply -k <directory>/
```

## Deleting

When you are done with a user, you can delete the resources used by the UI with the delete command:

```
kubectl delete -k <directory>/
```
