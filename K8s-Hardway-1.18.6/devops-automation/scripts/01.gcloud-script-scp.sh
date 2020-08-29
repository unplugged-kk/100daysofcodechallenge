#!/bin/bash

for instance in controller-0 controller-1 ; do
  gcloud compute scp 07-bootstrapping-etcd.sh 08-bootstrapping-kubernetes-controllers.sh \
     ${instance}:~/
done

for instance in worker-0 worker-1 ; do
  gcloud compute scp  09-bootstrapping-kubernetes-workers.sh \
     ${instance}:~/
done
