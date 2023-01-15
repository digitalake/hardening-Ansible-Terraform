[all]

[hardening-targets]
%{ for content_key, content_value in content }
%{~ if length(regexall("ansible-worker", content_key)) > 0 ~}
${content_value}
%{ endif ~}
%{~ endfor ~}