kubectl create secret generic application-secret --dry-run=client --from-env-file=./secrets.env -o json > secrets.json
kubeseal --controller-name sealed-secrets --controller-namespace default --scope cluster-wide -o yaml < secrets.json > application-sealed-secret.yaml

kubectl create secret generic route53-secrets --dry-run=client --from-env-file=./route53-secrets.env -n cert-manager -o json > route53-secrets.json
kubeseal --controller-name sealed-secrets --controller-namespace default --scope cluster-wide -o yaml < route53-secrets.json > route53-secrets.yaml

mv application-sealed-secret.yaml route53-secrets.yaml ./backend/templates/
