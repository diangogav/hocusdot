function exists() {
  command -v $1 > /dev/null 2>&1
}

function zsh-stats() { 
 fc -l 1 | awk '{CMD[$2]++;count++;} END { for (a in CMD)	print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n25; 
}

skip_global_compinit=1