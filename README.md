```bash
nomad agent -dev -bind 0.0.0.0 -log-level INFO
```

```bash
# nomad job init
nomad job init -short demo.nomad # -short remove comentários
```

```bash
nomad job status demo
```

Allocations
ID|Node|ID|Task|Group|Version|Desired|Status|Created|Modified
5d6cacd5|a3104b21|web|1|run|running|4m36s|ago|4m24s|ago
a0898713|a3104b21|cache|1|run|running|9m55s|ago|4m26s|ago

```bash
nomad alloc status 5d6cacd5
```

Allocation Addresses
Label|Dynamic|Address
*http|yes|127.0.0.1:21135->80
*https|yes|127.0.0.1:26856->443


```bash
curl localhost:21135
```

# Scale Nginx
```
...
+ count = 2
...
```

```bash
nomad job plan demo.nomad
```

```
+/- Job: "demo"
    Task Group: "cache" (1 in-place update)
          Task: "redis"

+/- Task Group: "web" (1 create, 1 in-place update)
 +/- Count: "1" => "2" (forces create)
     Task: "nginx"
```

```bash
nomad job run demo.nomad
```
