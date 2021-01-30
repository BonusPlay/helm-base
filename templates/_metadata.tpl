{{- /*
common.metadata creates a standard metadata header.
It creates a 'metadata:' section with name and labels.
*/ -}}

{{- define "base.selectorlabels" -}}
app.kubernetes.io/name: {{ include "base.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{ define "base.metadata" -}}
name: {{ template "base.fullname" . }}
labels:
  {{- include "base.selectorlabels" . | nindent 2 }}
  app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
  app.kubernetes.io/managed-by: {{ .Release.Service }}
  helm.sh/chart: {{ include "base.chart" . }}
{{- end -}}
