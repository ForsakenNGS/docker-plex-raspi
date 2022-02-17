# docker-plex-raspi
Plex Media Server with Raspberry Pi hardware encoding

## Example docker-compose.yml
```yml
version: "2.3"
services:
  plex:
    image: jensn/docker-plex-raspi
    container_name: plex
    network_mode: host
    device_cgroup_rules:
      - 'c *:* rmw'
    environment:
      - PUID=1000
      - PGID=1000
      - VERSION=docker
      - TZ=Europe/Berlin
    volumes:
      - /home/pi/docker/plex:/config
      - /mnt/MyMediaDrive:/mnt/MyMediaDrive
      - /dev:/dev
    restart: unless-stopped
```
