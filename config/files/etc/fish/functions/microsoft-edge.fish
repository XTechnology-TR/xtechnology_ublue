function microsoft-edge --wraps='flatpak run com.microsoft.Edge' --description 'alias microsoft-edge=flatpak run com.microsoft.Edge'
  flatpak run com.microsoft.Edge $argv
        
end
