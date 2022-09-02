# kubernetes_service.adminer:
resource "kubernetes_service" "create-metabase-servives" {

    metadata {
        name             = "metabase"
        namespace        = var.namespace
    }

    spec {
        selector                          = {
            "workload.user.cattle.io/workloadselector" = var.selector
        }
        session_affinity                  = "None"
        type                              = "ClusterIP"

        port {
            name        = "3000tcp"
            node_port   = 0
            port        = 3000
            protocol    = "TCP"
            target_port = "3000"
        }
    }

    timeouts {}
}