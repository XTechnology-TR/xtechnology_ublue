function sondegisen --wraps='find . -type f -mtime -90' --description 'alias sondegisen=find . -type f -mtime -90'
  find . -type f -mtime -90 $argv
        
end
