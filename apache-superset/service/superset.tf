resource "kubernetes_service" "create-superset-service" {

    metadata {
        name             = "superset"
        namespace        = var.namespace
    }

    spec {
        selector                          = {
            "workload.user.cattle.io/workloadselector" = var.superset-selector
        }
        session_affinity                  = "None"
        type                              = "ClusterIP"

        port {
            name        = "8088tcp"
            node_port   = 0
            port        = 8088
            protocol    = "TCP"
            target_port = "8088"
        }
    }

    timeouts {}
}