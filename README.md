<a href="https://snapcraft.io/redis">
	<img alt="redis" src="https://snapcraft.io/redis/badge.svg"/>
</a>
<br>
<img src="https://github.com/AzagraMac/redis-docker/assets/571796/5316f9a7-c956-4226-8619-2c913897c3d0" width="400">


### Install Docker
    sudo apt update && sudo apt install git vim wget curl net-tools ca-certificates gnupg -y
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo usermod -aG docker $USER
    sudo reboot

## Build

    git clone https://github.com/AzagraMac/redis-docker.git
    cd redis-docker
    
    docker build -t yourname/redis:tag


## Launch

    docker compose up -d

## Loggin

    docker logs -f redis

output:
```
vm.overcommit_memory = 1
10:C 08 Dec 2023 21:17:17.697 * oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
10:C 08 Dec 2023 21:17:17.698 * Redis version=7.2.3, bits=64, commit=00000000, modified=0, pid=10, just started
10:C 08 Dec 2023 21:17:17.698 * Configuration loaded
10:M 08 Dec 2023 21:17:17.698 * monotonic clock: POSIX clock_gettime
                _._                                                  
           _.-``__ ''-._                                             
      _.-``    `.  `_.  ''-._           Redis 7.2.3 (00000000/0) 64 bit
  .-`` .-```.  ```\/    _.,_ ''-._                                  
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 10
  `-._    `-._  `-./  _.-'    _.-'                                   
 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
 |    `-._`-._        _.-'_.-'    |           https://redis.io       
  `-._    `-._`-.__.-'_.-'    _.-'                                   
 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
 |    `-._`-._        _.-'_.-'    |                                  
  `-._    `-._`-.__.-'_.-'    _.-'                                   
      `-._    `-.__.-'    _.-'                                       
          `-._        _.-'                                           
              `-.__.-'                                               

10:M 08 Dec 2023 21:17:17.700 * Server initialized
10:M 08 Dec 2023 21:17:17.700 * Ready to accept connections tcp
```
