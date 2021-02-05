{{- define "base.container" -}}
- name: {{ .name | default (randAlpha 10) | quote }}
  image: "{{ .image.repository }}:{{ .image.tag }}"
  imagePullPolicy: {{ .image.pullPolicy }}
  args:
    {{- toYaml .args | nindent 4 }}
  volumeMounts:
    {{- toYaml .volumeMounts | nindent 4 }}
  ports:
    {{- toYaml .ports | nindent 4 }}
  resources:
    {{- toYaml .resources | nindent 4 }}
  env:
    {{- toYaml .env | nindent 4 }}
    {{- range .envSecrets }}
    - name: {{ .name }}
      valueFrom:
        secretKeyRef:
          name {{ .secretName }}
          key: {{ .secretKey }}
    {{- end -}}
  {{- if .securityContext }}
    {{- toYaml .securityContext | nindent 2 }}
  {{- end }}
{{- end -}}
