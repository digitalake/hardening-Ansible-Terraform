[all]

[type1-pool]
%{ for content_key, content_value in content }
%{~ if length(regexall("ansible-worker1", content_key)) > 0 ~}
${content_value}
%{ endif ~}
%{~ endfor ~}

[type2-pool]
%{ for content_key, content_value in content }
%{~ if length(regexall("ansible-worker2", content_key)) > 0 ~}
${content_value}
%{ endif ~}
%{~ endfor ~}

[type3-pool]
%{ for content_key, content_value in content }
%{~ if length(regexall("ansible-worker3", content_key)) > 0 ~}
${content_value}
%{ endif ~}
%{~ endfor ~}

[iaac:children]
type1-pool
type2-pool
