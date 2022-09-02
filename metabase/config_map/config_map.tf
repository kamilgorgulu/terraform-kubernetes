
resource "kubernetes_config_map" "metabase-conf" {
  metadata {
    name      = "metabase-conf"
    namespace = var.namespace
  }

  data = {
    MB_DB_DBNAME = var.MB_DB_DBNAME
    MB_DB_HOST   = var.MB_DB_HOST
    MB_DB_PASS   = var.MB_DB_PASS
    MB_DB_PORT   = "5432"
    MB_DB_TYPE   = "postgres"
    MB_DB_USER   = var.MB_DB_USER
  }
}