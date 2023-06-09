# wled-save-restore
Backups or restores WLED configuration and presets  
and optionally serves them via http

The `WLED_HOST` needs to be available on the network and reachable
from the local host running wled-save-restore  

## How
wled-save-restore fetches the cfg.json and presets.json from the `http://WLED_HOST/cfg.json` and `http://WLED_HOST/presets.json` endpoints and saves them to a git repository on the local disk

Files are saved to `wled_WLED_HOST_config.json` and `wled_WLED_HOST_presets.json` respectively  

Environment variables can be used to alter the default behaviour, see below for a list

## Usage
```
$ wled-save-restore help

 wled-save-restore

 Usage:

   wled-save-restore help                            Show usage
   wled-save-restore save HOST                       Backup configuration and presets
   wled-save-restore save HOST INTERVAL_MINUTES      Backup configuration and presets\
                                                     every x minutes
   wled-save-restore restore config JSON_FILE HOST   Restore configuration
   wled-save-restore restore presets JSON_FILE HOST  Restore preset

 Environment Variables

   WSR_BACKUP_PATH         The path to save backup files to
   WSR_USE_GIT             Use git as backend
   WSR_GIT_USER            The git user to use
   WSR_GIT_MAIL            The git mail address to use
   WSR_GIT_COMMIT_MSG      The git commit message to use
   WSR_HTTP_SERVE_BACKUPS  Serve backup files
```
### Backup configuration
```
$ wled-save-restore save WLED_HOST
```
### Backup periodically
```
$ wled-save-restore save WLED_HOST INTERVAL_MINUTES
```
### Restore
```
$ wled-save-restore restore config|preset CONFIG_FILE|PRESET_FILE WLED_HOST
```
## Build container
```
$ git clone https://github.com/bbusse/wled-save-restore
$ cd wled-save-restore
$ podman built -t wled-save-restore .
```
## Run container
If you built the container yourself
```
$ podman run -p8088:8088 -it wled-save-restore help
```
Or run a version from the ghcr registry
```
$ podman run -p8088:8088 -it ghcr.io/bbusse/wled-save-restore help
```
## Access files
Use a browser to access the files on http://localhost:8088

## Resources
[WLED](https://kno.wled.ge/)  
[WLED Github](https://github.com/Aircoookie/WLED/)  
[WLED JSON API](https://kno.wled.ge/interfaces/json-api/)  
[matcha](https://github.com/emersion/matcha)
