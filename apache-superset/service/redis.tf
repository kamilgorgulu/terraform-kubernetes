# kubernetes_service.adminer:
resource "kubernetes_service" "create-redis-service" {

    metadata {
        name             = "redis"
        namespace        = var.namespace
    }

    spec {
        selector                          = {
            "workload.user.cattle.io/workloadselector" = var.redis-selector
        }
        session_affinity                  = "None"
        type                              = "ClusterIP"

        port {
            name        = "6379tcp"
            node_port   = 0
            port        = 6379
            protocol    = "TCP"
            target_port = "6379"
        }
    }

    timeouts {}
}