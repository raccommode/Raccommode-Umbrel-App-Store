local_ips=$(
  {
    ip -o addr show 2>/dev/null | awk '{print $4}' | cut -d/ -f1
    hostname --all-ip-addresses 2>/dev/null | tr ' ' '\n'
  } | grep -vE '^(127\.|::1$|fe80:)' | grep -v '^$' | sort -u | tr '\n' ',' | sed 's/,$//'
) || local_ips=""
export APP_RACCOMMODE_PAPERCLIP_LOCAL_IPS="${local_ips}"
