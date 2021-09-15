{{/*
Expand the name of the chart.
*/}}
{{- define "waypoint.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "waypoint.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "waypoint.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "waypoint.labels" -}}
helm.sh/chart: {{ include "waypoint.chart" . }}
{{ include "waypoint.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "waypoint.selectorLabels" -}}
app.kubernetes.io/name: {{ include "waypoint.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "waypoint.serviceAccount.name" -}}
{{- if .Values.server.serviceAccount.create -}}
    {{ default (include "waypoint.fullname" .) .Values.server.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.server.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Sets extra service account annotations
*/}}
{{- define "waypoint.serviceAccount.annotations" -}}
  {{- if .Values.server.serviceAccount.annotations }}
  annotations:
    {{- $tp := typeOf .Values.server.serviceAccount.annotations }}
    {{- if eq $tp "string" }}
      {{- tpl .Values.server.serviceAccount.annotations . | nindent 4 }}
    {{- else }}
      {{- toYaml .Values.server.serviceAccount.annotations | nindent 4 }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/*
Sets extra pod annotations
*/}}
{{- define "waypoint.annotations" -}}
  {{- if .Values.server.annotations }}
      annotations:
        {{- $tp := typeOf .Values.server.annotations }}
        {{- if eq $tp "string" }}
          {{- tpl .Values.server.annotations . | nindent 8 }}
        {{- else }}
          {{- toYaml .Values.server.annotations | nindent 8 }}
        {{- end }}
  {{- end }}
{{- end -}}

{{/*
Sets extra statefulset annotations
*/}}
{{- define "waypoint.statefulSet.annotations" -}}
  {{- if .Values.server.statefulSet.annotations }}
  annotations:
    {{- $tp := typeOf .Values.server.statefulSet.annotations }}
    {{- if eq $tp "string" }}
      {{- tpl .Values.server.statefulSet.annotations . | nindent 4 }}
    {{- else }}
      {{- toYaml .Values.server.statefulSet.annotations | nindent 4 }}
    {{- end }}
  {{- end }}
{{- end -}}
