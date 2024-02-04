function hatabas --wraps='journalctl -b -0 -k -p err' --description 'alias hatabas=journalctl -b -0 -k -p err'
  journalctl -b -0 -k -p err $argv
        
end
