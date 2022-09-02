
## Before commands

* Commands must be run in the directory where the main.tf file in the relevant installation file is located.

* The kube_config file must be added for the respective kubernetes cluster


## Commands

### Downloading Packages
```
terraform init
```

### To see the variables that will affect before installation
```
terraform plan
```


### Installing the application
```
terraform apply
```