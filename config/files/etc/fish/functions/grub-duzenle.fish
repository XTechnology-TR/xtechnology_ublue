function grub-duzenle --wraps='rpm-ostree kargs --editor' --description 'alias grub-duzenle=rpm-ostree kargs --editor'
  rpm-ostree kargs --editor $argv
        
end
