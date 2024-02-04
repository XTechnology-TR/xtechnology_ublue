function kerneldokum --wraps=dmesg\|grep\ -iEw\ \'bad\|bug\|conflict\|corrupt\|error\|fail\|failed\|fault\|fatal\|invalid\|Lock\|NULL\|segfault\|stack\|trace\|warn\' --description alias\ kerneldokum=dmesg\|grep\ -iEw\ \'bad\|bug\|conflict\|corrupt\|error\|fail\|failed\|fault\|fatal\|invalid\|Lock\|NULL\|segfault\|stack\|trace\|warn\'
  dmesg|grep -iEw 'bad|bug|conflict|corrupt|error|fail|failed|fault|fatal|invalid|Lock|NULL|segfault|stack|trace|warn' $argv
        
end
