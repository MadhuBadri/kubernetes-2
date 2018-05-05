# kubernetes

Installation of kubernetes cluster in private cloud.

## Configuration

The following table lists the configurable parameters of the kubernetes cluster install and their default values.

| Parameter           | Description                                                                                           | Default                     |
|---------------------|-------------------------------------------------------------------------------------------------------|-----------------------------|
| `ENABLE_DEBUG`      | To enable debug mode for the scripts.                                                                 | `true`                      |
| `MOUNT_PATH`        | The mount path where kubernetes scripts and certificates are available.                               | `/export`                   |
| `INSTALL_PATH`      | The directory where kubernetes installation scripts are available.                                    | `$MOUNT_PATH/kubernet...`   |
| `REPOSITORY`        | The url where kubernetes binaries are present.                                                        | `http://192.168.1.5`        |
| `HOSTINTERFACE`     | The host interface name of node                                                                       | `eth0`                      |
| `HOSTIP`            | IP Address of the host.                                                                               | `Retrieved via script`      |
| `WORKDIR`           | The temporary installation path for kubernetes components.                                            | `/export/tmp`               |
| `SERVER_DNS`        | The comma separated dns names where kubernetes master would be running, this also includes name of the kubernetes api service dns names, the dns name where ha proxy is running | `master.cloud.com..` |
| `SERVER_IP`         | The comma separated list of all the ip addresses where master and ha proxy would be running (actual & virtual). This should also include the ip addess of kubernetes cluster api service ip. | `11.0.0.1....` |
| `SERVERS`           | A comma separated list where kubernetes masters are running                                           | `11.0.0.2:node01.cloud.com` |
| `WORKERS`           | A comma separated list of nodes where kubernetes workers nodes would be running.                      | `11.0.0.2:node01.cloud.com` |
| `NODES`             | A comma separated list of nodes for which client certificates need to be generated.                   | `11.0.0.2:node01.cloud.com` |
| `CLUSTER`           | Kubernetes cluster name                                                                               | `cloud.com`                 |
| `CERTIFICATE_MOUNT_PATH` | Location where kubernetes certificates are located.                                              | `${CERTIFICATE}/certs/`     |
| `CA_CERTIFICATE`    | CA certificate full path.                                                                             | `${CERTIFICATE_MOUNT_PATH}/ca.crt` |
| `API_SERVER`        | The url where haproxy is running.                                                                     | `https://master.cloud.com`  |
| `CLIENT_CERTIFICATE` | The client crt file to access cluster.                                                               | `${CERTIFICATE_MOUNT_PATH}/admin.crt` |
| `CLIENT_KEY`        | The client key file to access cluster.                                                                | `${CERTIFICATE_MOUNT_PATH}/admin.key` |
| `ETCD_CLUSTERS`     | The comma separated list of etcd servers.                                                             | `11.0.0.2:node01`           |
| `HAPROXY`           | IP Address of haproxy                                                                                 | `11.0.0.1`                  | 
| `FLANNEL_NET`       | IP range used for flannel overlay network.                                                            | `172.17.0.0/16`             |
| `CLUSTERIPRANGE`    | IP range of kubernetes service.                                                                       | `172.18.0.0/24`             |
| `APISERVER_HOST`    | The url of kubernetes  api server                                                                     | `https://master.cloud.com`  |
| `ETCD_CLUSTERS_CERTS` | A comma separated list of etcd hosts for creating certificates.                                     | `11.0.0.2:node01.cloud.com` |
| `DOMAIN`            | The domain on which vms are hosted.                                                                   | `cloud.com`                 |
| `ENABLE_ETCD_SSL`   | To enable ssl for etcd                                                                                | `true`                      |
| `ENABLE_KUBE_SSL`   | To enable SSL and RBAC for kubernetes cluster.                                                        | `true`                      |
| `ENABLE_OIDC`       | To enable openid connect for authentication.                                                          | `true`                      |
| `INGRESS_HOST`      | Host name for the ingress.                                                                            | `master.cloud.com`          |
| `INSTALL_INGRESS`   | To enable ingress installation.                                                                       | `true`                      |
| `DNS_IP`            | Cluster IP of kube-dns.                                                                               | `172.18.0.2`                |
| `YOUR_DOMAIN`       | Kubernetes clsuter domain.                                                                            | `cloud.uat`                 |
| `INSTALL_KUBELET_ON_MASTER` | To install kubelet on master nodes.                                                           | `true`                      |
| `INSTALL_DASHBOARD` | To install kubernetes dashboard.                                                                      | `true`                      |
| `INSTALL_SKYDNS`    | To install kube-dns.                                                                                  | `true`                      |
| `SKYDNS_DOMAIN_NAME` | Kubernetes clsuter domain.                                                                           | `cloud.uat`                 |
| `ETCD_VERSION`      | The version of etcd to install.                                                                       | `etcd-v3.2.18-linux-amd64`  |
| `FLANNEL_VERSION`   | The version of flannel to install.                                                                    | `flannel-v0.10.0-linux-amd64` |    


Useful links:<br>
https://kubernetes.io/docs/tasks/tools/install-kubectl/<br>
https://medium.com/@TarunChinmai/installing-kubernetes-f0c8dec1487c<br>
https://medium.com/@felipedutratine/kubernetes-on-local-with-minikube-tutorial-413475d587e6<br>
https://www.techrepublic.com/article/how-to-quickly-install-kubernetes-on-ubuntu/<br>
https://blog.alexellis.io/kubernetes-in-10-minutes/<br>
https://github.com/dannyaj/Install-Kubernetes-on-Ubuntu-16.04<br>
https://hxquangnhat.com/2016/12/21/tutorial-deploy-a-kubernetes-cluster-on-ubuntu-16-04/<br>
http://www.dasblinkenlichten.com/kubernetes-101-networking/<br>
http://leebriggs.co.uk/blog/2017/02/18/kubernetes-networking-calico.html<br>
http://docker-k8s-lab.readthedocs.io/en/latest/docker/bridged-network.html<br>
http://network-insight.net/2016/06/kubernetes-networking-101/<br>
http://blog.oddbit.com/2014/08/11/four-ways-to-connect-a-docker/<br>
https://blog.laputa.io/kubernetes-flannel-networking-6a1cb1f8ec7c<br>
https://ahmet.im/blog/kubernetes-network-policy/<br>
https://icicimov.github.io/blog/kubernetes/Kubernetes-cluster-step-by-step/ <br>
https://developer.epages.com/blog/tech-stories/how-to-setup-a-ha-kubernetes-cluster-worker-components-and-skydns/ <br>
https://github.com/trondhindenes/Kubernetes-Auth0 <br>
https://github.com/wardviaene/advanced-kubernetes-course <br>
