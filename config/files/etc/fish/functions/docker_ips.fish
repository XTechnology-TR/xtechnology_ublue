function docker_ips --wraps=docker\ inspect\ -f\ \'\{\{.Name\}\}\ -\ \{\{range\ .NetworkSettings.Networks\}\}\{\{.IPAddress\}\}\{\{end\}\}\'\ \$\(docker\ ps\ -aq\) --description alias\ docker_ips=docker\ inspect\ -f\ \'\{\{.Name\}\}\ -\ \{\{range\ .NetworkSettings.Networks\}\}\{\{.IPAddress\}\}\{\{end\}\}\'\ \$\(docker\ ps\ -aq\)
  docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ($docker ps -aq) $argv
        
end
