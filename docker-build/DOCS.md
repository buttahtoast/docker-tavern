Write your plugin documentation here.

The following parameters are used to configuration the plugin's behavior:

* **url** - The URL to POST the webhook to.

The following is a sample docker-build configuration in your 
.drone.yml file:

```yaml
notify:
  docker-build:
    image: buttahtoast/docker-build
    url: http://mockbin.org/
```
