# Discuz X2 on Docker

## 拉取镜像

```shell
docker pull langyo/discuz_x2
```

## 配置

建议与 Docker Compose 或 K8S 配合使用。

下面是一份```docker-compose.yml```的示例：

```yaml
version: '3'

volumes:
  db:

services:
  db:
    image: mariadb:latest
    ports:
      - 3306:3306
    volumes:
      - db:/var/lib/mysql
    networks:
      - backend
    restart: always
    environment:
      MARIADB_ROOT_PASSWORD: root
  php:
    image: langyo/discuz_x2:latest
    ports:
      - 8080:80
    links:
      - db
    depends_on:
      - db
    networks:
      - backend

networks:
  backend:
    driver: bridge
```
