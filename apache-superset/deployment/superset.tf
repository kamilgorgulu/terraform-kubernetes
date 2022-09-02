resource "kubernetes_deployment" "create-superset-deployment" {


  metadata {
    name      = "superset"
    namespace = var.namespace
  }

  spec {

    replicas = "0"


    selector {
      match_labels = {
        "workload.user.cattle.io/workloadselector" = var.superset-selector
      }
    }


    template {
      metadata {
        labels = {
          "workload.user.cattle.io/workloadselector" = var.superset-selector
        }
      }

      spec {


        # if node selection is needed
#        affinity {
#          node_affinity {
#
#            required_during_scheduling_ignored_during_execution {
#              node_selector_term {
#                match_expressions {
#                  key      = "<key-name>"
#                  operator = "In"
#                  values = [
#                    "<value-name>",
#                  ]
#                }
#              }
#            }
#          }
#        }

        container {
          args                       = []
          command                    = []
          image                      = "apache/superset:f017f98b88349a1d333509a4ab60eec33f1065db"
          image_pull_policy          = "Always"
          name                       = "superset"
          stdin                      = true
          stdin_once                 = false
          termination_message_path   = "/dev/termination-log"
          termination_message_policy = "File"
          tty                        = true
          port {
            container_port = 8088
          }

          env_from {
            config_map_ref {
              name = "superset-config"
            }
          }
          volume_mount {
            mount_path = "/app/pythonpath/superset_config.py"
            name       = "superset-config-py"
            read_only  = false
            sub_path   = "superset_config.py"
          }



          resources {}

          security_context {
            allow_privilege_escalation = false
            privileged                 = false
            read_only_root_filesystem  = false
            run_as_non_root            = false
          }
        }
        volume {
          name = "superset-config-py"

          config_map {
            default_mode = "0655"
            name         = "superset-config-py"
            optional     = false
          }

        }

      }
    }
  }



  timeouts {}
}
