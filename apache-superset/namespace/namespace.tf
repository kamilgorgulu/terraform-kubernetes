resource "kubernetes_namespace" "create-superset-ns" {

    metadata {
        name             = var.namespace
    }
}
