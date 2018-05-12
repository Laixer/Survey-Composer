## Braynz Online Platform Setup

- Install any linux (any Ubuntu) (with atd) (with updates)
- Install docker from the docker repository
  - (https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- Install docker-compose from docker repository
- Install unattended-upgrades and configure
- Make sure docker service is enabled
  - systemctl enable docker
- mkdir -p /media/<volume>
- Mount volume
  - mkfs.ext4 -F /dev/disk/by-id/<volume>
- Edit /etc/fstab
  - Add /dev/disk/by-id/<volume> /media/<volume> ext4 defaults,nofail,discard 0 0
- mkdir -p /media/<volume>/master/
- mkdir -p /media/<volume>/master/logs/
- mkdir -p /media/<volume>/master/static/
- mkdir -p /media/<volume>/master/media/
- mkdir -p /media/<volume>/master/data/db/
- Checkout repo in /srv/ in correct branch
- Checkout survey-composer repo in /srv/
- Update docker-compose.yml
- Update nginx/proxy.conf
- Install systemd docker-compose-app service
  - ./systemd-inst.sh
- Run deployment
  - ./deploy.sh <branch>
- Reboot

### Hardening

- Configure firewall
- Configure alerts
- Set PTR records
- Set CAA records
- Test reboot

### Testing

- Test 80 && 443
- Test IPv4 && IPv6
- Test HTTP2 headers
- Test TLS certificate status
- Configure ping & HTTP monitors
