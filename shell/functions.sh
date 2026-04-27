# Useful shell functions

# Create a directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Find a process by name
psg() {
  ps aux | grep "[${1:0:1}]${1:1}"
}

# Quick HTTP server in current directory
serve() {
  local port="${1:-8080}"
  python3 -m http.server "$port"
}

# Extract any archive format
extract() {
  case "$1" in
    *.tar.gz|*.tgz) tar xzf "$1" ;;
    *.tar.bz2)       tar xjf "$1" ;;
    *.tar.xz)        tar xJf "$1" ;;
    *.zip)           unzip "$1" ;;
    *.gz)            gunzip "$1" ;;
    *.rar)           unrar x "$1" ;;
    *)               echo "Unknown format: $1" ;;
  esac
}

# Show top 10 most used shell commands
topcmds() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10
}
