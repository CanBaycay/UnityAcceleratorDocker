# Unity Accelerator Docker Configuration
Docker configuration of a simple `Unity Accelerator` server to be used locally or in an internal network. 

Supports `Prometheus` that collects stats from Accelerator.

Supports `Grafana` that helps visualizing these stats.

See https://hub.docker.com/r/unitytechnologies/accelerator for more.

# Option 1 / Absolutely Easy Setup for Windows

- Install `Docker Desktop for Windows`.
- Double click `Install.bat` to let Unity Accelerator to come into life.
- Go to `Unity preferences` and Cache Server tab. 
- Set Cache Server Default Mode to `Enabled`.
- Enter Default IP Adress as `localhost:10080`
- Make sure you see `"Connection successful"` message.

From now on, Accelerator will serve in the background seamlessly and your Unity asset import times will reduce drastically. 

# Option 2 / Advanced Setup

Default configurations are only ideal for local use and not ideal for environments where safety is essential. So modify the configurations below as you need.

## First Time Setup
See `accelerator.env` for initial configuration that are used when first creating the images. So configure these before everything else. Possible values are documented here:

https://docs.unity3d.com/Manual/UnityAccelerator.html#docker

Default `Dashboard` password is set to `admin`.

```
USER=admin
PASSWORD=admin
```

Prometheus and Grafana are not included by default to keep the server lightweight. Open `docker-compose.yml` and uncomment all lines if you'd like to have a cool looking dashboard.

## Run Server

- Open command line.
- Go to the folder where you put these files.
- Run: `docker-compose up -d`
- Take a look at the `Dashboard`: http://localhost:10080

## Unity Configuration
- Go to `Unity preferences` and Cache Server tab. 
- Set Cache Server Default Mode to `Enabled`.
- Enter Default IP Adress as `localhost:10080`
- Make sure you see `"Connection successful"` message.

If you enabled Prometheus and Grafana, they are available at:
- Grafana: http://localhost:3000/
- Prometheus: http://localhost:9090/

## What's Next

- Reverse proxies should be used in real world scenarios, which is not covered in this configuration. They allow more safer ways to access services, while allows more intuitive address naming instead of addresses being full of ports and IPs.
- If you like to see behind the scenes, here are some links.
  - Metrics: http://localhost:10080/metrics
  - Health: http://localhost:10080/api/agent-health

# Related Links
- Forums might have more information than documents:
  - https://forum.unity.com/threads/welcome-to-unity-accelerator.742922/
  - https://forum.unity.com/forums/unity-accelerator.392/
- Documents
  - https://docs.unity3d.com/Manual/UnityAccelerator.html
  - https://docs.unity3d.com/Manual/AssetDatabase.html
- Docker Hub
  - https://hub.docker.com/r/unitytechnologies/accelerator
  - https://hub.docker.com/search?q=unity%20accelerator&type=image
