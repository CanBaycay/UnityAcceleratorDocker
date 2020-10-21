# Unity Accelerator Docker Configuration
Docker configuration for a simple [Unity Accelerator](https://hub.docker.com/r/unitytechnologies/accelerator) server.

Supports [Prometheus](https://prometheus.io/) and [Grafana](https://grafana.com/) that collects stats from Accelerator and displays in customized dashboards.


# Setup Option 1: Absolutely Easy Setup

- Install [Docker Desktop](https://www.docker.com/products/docker-desktop).
- Download and place these files into a directory and keep them there as long as you use Accelerator.
- Install Accelerator.
  - Windows: Double click `Install.bat`.
  - Others: Open terminal, go to the directory, run: `docker-compose up -d`
- Open a Unity project. Go to `Preferences` and then `Cache Server` tab. 
- Set Cache Server Default Mode to `Enabled` and enter Default IP Adress:
  - For working locally, enter `localhost:10080`
  - For working in network, find and enter the IP of the system that runs Docker. For example `192.168.0.200:10080`
- Click `Check Connection` and make sure you see `"Connection successful"` message.

From now on, Accelerator will serve in the background for all of your projects seamlessly and your Unity asset import times will reduce drastically. 


# Setup Option 2: Custom Setup

Default configurations are only ideal for local use and not ideal for environments where safety is essential. So modify the configurations below as you need.

## First Time Setup
See `accelerator.env` for initial configuration used when first creating the images. So configure these before everything else. Possible values are documented here:

https://docs.unity3d.com/Manual/UnityAccelerator.html#docker

## Enable Prometheus and Grafana

Prometheus and Grafana are not included by default to keep the server lightweight. Open `docker-compose.yml` and uncomment all lines if you'd like to have a cool looking dashboard.

## Run Server

- Open command line / terminal.
- Go to the folder where you put these files.
- Run: `docker-compose up -d`
- Take a look at the `Dashboard`: http://localhost:10080 (Default Username: admin, Password: admin)

## Unity Configuration
- Open a Unity project. Go to `Preferences` and then `Cache Server` tab. 
- Set Cache Server Default Mode to `Enabled` and enter Default IP Adress:
  - For working locally, enter `localhost:10080`
  - For working in network, find and enter the IP of the system that runs Docker. For example `192.168.0.200:10080`
- Click `Check Connection` and make sure you see `"Connection successful"` message.

## Stats
If you enabled Prometheus and Grafana, they are available at:
- Prometheus: http://localhost:9090/
  - Nothing much to see here. Proceed to Grafana.
- Grafana: http://localhost:3000/ (Default Username: admin, Password: admin)
  - Create a new Dashboard.
  - Add new Panel.
  - Add a new metric. For example `uta > uta_agent_sys_cpu_percent` that shows CPU usage history.
  - Add more Panels for parameters you'd like to track.

## What's Next

- Reverse proxies should be used in more serious development environments. They allow safer ways to access services, while allows more intuitive address naming instead of addresses being full of ports and IPs.
- If you'd like to see some behind the scenes, here are some links.
  - Metrics: http://localhost:10080/metrics
  - Health: http://localhost:10080/api/agent-health


# Uninstall / Update

To remove the Accelerator and its artifacts completely,
- Windows: Double click `Uninstall.bat`.
- Others: Open terminal. Go to the directory. Run: `docker-compose down -v --rmi all`

It will remove all asset cache and all configuration along with the Accelerator installation.

Note that the Accelerator automatically updates itself. If you need to update it manually, easiest and most reliable way to do is to uninstall and install it again. The latest version will automatically be downloaded when installing from the beginning.


# Related Links
- Forums might have extra information over documents
  - https://forum.unity.com/threads/easy-to-use-accelerator-installation-in-docker.992063/
  - https://forum.unity.com/threads/welcome-to-unity-accelerator.742922/
  - https://forum.unity.com/forums/unity-accelerator.392/
- Documents
  - https://docs.unity3d.com/Manual/UnityAccelerator.html
  - https://docs.unity3d.com/Manual/AssetDatabase.html
- Docker Hub
  - https://hub.docker.com/r/unitytechnologies/accelerator
  - https://hub.docker.com/search?q=unity%20accelerator&type=image
