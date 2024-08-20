{{- define "common.labels" -}}
app: {{ .Release.Name }}-{{ .Values.commonLabel }}
{{- range $key, $value := .Values.extraLabels }}
{{ $key }}: {{ $value }}
{{- end -}}
{{- end -}}

{{/*
Define a named template for the container spec
*/}}
{{- define "mychart.container" -}}
- name: {{ .Release.Name }}-{{ .Values.deployment.container.name }}
  image: {{ .Values.deployment.container.image }}
  imagePullPolicy: IfNotPresent
  ports:
  - containerPort: {{ .Values.deployment.container.port }}
  resources:
    requests:
      memory: {{ .Values.deployment.container.resources.requests.memory }}
      cpu: {{ .Values.deployment.container.resources.requests.cpu }}
    limits:
      memory: {{ .Values.deployment.container.resources.limits.memory }}
      cpu: {{ .Values.deployment.container.resources.limits.cpu }}
{{- end -}}