# Дипломный практикум в Yandex.Cloud

## Что сделано

- Terraform: bootstrap (сервисный аккаунт и бакет для state) и main-infra (VPC с подсетями в зонах d и e)
- Managed Kubernetes в Yandex Cloud: кластер создан, ноды не поднялись из-за квоты `RESOURCE_EXHAUSTED` на диски в зонах ru-central1-d и ru-central1-e
- Дальнейшая работа на локальном кластере kind
- Тестовое приложение nginx
- Мониторинг: kube-prometheus-stack (Prometheus, Grafana, Alertmanager)

## Структура

- `bootstrap/` — сервисный аккаунт и бакет для Terraform state
- `main-infra/` — VPC и конфигурация Kubernetes
- `k8s/nginx/` — Deployment и Service тестового приложения
- `k8s/monitoring/values.yaml` — параметры kube-prometheus-stack
- `app/` — Dockerfile и статическая страница

## Доступ

- Приложение: `kubectl port-forward svc/nginx-app 8080:80`, затем http://localhost:8080
- Grafana: `kubectl port-forward -n monitoring svc/kube-prometheus-stack-grafana 3000:80`, затем http://localhost:3000
