# 安装 api service
echo "------------------- 安装 api service --------------------"
kubectl apply -f service/demo/deployment.yaml

# 安装jmeter
echo "------------------- 安装 jmeter cluster --------------------"
kubectl apply -f jmeter/deployment.yaml

# 安装 prometheus
echo "------------------- 安装 prometheus --------------------"
# helm install prometheus prometheus-community/prometheus
helm install prometheus -f deployment/values-prometheus.yaml prometheus-community/prometheus

# 安装 influxdb
echo "------------------- 安装 influxdb --------------------"
helm install influxdb bitnami/influxdb

# 安装 grafana
echo "------------------- 安装 grafana --------------------"
helm install grafana bitnami/grafana

echo "Grafana User: admin"
echo "Grafana Password: $(kubectl get secret grafana-admin --namespace default -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 --decode)"

echo "------------------- install  done --------------------"

# .5 grafana
#admin / oAYyqTS368

# 本地  grafana
# admin / x8QIbrWwWQ
# http://127.0.0.1:8080/?orgId=1

# 本地 influxdb 3HRVFCqPAr