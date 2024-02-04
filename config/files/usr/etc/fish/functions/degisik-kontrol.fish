function degisik-kontrol --wraps='sudo ostree admin config-diff | sort | grep -v system.control' --description 'alias degisik-kontrol=sudo ostree admin config-diff | sort | grep -v system.control'
  sudo ostree admin config-diff | sort | grep -v system.control $argv
        
end
