function reload --wraps='sudo systemctl daemon-reload' --description 'alias reload=sudo systemctl daemon-reload'
  sudo systemctl daemon-reload $argv
        
end
