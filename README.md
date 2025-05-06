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

output:
```
[+] Building 27.8s (12/12) FINISHED                                                                                                                                                                                                                           docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                                    0.1s
 => => transferring dockerfile: 330B                                                                                                                                                                                                                                    0.1s
 => [internal] load metadata for docker.io/library/redis:7.4.3-bookworm                                                                                                                                                                                                 1.4s
 => [auth] library/redis:pull token for registry-1.docker.io                                                                                                                                                                                                            0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                                                       0.1s
 => => transferring context: 2B                                                                                                                                                                                                                                         0.0s
 => [1/6] FROM docker.io/library/redis:7.4.3-bookworm@sha256:7df1eeff67eb0ba84f6b9d2940765a6bb1158081426745c185a03b1507de6a09                                                                                                                                           0.0s
 => [internal] load build context                                                                                                                                                                                                                                       0.3s
 => => transferring context: 110.55kB                                                                                                                                                                                                                                   0.2s
 => CACHED [2/6] WORKDIR /redis                                                                                                                                                                                                                                         0.0s
 => CACHED [3/6] COPY init.sh .                                                                                                                                                                                                                                         0.0s
 => [4/6] COPY redis.conf .                                                                                                                                                                                                                                             0.5s
 => [5/6] RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*                                                                                                                                                                               23.1s
 => [6/6] RUN chmod +x init.sh                                                                                                                                                                                                                                          1.0s 
 => exporting to image                                                                                                                                                                                                                                                  0.5s 
 => => exporting layers                                                                                                                                                                                                                                                 0.4s 
 => => writing image sha256:128f994d3a47dd54d6aedf258c4df38746f1592959f115246d42a69f57222301                                                                                                                                                                            0.0s 
 => => naming to docker.io/azagramac/redis:latest
```

## Launch

    docker compose up -d

output:
```
[+] Running 2/2
 ✔ Network redis-docker_default  Created                                                                                                                                                                                                                                0.3s 
 ✔ Container redis               Started
```

## Loggin

    docker logs -f redis

output:
```
vm.overcommit_memory = 1
11:C 06 May 2025 14:42:30.979 * oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
11:C 06 May 2025 14:42:30.979 * Redis version=7.4.3, bits=64, commit=00000000, modified=0, pid=11, just started
11:C 06 May 2025 14:42:30.979 * Configuration loaded
11:M 06 May 2025 14:42:30.982 * monotonic clock: POSIX clock_gettime
                _._                                                  
           _.-``__ ''-._                                             
      _.-``    `.  `_.  ''-._           Redis Community Edition      
  .-`` .-```.  ```\/    _.,_ ''-._     7.4.3 (00000000/0) 64 bit
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 11
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

11:M 06 May 2025 14:42:30.993 * Server initialized
11:M 06 May 2025 14:42:31.000 * Ready to accept connections tcp
```
