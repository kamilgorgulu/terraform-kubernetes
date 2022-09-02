resource "kubernetes_deployment" "create-metabase-deployment" {


  metadata {
    name      = "metabase"
    namespace = var.namespace
  }

  spec {

    replicas = "0"


    selector {
      match_labels = {
        "workload.user.cattle.io/workloadselector" = var.selector
      }
    }


    template {
      metadata {
        labels = {
          "workload.user.cattle.io/workloadselector" = var.selector
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
          image                      = "metabase/metabase"
          image_pull_policy          = "Always"
          name                       = "metabase"
          stdin                      = true
          stdin_once                 = false
          termination_message_path   = "/dev/termination-log"
          termination_message_policy = "File"
          tty                        = true
          port {
            container_port = 3000
          }
          env_from {
            config_map_ref {
              name = "metabase-conf"
            }
          }




          resources {}

          security_context {
            allow_privilege_escalation = false
            privileged                 = false
            read_only_root_filesystem  = false
            run_as_non_root            = false
          }
        }

      }
    }
  }



  timeouts {}
}
