# Waypoint Helm Chart

This repository contains the official HashiCorp Helm chart for installing
and configuring Waypoint on Kubernetes.

**This is pre-release.** The recommended way today to install Waypoint
is using the `waypoint install` subcommand. This Helm chart only works with
Waypoint 0.6+ (unreleased). We will document this Helm chart in more detail
once it is officially released.

## Prerequisites

To use the charts here, [Helm](https://helm.sh/) must be configured for your
Kubernetes cluster. Setting up Kubernetes and Helm is outside the scope of
this README. Please refer to the Kubernetes and Helm documentation.

The versions required are:

  * **Helm 3.0+** - This is the earliest version of Helm tested. It is possible
    it works with earlier versions but this chart is untested for those versions.
  * **Kubernetes 1.20+** - This is the earliest version of Kubernetes tested.
    It is possible that this chart works with earlier versions but it is
    untested.

## Usage

#### Install the Helm Chart

```sh
$ helm install waypoint ./
...
```

**Note:** we will support the official HashiCorp Helm chart index soon.

#### Wait for Waypoint to Initialize

It takes anywhere from 15 seconds to a few minutes for Waypoint to
finish bootstrapping. I recommend just waiting for the load balancer
to be ready with an IP:

```sh
# Not ready yet
$ kubectl get service waypoint-ui
NAME              TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)                        AGE
waypoint-ui       LoadBalancer   10.245.138.80   <pending>     443:30836/TCP,9701:31734/TCP   4m42s

# Ready! (See External IP)
$ kubectl get service waypoint-ui
NAME          TYPE           CLUSTER-IP      EXTERNAL-IP      PORT(S)                        AGE
waypoint-ui   LoadBalancer   10.245.138.80   143.244.211.64   443:30836/TCP,9701:31734/TCP   9m15s
```

Copy the external IP. In this example it is `143.244.211.64`.

#### Log In

The Helm chart puts the initial token in the `waypoint-server-token`
Kubernetes Secret. Once you read this token, you can delete or rotate it
if you want.

Get the token:

```sh
$ kubectl get secret waypoint-server-token -o jsonpath="{.data.token}" | base64 --decode
3K4wQUdH1dfFHsFkYxmzzMHimJj6UE9tH4PhBQcLK9WACNmxHwmEJhqrvVGwVxaT2KUNtFUCAr7Wd3ci5NmFm6sRuKutzsn7CGs71ip2bnEywfEyxt7eaBvsn3kbCMjKzWPrEonR4Q7jgt6k⏎
```

Log in:

```sh
$ waypoint login -token=<token> <external ip>:9701
Authentication complete!
```

**Important:** Note the port `9701` we add to the IP. This is so that we
target the gRPC port.
