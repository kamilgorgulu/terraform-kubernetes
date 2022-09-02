
resource "kubernetes_config_map" "superset-config" {
  metadata {
    name      = "superset-config"
    namespace = var.namespace
  }

  data = {
    CYPRESS_CONFIG="false"
    DATABASE_DB=var.DATABASE_DB
    DATABASE_DIALECT="postgresql"
    DATABASE_HOST=var.DATABASE_HOST
    DATABASE_PASSWORD=var.DATABASE_PASSWORD
    DATABASE_PORT="5432"
    DATABASE_USER=var.DATABASE_USER
    FLASK_ENV="production"
    REDIS_HOST="redis"
    REDIS_PORT="6379"
    SUPERSET_ENV="production"
    SUPERSET_LOAD_EXAMPLES="yes"
    SUPERSET_PORT="8088"
  }
}



resource "kubernetes_config_map" "superset-config-py" {
  metadata {
    name      = "superset-config-py"
    namespace = var.namespace
  }

  data = {
    "superset_config.py" = "${file("${path.module}/configs/superset_config.py")}"
  }
}