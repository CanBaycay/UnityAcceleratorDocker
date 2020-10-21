# Unity Accelerator Docker Configuration
Docker configuration for a simple [Unity Accelerator](https://hub.docker.com/r/unitytechnologies/accelerator) server. Ideal to be used locally or inside an internal network. 

Supports [Prometheus](https://prometheus.io/) that collects stats from Accelerator.

Supports [Grafana](https://grafana.com/) that helps visualizing these stats.


# Option 1 / Absolutely Easy Setup for Windows

- Install [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows). Might need to also configure Hyper-V or WSL 2 on your system.
- Double click `Install.bat` to let Unity Accelerator come into life.
- Go to `Unity preferences` and Cache Server tab. 
- Set Cache Server Default Mode to `Enabled`.
- Enter Default IP Adress as `localhost:10080`
- Click `Check Connection` and make sure you see `"Connection successful"` message.

From now on, Accelerator will serve in the background seamlessly and your Unity asset import times will reduce drastically. 


# Option 2 / Advanced Setup

Default configurations are only ideal for local use and not ideal for environments where safety is essential. So modify the configurations below as you need.

## First Time Setup
See `accelerator.env` for initial configuration used when first creating the images. So configure these before everything else. Possible values are documented here:

https://docs.unity3d.com/Manual/UnityAccelerator.html#docker

## Enable Prometheus and Grafana

Prometheus and Grafana are not included by default to keep the server lightweight. Open `docker-compose.yml` and uncomment all lines if you'd like to have a cool looking dashboard.

## Run Server

- Open command line.
- Go to the folder where you put these files.
- Run: `docker-compose up -d`
- Take a look at the `Dashboard`: http://localhost:10080 (Default Username: admin, Password: admin)

## Unity Configuration
- Go to `Unity preferences` and Cache Server tab. 
- Set Cache Server Default Mode to `Enabled`.
- Enter Default IP Adress as `localhost:10080`
- Click `Check Connection` and make sure you see `"Connection successful"` message.

If you enabled Prometheus and Grafana, they are available at:
- Prometheus: http://localhost:9090/
  - Nothing much to see here. Proceed to Grafana.
- Grafana: http://localhost:3000/ (Default Username: admin, Password: admin)
  - Create a new Dashboard.
  - Add new Panel.
  - Add a new metric. For example `uta > uta_agent_sys_cpu_percent` that shows CPU usage history.
  - Add more Panels for parameters you'd like to track.

## What's Next

- Reverse proxies should be used in real world scenarios, which is not covered in this configuration. They allow more safer ways to access services, while allows more intuitive address naming instead of addresses being full of ports and IPs.
- If you like to see behind the scenes, here are some links.
  - Metrics: http://localhost:10080/metrics
  - Health: http://localhost:10080/api/agent-health


# Uninstall / Update

To remove the Accelerator and its artifacts completely, double-click `Uninstall.bat` or run the command below.

`docker-compose down -v --rmi all`

It will remove all asset cache and all configuration along with the Accelerator installation.

Note that the Accelerator automatically updates itself. If you need to update it manually, easiest and most reliable way to do is to uninstall and install it again. The latest version will automatically be downloaded when installing from the beginning.


# Related Links
- Forums might have extra information over documents
  - https://forum.unity.com/threads/welcome-to-unity-accelerator.742922/
  - https://forum.unity.com/forums/unity-accelerator.392/
- Documents
  - https://docs.unity3d.com/Manual/UnityAccelerator.html
  - https://docs.unity3d.com/Manual/AssetDatabase.html
- Docker Hub
  - https://hub.docker.com/r/unitytechnologies/accelerator
  - https://hub.docker.com/search?q=unity%20accelerator&type=image
