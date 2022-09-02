resource "kubernetes_namespace" "create-metabase-namespace" {

    metadata {
        name             = "<namespace-name>"
    }
}
