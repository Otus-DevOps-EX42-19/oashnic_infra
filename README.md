# oashnic_infra
oashnic Infra repository

## terraform-2 задание *

Файл tfstate не хранится локально, а находится в бакете в google cloud. В связи с этим, если конфигурация будет запускаться одновременно с двух устройств, то будет работать только один экземпляр, так как блокирующий файл так же будет храниться в google cloud
