# oashnic_infra
oashnic Infra repository


### Использование startup_script для развёртывания инстанса

В папке со скриптом необходимо запустить примерно следующую команду:

```
gcloud compute instances create reddit-app-3  --boot-disk-size=10GB   --image-family ubuntu-1604-lts   --image-project=ubuntu-os-cloud   --machine-type=g1-small   --tags puma-server   --restart-on-failure --metadata-from-file startup-script=startup-script.sh
```

### Создание firewall правила

Для создания правила firewall с помощью gcloud необходимо выполнить примерно следующую команду:

```
gcloud compute firewall-rules create default-puma-server --allow tcp:9292 --source-ranges=0.0.0.0/0 --priority=1000 --target-tags=puma-server
```
