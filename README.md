### Basic Usage
```
docker run -d -p 81:22 --name master1 --hostname master1 -e ROOT_PASSWORD=123 registry.cn-shenzhen.aliyuncs.com/xuybin/vm
docker run -d -p 82:22 --name master2 --hostname master2 -e ROOT_PASSWORD=123 registry.cn-shenzhen.aliyuncs.com/xuybin/vm
docker run -d -p 83:22 --name slave1 --hostname slave1 -e ROOT_PASSWORD=123 registry.cn-shenzhen.aliyuncs.com/xuybin/vm
docker run -d -p 84:22 --name slave2 --hostname slave2 -e ROOT_PASSWORD=123 registry.cn-shenzhen.aliyuncs.com/xuybin/vm
docker run -d -p 85:22 --name slave3 --hostname slave3 -e ROOT_PASSWORD=123 registry.cn-shenzhen.aliyuncs.com/xuybin/vm
```

After the container is up you are able to ssh in it as root with the in --env provided password for "root"-user.
```
ssh root@IP -p 81
ssh root@IP -p 82
ssh root@IP -p 83
ssh root@IP -p 84
ssh root@IP -p 85