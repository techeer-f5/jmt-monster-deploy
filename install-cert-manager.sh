helm repo add jetstack https://charts.jetstack.io
helm install backend \
    --namespace cert-manager \
    --create-namespace \
    --version v1.8.2 \
    --set ingressShim.defaultIssuerKind=ClusterIssuer \
    --set ingressShim.defaultIssuerName=letsencrypt-staging-issuer \
    --set installCRDs=true jetstack/cert-manager