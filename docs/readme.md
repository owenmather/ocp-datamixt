# Deploying OpenShift on AWS

This guide documents how to install an OpenShift Cluster on AWS

OpenShift support both UPI and IPI installations on AWS. 

**UPI**: The user is responsible for manually creating and managing all infrastructure components, including compute, storage, and networking resources.  
**IPI**: The OpenShift installer automates the provisioning of infrastructure components, simplifying the setup process.  

## IPI Installation

IPI installation is the recommended method for deploying OpenShift on AWS.  
This approach uses sensible defaults and automates the provisioning of infrastructure components.  
However this approach may not be suitable for all environments e.g. where specific network configurations are required or strict policies are in place.  

### Supported Cloud Credentials Modes for AWS

OpenShift supports the following `CredentialsModes` for IPI installations on AWS:
Manual, Mint, and Auto.

#### Mint Mode (Default)

In Mint Mode, OpenShift uses a User Account credentials with Administrator and performs the following:
- create new, more restricted credentials (IAM Users, roles and policies ) for different components in the OpenShift cluster.
- create access keys for each User
- create a secret containing the Access Key and Secret Key for each relevant service (**CredentialsRequest**) to use

>**Mint Mode does not support AWS STS Credentials.**  
> The AWS Credentials will be pulled from the env vars `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` or from the `~/.aws/credentials` file on the install host.

Read detailed info about Mint Mode usage [here](mint/readme.md)

#### Passthrough Mode

In Passthrough Mode, OpenShift uses a User Account credentials and performs the following:
- Passes the provided cloud credential to the components that request cloud credentials.
- This means that all components in the cluster share the same credentials.
- No IAM Users with roles & policies are created. (only master/worker ec2 instance profiles role + policies)

**All secrets will contain the same credentials in Passthrough Mode unlike Mint Mode where each service has its own credentials.**  
```shell
# The main mint user credentials are stored below
oc extract secret/aws-creds -n kube-system --to=-

# The following secrets are created by default for each service / CredentialsRequest
oc extract secrets/cloud-credential-operator-iam-ro-creds -n openshift-cloud-credential-operator --to=-
oc extract secrets/cloud-credentials -n openshift-cloud-network-config-controller --to=-
oc extract secret/image-registry-private-configuration -n openshift-image-registry --to=-
oc extract secret/cloud-credentials -n openshift-ingress-operator --to=-
oc extract secret/aws-cloud-credentials -n openshift-machine-api --to=-

capa-manager-bootstrap-credentials
storage?
```

#### Manual Mode

In Manual Mode, the user is responsible for creating the necessary AWS resources and providing the required credentials to the OpenShift installer.

Manual mode supports IAM User or Amazon Web Services Security Token Service (AWS STS). 
With this configuration, the CCO uses temporary credentials for different components.  

- Manual Mode with IAM User
- Manual Mode with AWS STS

##### Manual Mode with IAM User Credentials

https://docs.openshift.com/container-platform/4.12/installing/installing_aws/manually-creating-iam.html#manually-creating-iam-aws  

The user must run the following command the generate the yaml for the `CredentialsRequest` objects in the cluster.


```shell
oc adm release extract quay.io/openshift-release-dev/ocp-release:4.12.64-x86_64 --credentials-requests --cloud=aws
```

The following files are created by default

[0000_30_cluster-api_00_credentials-request.yaml](credentialsrequest/0000_30_cluster-api_00_credentials-request.yaml)                               
[0000_50_cluster-ingress-operator_00-ingress-credentials-request.yaml](credentialsrequest/0000_50_cluster-ingress-operator_00-ingress-credentials-request.yaml)  
[0000_30_machine-api-operator_00_credentials-request.yaml](credentialsrequest/0000_30_machine-api-operator_00_credentials-request.yaml)                      
[0000_50_cluster-network-operator_02-cncc-credentials.yaml](credentialsrequest/0000_50_cluster-network-operator_02-cncc-credentials.yaml)  
[0000_50_cloud-credential-operator_05-iam-ro-credentialsrequest.yaml](credentialsrequest/0000_50_cloud-credential-operator_05-iam-ro-credentialsrequest.yaml)             
[0000_50_cluster-image-registry-operator_01-registry-credentials-request.yaml](credentialsrequest/0000_50_cluster-image-registry-operator_01-registry-credentials-request.yaml)  
[0000_50_cluster-storage-operator_03_credentials_request_aws.yaml](credentialsrequest/0000_50_cluster-storage-operator_03_credentials_request_aws.yaml)  

The User then must then Create YAML files for secrets in the openshift-install manifests directory that you generated previously. T
he secrets must be stored using the namespace and secret name defined in the spec.secretRef for each CredentialsRequest object. 

My install expects the following secrets to be created:
```shell
grep -r  secretRef ./ -A2 -h
  secretRef:
    name: cloud-credential-operator-iam-ro-creds
    namespace: openshift-cloud-credential-operator
--
  secretRef:
    name: capa-manager-bootstrap-credentials
    namespace: openshift-cluster-api
--
  secretRef:
    name: installer-cloud-credentials
    namespace: openshift-image-registry
--
  secretRef:
    name: cloud-credentials
    namespace: openshift-ingress-operator
--
  secretRef:
    name: cloud-credentials
    namespace: openshift-cloud-network-config-controller
--
  secretRef:
    name: ebs-cloud-credentials
    namespace: openshift-cluster-csi-drivers
--
  secretRef:
    name: aws-cloud-credentials
    namespace: openshift-machine-api
```

Each of these secrets must be created in the respective namespace with the following format:
```shell
apiVersion: v1
kind: Secret
metadata:
  name: <component-secret>
  namespace: <component-namespace>
data:
  aws_access_key_id: <base64_encoded_aws_access_key_id>
  aws_secret_access_key: <base64_encoded_aws_secret_access_key>
```

The `providerSpec` in each credentials-request specifies the Policy permission requirements.  
Users should aim to be as granular as possible with the permissions to reduce the blast radius of any potential security breaches.  

### Notes

The cloud credential mode used by a existing cluster can be found in the `cloudcredential` resource.

```shell
oc get cloudcredential cluster -o yaml | grep credentialsMode
  credentialsMode: Mint
```

## UPI Installation


## Destroying the Cluster

The easiest way to destroy the cluster is to use the OpenShift installer.

```shell
openshift-install destroy cluster --dir=install_dir
```

This will remove all resources created by the installer, including the AWS resources.  
If you have created additional resources outside the installer, you will need to remove these manually.

The installer requires the `metadata.json` file to be present in the `install_dir` directory for the destroy command to work. 
This is generated during the installation process and contains the cluster configuration.  
If this file has been deleted or resources lost you can use the AWS Console to remove the resources.

OpenShift will tag all created infrastructure resources with the `kubernetes.io/cluster/CLUSTER_NAME` tag.  
Users can use this tag to identify resources created by OpenShift and remove them.  

Users can also attempt to recreate manually their metadata.json file by using the following template:

```shell
# Get clusterID from the cluster
oc get clusterversion version -o yaml | grep clusterID 
```

```shell
{
  "clusterName": "hub",
  "clusterID": "$clusterID",
  "infraID": "hub-fkmnb",
  "aws": {
    "region": "eu-west-1",
    "identifier": [
      {
        "kubernetes.io/cluster/hub-fkmnb": "owned"
      },
      {
        "openshiftClusterID": "$clusterID"
      }
    ],
    "clusterDomain": "$BASE_DOMAIN",
  }
}
```