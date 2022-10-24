[all]

[masters]
%{ for content_key, content_value in content }
%{~ if length(regexall("master", content_key)) > 0 ~}
${content_value} ansible_user=deployer ansible_private_key_file=/home/ivanopulo/.ssh/deploy
%{ endif ~}
%{~ endfor ~}

[workers]
%{ for content_key, content_value in content }
%{~ if length(regexall("worker", content_key)) > 0 ~}
${content_value} ansible_user=deployer ansible_private_key_file=/home/ivanopulo/.ssh/deploy
%{ endif ~}
%{~ endfor ~}