apiVersion: v1
kind: ConfigMap
metadata:
  %{~ for key, value in metadata ~}
  ${key}: ${value}
  %{~ endfor ~}
data:
  %{~ for key, value in data ~}
  ${key}: ${value}
  %{~ endfor ~}