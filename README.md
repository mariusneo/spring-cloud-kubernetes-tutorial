# Spring Cloud Kubernetes Tutorial

## Introduction

This is a slightly modified version of the tutorial project
presented here:

[Spring Cloud Kubernetes](https://www.baeldung.com/spring-cloud-kubernetes)

which references the project source code from

[Github](https://github.com/eugenp/tutorials/tree/master/spring-cloud/spring-cloud-kubernetes)

The only problem with it is the related source code is that
it does not work out of the box.


The problem that occurs  and its corresponding solution are briefly 
described on [RBAC and Spring Cloud Kubernetes](https://medium.com/@nieldw/rbac-and-spring-cloud-kubernetes-847dd0f245e4)
blog entry.

```
io.fabric8.kubernetes.client.KubernetesClientException: Failure executing: GET at: https://kubernetes.default.svc/api/v1/namespaces/k8s-disco/services. Message: Forbidden!Configured service account doesn't have access. Service account may have been revoked. services is forbidden: User "system:serviceaccount:k8s-disco:default" cannot list services in the namespace "k8s-disco".
```

A small modification is needed for being able to run successfully the project.
In order to perform the discovery of Kubernetes components, the client-service
needs to be have the permissions to do so.

[Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)


The RBAC details are linked here:

[rbac.yaml](./client-service/rbac.yaml)


The Kubernetes configuration linked above creates:
- a service account
- a cluster role for accessing the resources used by the discovery client
- a binding between the cluster role and the service account

Finally, the file [client-service-deployment](./client-service/client-service-deployment.yaml)
references now the newly created service account (mentioned in the
 [rbac.yaml](./client-service/rbac.yaml) file).


## How to run the project

Start (project was built at the time of this writing with Java 8) 
by doing a build of the project


```
mvn clean install
```


Afterwords start your minikube environment:

```
minikube start
```

Deploy on Kubernetes the components:


```bash
./deployment-travel-client.sh
```



Finish off by cleaning up the Kubernetes environment from
the resources used in this tutorial:


```bash
./cleanup-travel-client.sh
```

### Troubleshooting


### Relevant Articles:

- [Running Spring Boot Applications With Minikube](https://www.baeldung.com/spring-boot-minikube)
- [Self-Healing Applications with Kubernetes and Spring Boot](https://www.baeldung.com/spring-boot-kubernetes-self-healing-apps)
