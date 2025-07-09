{{- define "generic-config.resourceName" -}}
{{- $globalScope := index . 0 -}}
{{- $resourceType := index . 1 -}}
{{- $componentName := "" -}}
{{- if gt (len .) 2 -}}
{{- $componentName = index . 2 -}}
{{- end -}}


{{- define "generic-config.labels" -}}
{{- $globalScope := index . 0 }}
{{- $componentName := index . 1 -}}
app.kubernetes.io/name: "{{ include "generic-config.fullname" $globalScope }}-config"
helm.sh/chart: {{ include "generic-config.chart" $globalScope | quote }}
app.kubernetes.io/instance: {{ $globalScope.Release.Name | quote }}
app.kubernetes.io/part-of: "{{ include "generic-config.fullname" $globalScope }}-config"
app.kubernetes.io/managed-by: {{ $globalScope.Release.Service | quote }}
app.kubernetes.io/component: {{ $componentName | quote }}
{{- if $globalScope.Chart.AppVersion }}
app.kubernetes.io/version: {{ $globalScope.Chart.AppVersion | quote }}
{{- end -}}
{{- end -}}