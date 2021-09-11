job "demo" {
  datacenters = ["dc1"]

  group "web" {
    count = 2
    network {
      port "http" {
        to = 80
      }
      port "https" {
        to = 443
      }
    }

    task "nginx" {
      driver = "docker"

      config {
        image = "nginx:alpine"

        ports = ["http", "https"]
      }

      resources {
        cpu = 500
        memory = 256
      }
    }
  }

  group "cache" {
    network {
      port "db" {
        to = 6379
      }
    }

    task "redis" {
      driver = "docker"

      config {
        image = "redis:3.2"

        ports = ["db"]
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
