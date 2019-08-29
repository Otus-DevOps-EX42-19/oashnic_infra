# oashnic_infra
oashnic Infra repository


### Использование startup_script для развёртывания инстанса

В папке со скриптом необходимо запустить примерно следующую команду:

```
gcloud compute instances create reddit-app-3  --boot-disk-size=10GB   --image-family ubuntu-1604-lts   --image-project=ubuntu-os-cloud   --machine-type=g1-small   --tags puma-server   --restart-on-failure --metadata-from-file startup-script=startup-script.sh
```
