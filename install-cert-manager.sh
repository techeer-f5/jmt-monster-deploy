helm repo add jetstack https://charts.jetstack.io
helm install backend \
    --namespace cert-manager \
    --create-namespace \
    --version v1.8.2 \
    --set ingressShim.defaultIssuerKind=ClusterIssuer \
    --set ingressShim.defaultIssuerName=letsencrypt-staging-issuer \
    --set extraArgs='{--dns01-recursive-nameservers-only,--dns01-self-check-nameservers=8.8.8.8:53\,1.1.1.1:53}' \
    --set installCRDs=true jetstack/cert-manager