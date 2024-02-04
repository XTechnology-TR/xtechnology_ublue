# Navigasyon
function ..
    cd ..
end
function ...
    cd ../..
end
function ....
    cd ../../..
end
function .....
    cd ../../../..
end

# Araçlar
function grep
    command grep --color=auto $argv
end

#  *`rmm` komutu dizinleri kaldırmak için, ancak nazikçe sorun
alias rmm='rm -rvI'

#  *`cpp` komutu dizinleri kopyalamak için, ancak nazikçe sorun
alias cpp='cp -R'

alias chmox='chmod +x'

alias nerde=which # bazen unutuyorum

# yazım hataları ve kısaltmalar
abbr g git
abbr gi git
abbr gti git
abbr yearn yarn
abbr v vim
abbr bwre brew
abbr brwe brew

alias push="git push"

# `g co` vb. `abbr` ile alt komut genişletme.
function subcommand_abbr
    set -l cmd "$argv[1]"
    set -l short "$argv[2]"
    set -l long "$argv[3]"

    # Değerlendirme yapacağımız için bu dizelerin güvenli olup olmadığını kontrol edin. 👺
    if not string match --regex --quiet '^[a-z]*$' "$short"
        or not string match --regex --quiet '^[a-z- ]*$' "$long"
        echo "Scary unsupported alias or expansion $short $long"
        exit 1
    end

    set -l abbr_temp_fn_name (string join "_" "abbr" "$cmd" "$short")
    # Herhangi bir yerde komut satırı -tokenize + abbr --position aracılığıyla arg genişletme alt komutu

    set -l abbr_temp_fn "function $abbr_temp_fn_name
    set --local tokens (commandline --tokenize)
    if test \$tokens[1] = \"$cmd\"
      echo $long
    else
      echo $short
    end; 
  end; 
  abbr --add $short --position anywhere --function $abbr_temp_fn_name"
    eval "$abbr_temp_fn"
end

subcommand_abbr git c "commit -am"
subcommand_abbr git tc "commit -am"
subcommand_abbr git cm "commit --no-all -m"
subcommand_abbr git co checkout
subcommand_abbr git c "commit -am"
subcommand_abbr git s status
subcommand_abbr git ts status
subcommand_abbr git amend "commit --amend --all --no-edit"
subcommand_abbr git hreset "reset --hard"
subcommand_abbr git cp cherry-pick
subcommand_abbr git cherrypick cherry-pick
subcommand_abbr git dif diff

# git takma adlarımdan bazıları
subcommand_abbr git db diffbranch
subcommand_abbr git dbt diffbranch-that

# Lucas'ın düzenini benimsemediğim sürece bunlardan yalnızca birini yapabilirim.
subcommand_abbr npm i install
#subcommand_abbr pnpm i "install"



# Linuxu hizlandiriver gari.

alias hizLan='sudo pstate-frequency -S -n 70 -m +50 -t on -g performance'

#  *'Mkdir'i çağırırken yolda eksik dizinler oluştur
alias mkdir='mkdir -pv'


# AG varsayılanları. terminal kadar genişleyin (satır numaraları için bir miktar boşluk eksi)
# eskiden `--takip et --gizli'yi seviyordum ama artık sevmiyorum. -follow, bozuk sembolik bağlantılarda çok sayıda fstat hatasıyla sonuçlanır. ve --hidden açıkça açılması gereken bir şeydir.
alias ag='command ag -W (math $COLUMNS - 14)'


# *`add-to-path` Geçerli dizini yola ekleme komutu
alias add-to-path='set -U fish_user_paths (pwd) $fish_user_paths'

function addpaths
    contains -- $argv $fish_user_paths
       or set -U fish_user_paths $fish_user_paths $argv
    echo "Updated PATH: $PATH"
end

function removepath
    if set -l index (contains -i $argv[1] $PATH)
        set --erase --universal fish_user_paths[$index]
        echo "Updated PATH: $PATH"
    else
        echo "$argv[1] not found in PATH: $PATH"
    end
end



#  * 'Df', 'du', 'free' için insanlar tarafından okunabilen boyutlar (ör. Mb, Gb vb.)
alias df='df -h'
alias du='du -ch'
alias free='free -m'

# Mausu Resetle
alias resetmouse='printf '"'"'\e[?1000l'"'"


# Ağ oluşturma. IP adresi, kazma, DNS
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"

# *Fiziksel sürücülerdeki boş alanı göstermek için `fs` komutu
alias fs='df -h -x squashfs -x tmpfs -x devtmpfs'

# *Diskleri listelemek için `disks` komutu
# -Hangi disklerin geçici olarak takıldığını açıkça gösterir
# -Sistem bölümünü geçersiz kılmayacağından %100 emin olmak için bu komutu her zaman `dd` sd kartından önce çalıştırırım

alias disks='lsblk -o HOTPLUG,NAME,SIZE,MODEL,TYPE | awk "NR == 1 || /disk/"'

# *Bölümleri listelemek için `partitions' komutu

alias partitions='lsblk -o HOTPLUG,NAME,LABEL,MOUNTPOINT,SIZE,MODEL,PARTLABEL,TYPE,UUID | grep -v loop | cut -c1-$COLUMNS'

# *dosya veya dizinin boyutunu göstermek için `sizeof` komutu
alias sizeof="du -hs"

# `.DS_Store` dosyalarını yinelemeli olarak silin
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# *Bir sonraki yeniden başlatmaya kadar ekranın kilitlenmesini önlemek için "blok kilitleme" komutu
alias blokkitle='killall xautolock; xset s off; xset -dpms; echo ok'

# *`wget` dosyayı belirtilen adla kaydetmek için

alias wget='wget --content-disposition'

#  * `ortam değişkenini ayarlamak için ayarlanmamış
alias unset 'set --erase'

function ll --description "Ekrana sığabilecek daha fazla dosya varsa ll'ye kaydırın"
    ls -l $argv --color=always | less -R -X -F
end

function mkcd --description "Oluşturun ve dizine cd ekleyin"
    mkdir $argv
    and cd $argv
end

function amount --description "Arşivi bağla"
    /usr/lib/gvfs/gvfsd-archive file=$argv 2>/dev/null &
    sleep 1
    cd '$XDG_RUNTIME_DIR/gvfs'
    cd (ls -p | grep / | tail -1) # cd last created dir
end

function aumount --description "Takılan tüm arşivin (ve gvfs lo'nun) bağlantısını kesincations)"
    gvfs-mount --unmount '$XDG_RUNTIME_DIR/gvfs/*'
end

# Borulama için kullanışlıdır, yani `cat ~/.ssh/id_rsa.pub | kopya' veya 'uuid | kopyala'
# Eğer argüman verilmişse panoya kopyalar
function copy --description "Boruyu veya argümanı kopyala"
    if [ "$argv" = "" ]
        xclip -sel clip
    else
        printf "$argv" | xclip -sel clip
    end
end

function copypath --description "Dosyanın tamamını kopyala path"
    readlink -e $argv | xclip -sel clip
    echo "copied to clipboard"
end

function color --description "Baskı rengi"
    echo (set_color (string trim -c '#' "$argv"))"██"
end

function reset_windows --description "Tüm pencerelerin boyutunu sıfırlayın ve ana monitöre getirin. DE'nin birden fazla monitör yapılandırmasında sorun yaşaması durumunda kullanışlıdır"
    for f in (wmctrl -l | cut -d' ' -f 1)
        wmctrl -i -r $f -e 0,0,0,800,600
        wmctrl -i -a $f
    end
end

function run --description "Dosyayı yürütülebilir hale getirin ve ardından çalıştırınit"
    chmod +x "$argv"
    eval "./$argv"
end

function launch --description "GUI programını başlatın -çıktıyı gizleyin ve terminal kapatıldığında kapatmayın"
    eval "$argv >/dev/null 2>&1 &" & reddet
end

function open --description "Dosyayı yeni süreçte varsayılan uygulamayla aç"
    env XDG_CURRENT_DESKTOP=X-Generic xdg-open $argv >/dev/null 2>&1 & disown
end

function b --description "Bash'ta Exec komutu. Uyumsuz sözdizimine sahip komutları balığa kopyalayıp yapıştırırken kullanışlıdır"
    bash -c "$argv"
end

function c --description "Python kullanarak matematik"
    python -c "print($argv)"
end

alias paylaswifi='qr "WIFI:T:WPA;S:aaa;P:bbb;;"'

# Toolbx kapsayıcısında olup olmadığınızı öğrenme
alias istoolbx='[ -f "/run/.toolboxenv" ] && grep -oP "(?<=name=\")[^\";]+" /run/.containerenv'

