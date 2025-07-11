{{- define "generic-app.name" -}}
{{- default "%s" .Values.project | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "generic-app.fullname" -}}
  {{- $globalScope := index . 0 }}
  {{- $componentName := index . 1 }}
  {{- if contains $componentName $globalScope.Values.project -}}
    {{- printf "%s-%s" $globalScope.Values.project $globalScope.Release.Name | trunc 63 | trimSuffix "-" -}}
  {{- else -}}
    {{- printf "%s-%s-%s" $globalScope.Values.project $componentName $globalScope.Release.Name | trunc 63 | trimSuffix "-" -}}
  {{- end -}}
{{- end -}}


{{- define "generic-app.labels" -}}
app.kubernetes.io/name: {{ include "generic-app.name" $ | quote }}
helm.sh/chart: {{ printf "%s-%s" "generic-app" .Chart.Version | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/part-of: {{ .Release.Name | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- end -}}