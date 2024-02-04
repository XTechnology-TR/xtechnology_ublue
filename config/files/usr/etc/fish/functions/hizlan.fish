function hizlan --wraps='echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor' --description 'alias hizlan=echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
  echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor $argv
        
end
