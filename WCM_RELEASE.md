# WCM RELEASE procedure for new image of etcd-operator:


- Modify the code in etcd-operator for which you want to release the new image
- Bump the version [here](https://github.com/cisco-app-networking/etcd-operator/blob/master/version/version.go#L18)
- Run the script with updated version
```bash
$ ETCD_OPERATOR_IMAGE=containers.cisco.com/appn/coreos-etcd-operator:v0.9.5 ./build_image.sh
```
- Make sure the binary in *_output/bin/etcd-operator* changed (check the modification time)
- Push the image
```bash
$ docker push containers.cisco.com/appn/coreos-etcd-operator:v0.9.5
```
- Modify the image [here](https://wwwin-github.cisco.com/cisco-app-networking/wcm-common/blob/3rdparty-image-hosting/.jenkins/build-docker.sh#L14)  and re-run [this pipeline](https://engci-private-sjc.cisco.com/jenkins/eti-sre/job/AppN/job/wcm-registry-hosting/job/3rdparty-image-hosting/)
