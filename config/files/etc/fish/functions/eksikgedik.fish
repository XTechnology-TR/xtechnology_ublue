function eksikgedik --wraps='sudo rpm -Va --nomtime' --description 'alias eksikgedik=sudo rpm -Va --nomtime'
  sudo rpm -Va --nomtime $argv
        
end
