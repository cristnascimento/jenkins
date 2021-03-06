# Configure Docker provider and connect to the local Docker socket
provider "docker" {
  host = "tcp://ec2-18-207-215-120.compute-1.amazonaws.com:2375"
}

# Create NGINX container
resource "docker_container" "nginx" {
  image = "${docker_image.nginx.latest}"
  name  = "enginecks"
  ports {
    internal = 80
    external = 80
  }
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}
