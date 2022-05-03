kubectl create secret generic application-secret --dry-run=client --from-env-file=./secrets.env -o json > secrets.json
kubeseal --scope cluster-wide -o yaml < secrets.json > application-sealed-secret.yaml

mv application-sealed-secret.yaml ./backend/templates/