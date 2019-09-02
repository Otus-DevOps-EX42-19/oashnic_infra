# oashnic_infra
oashnic Infra repository

### Подключение к серверу через промежуточный сервер

```
ssh -A -t 35.228.154.185 ssh 10.166.0.9
```

### Создание alias

```
alias someinternalhost='ssh -A -t 35.228.154.185 ssh 10.166.0.9'
```

### Cloud Bastion

bastion_IP = 35.228.154.185

someinternalhost_IP = 10.166.0.9
