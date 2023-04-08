# wled-save-restore
Backups or restores WLED configuration and presets

wled-save-restore fetches the cfg.json and presets.json from the `http://WLED_HOST/cfg.json` and `http://WLED_HOST/presets.json` endpoints and saves them to a git repository on the local disk

The `WLED_HOST` needs to be available on the network and reachable
from the local host running wled-save-restore  

Files are saved to `wled_WLED_HOST_config.json` and `wled_WLED_HOST_presets.json` respectively  

Environment variables can be used to alter the default behaviour, see below for a list

## Usage
```
$ wled-save-restore help

 wled-save-restore

 Usage:

   wled-save-restore help                            Show usage
   wled-save-restore save HOST                       Backup configuration and presets
   wled-save-restore save HOST INTERVAL_MINUTES      Backup configuration and presets every x minutes
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
## Build container
```
$ git clone https://github.com/bbusse/wled-save-restore
$ cd wled-save-restore
$ podman built -t wled-save-restore .
```
## Run container
```
$ podman run -p80:2019 -it wled-save-restore
```
### Restore
```
$ wled-save-restore restore config|preset CONFIG_FILE|PRESET_FILE WLED_HOST
```
## Resources
[WLED](https://kno.wled.ge/)  
[WLED Github](https://github.com/Aircoookie/WLED/)  
