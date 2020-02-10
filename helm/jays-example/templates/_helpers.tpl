{{ define "example.common_labels" }}
chart: {{ .Chart.Name | quote }}
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end }}