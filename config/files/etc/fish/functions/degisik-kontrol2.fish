function degisik-kontrol2 --wraps='sudo diff -yrW200 --suppress-common-lines --color=always /usr/etc /etc 2>/dev/null' --description 'alias degisik-kontrol2=sudo diff -yrW200 --suppress-common-lines --color=always /usr/etc /etc 2>/dev/null'
  sudo diff -yrW200 --suppress-common-lines --color=always /usr/etc /etc 2>/dev/null $argv
        
end
