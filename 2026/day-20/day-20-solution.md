log_analyzer.sh
```
    #!/bin/bash
    #set -euo pipefail
    
    if [ "$#" -eq 0 ]; then
        echo "Argument missing | provide file along with path as an argument"
        exit 1
    fi
    ########## set variables #########
    logfile=$1
    count_er=0
    count_fl=0
    line_no=0
    date1=$(date +"%d%m%H%M%S")
    ######## Clear content of old files #######
    $(>sample_error.log)
    $(>countm)
    $(>critical_report.txt)
    
    echo "$1 is received as an log file | searching for file "
        if [ -f $logfile ]; then
            echo "file found | continue "
        else
            echo "file not found"
            exit 1
        fi
    
    function_findcounts(){
    while IFS= read -r line; do
        if echo "$line" | grep -q "ERROR"; then
            ((count_er++))
           echo $line >> sample_error.log
        elif  echo "$line" | grep -q "FAILED"; then
            ((count_fl++))
        fi
    done < "$logfile" 
    # ==============================================================================
    # REMINDER: Use input redirection (< "$file") instead of piping into a while 
    # loop (cat "$file" | while). Piping runs the loop in a subshell, which causes 
    # counter variables (like count_er++) to reset and be lost outside the loop.
    # ==============================================================================
        echo "Error : $count_er lines" &&  echo "Failed : $count_fl lines"
    }
    function_criticalevents(){
    echo "##### for critical events #####"
    while IFS= read -r line || [ -n "$line" ]; do   ##|| [ -n "$line" ] tells Bash: "Even if read returns an exit code of failure at the end of the file, if $line still contains text, run the loop one last time anyway."
        ((line_no++))
        if echo "$line" | grep -q "CRITICAL"; then
        echo "$line_no and $line"
        fi
    done < "$logfile"
    } >> critical_report.txt
    
    function_countinstance(){
    echo "######################################## printing counts for ERROR types ################"
    grep -oE '\[com\.[^]]+\]' sample_error.log | sort | uniq -c | sort -nr > countm
    cat countm | head -n 5
    } > error_summary.txt
    function_report(){
        # 1. Initialize or clear the file first with a single '>'
        echo "========================================" > log_report_$date1.txt
        echo "date of analysis $(date +"%D")" >> log_report_$date1.txt
        echo "Log file name is $logfile" >> log_report_$date1.txt
        echo "total lines processed $line_no" >> log_report_$date1.txt
        echo "total error count is $count_er" >> log_report_$date1.txt
        echo "----------------------------------------" >> log_report_$date1.txt
        echo "Top 5 error messages with their occurrence count:" >> log_report_$date1.txt
        
        cat error_summary.txt >> log_report_$date1.txt
        
        echo "" >> log_report_$date1.txt
        echo "Critical report details:" >> log_report_$date1.txt
        
        cat critical_report.txt >> log_report_$date1.txt
    }
    
    function_findcounts
    function_criticalevents
    function_countinstance
    function_report
```
----------------------------------------------
output
  <img width="678" height="75" alt="image" src="https://github.com/user-attachments/assets/480c8c75-4c4b-4eec-889e-6841d6d456cb" />

----------------------------------------------
Commands used
  # External Commands / Utilities

| Command | Used for | Example from script |
|---------|----------|----------------------|
| `date` | Generate timestamp for filename & report date | `date +"%d%m%H%M%S"`, `date +"%D"` |
| `grep` | Pattern matching (`-q` quiet check, `-oE` extended regex extract) | `grep -q "ERROR"`, `grep -oE '\[com\.[^]]+\]'` |
| `sort` | Sort lines (plain and numeric-reverse) | `sort`, `sort -nr` |
| `uniq` | Count unique occurrences | `uniq -c` |
| `head` | Take top N lines | `head -n 5` |
| `cat` | Concatenate/read file contents | `cat $logfile`, `cat countm`, `cat critical_report.txt` |
| `read` | Read a line into a variable, looping until EOF (handles last line without trailing newline via `\|\| [ -n "$line" ]`) | `while IFS= read -r line \|\| [ -n "$line" ]` |
| `[ ]` (`test`) | Conditional test — here, checking if no arguments were passed (`$#` = argument count) | `[ "$#" -eq 0 ]` |

----------------------------------------------
# What I Learned From This Code

- **Piping into a `while read` loop creates a subshell** — variables like counters (`line_no++`) updated inside won't persist outside. Always use input redirection (`< file`) instead of `cat file |`.

- **`read` misses the last line if it has no trailing newline** — fixed with `|| [ -n "$line" ]` as a fallback condition in the loop.

- **`grep -q` is great for silent conditional checks** — it returns only an exit code (0/1), no output, ideal for `if` statements.

- **Always validate inputs early** — `[ "$#" -eq 0 ]` catches missing arguments before the script tries to use an empty `$logfile`.

- **Unquoted variables (`$line`, `$logfile`) are risky** — they should be quoted (`"$line"`) to avoid word-splitting or glob expansion issues on special characters.

-------------------------------------------
log report
```
========================================
date of analysis 09/16/26
Log file name is app.log
total lines processed 145
total error count is 27
----------------------------------------
Top 5 error messages with their occurrence count:
######################################## printing counts for ERROR types ################
      9 [com.payment.gateway]
      5 [com.auth.service]
      3 [com.integration.jira]
      3 [com.api.gateway]
      2 [com.db.connector]

Critical report details:
##### for critical events #####
1 and 2026-05-06 17:34:50,743 CRITICAL [com.kernel.oom] Out of memory killer invoked system-wide. Essential system daemon terminated.
5 and 2026-05-06 17:39:35,587 CRITICAL [com.network.vpn] IPSec VPN tunnel termination peer endpoint unresponsive. Site-to-site down.
7 and 2026-05-06 17:10:01,412 CRITICAL [com.system.power] Uninterruptible Power Supply (UPS) running on battery power. Grid failure.
8 and 2026-05-06 17:28:54,788 CRITICAL [com.network.dns] Core DNS resolver cluster failure. Name resolution completely down.
13 and 2026-05-06 17:05:31,112 CRITICAL [com.cache.redis] Redis cluster split-brain condition detected. Data consistency at risk.
16 and 2026-05-06 17:20:36,311 CRITICAL [com.backup.verifier] Daily backup verification failed: Restored archive checksum mismatch.
24 and 2026-05-06 17:00:01,100 CRITICAL [com.db.cluster] Primary database node unresponsive. Initiating emergency failover.
26 and 2026-05-06 17:15:52,567 CRITICAL [com.cluster.orchestrator] Kubernetes API server unreachable. Pod scheduling suspended.
27 and 2026-05-06 17:37:13,165 CRITICAL [com.payment.stripe] Webhook secret signature verification failing for all incoming gateway events.
28 and 2026-05-06 17:49:05,275 CRITICAL [com.db.migration] Database schema version mismatch between application binary and storage layer.
32 and 2026-05-06 17:41:58,009 CRITICAL [com.cluster.etcd] etcd consensus cluster quorum lost (2 of 3 nodes offline).
33 and 2026-05-06 17:21:47,522 CRITICAL [com.metrics.prometheus] Prometheus time-series database disk allocation reached 99.8%.
34 and 2026-05-06 17:19:25,100 CRITICAL [com.security.vault] HashiCorp Vault sealed automatically due to hardware tampering detection.
35 and 2026-05-06 17:52:38,908 CRITICAL [com.auth.service] Authentication service worker pool deadlocked under high concurrency load.
40 and 2026-05-06 17:31:17,110 CRITICAL [com.email.smtp] Outbound relay rejected by major ISP due to suspected IP blacklisting.
44 and 2026-05-06 17:08:52,998 CRITICAL [com.microservice.mesh] Service mesh control plane disconnected from 85% of worker nodes.
50 and 2026-05-06 17:51:27,697 CRITICAL [com.session.redis] Redis session cache eviction policy failed. Out of memory panic.
51 and 2026-05-06 17:11:15,623 CRITICAL [com.db.replication] Replication lag exceeded 3600 seconds on slave instance db-read-04.
53 and 2026-05-06 17:03:18,550 CRITICAL [com.storage.SAN] Fibre channel adapter failure on storage array node 02.
57 and 2026-05-06 17:02:12,430 CRITICAL [com.payment.gateway] Payment processing gateway returned unrecoverable cryptographic error.
60 and 2026-05-06 17:46:42,853 CRITICAL [com.api.router] Upstream service registry missing routes for critical service endpoints.
62 and 2026-05-06 17:12:20,834 CRITICAL [com.firewall.ddos] Massive volumetric DDoS attack (SYN flood) targeting primary web ingress.
64 and 2026-05-06 17:38:24,376 CRITICAL [com.db.deadlock] Cascading database deadlock loop paralyzed transactional processing table 'accounts'.
65 and 2026-05-06 17:27:43,577 CRITICAL [com.db.pool] Connection pool exhausted across all microservice instances simultaneously.
66 and 2026-05-06 17:14:41,356 CRITICAL [com.filesystem.ext4] Critical file system corruption detected on /var/log partition. Remounted read-only.
68 and 2026-05-06 17:24:09,944 CRITICAL [com.hardware.temp] Ambient server room temperature exceeded critical threshold: 45°C.
73 and 2026-05-06 17:26:32,366 CRITICAL [com.container.runtime] Container runtime daemon (containerd) unresponsive. Service crash.
80 and 2026-05-06 17:01:05,210 CRITICAL [com.security.auth] Multiple authentication bypass attempts detected from known botnet IP range.
85 and 2026-05-06 17:40:46,798 CRITICAL [com.security.waf] Web Application Firewall engine panic. Bypassing packet inspection filters.
86 and 2026-05-06 17:55:01,330 CRITICAL [com.system.boot] System watchdog reset triggered. Emergency fallback boot sequence loaded.
87 and 2026-05-06 17:33:39,532 CRITICAL [com.auth.oauth2] OAuth2 token encryption service reporting hardware security module (HSM) timeout.
89 and 2026-05-06 17:47:54,064 CRITICAL [com.security.audit] Audit log shipping daemon failed to connect to SIEM collector. Buffer full.
92 and 2026-05-06 17:07:45,765 CRITICAL [com.auth.jwt] JWT signing private key integrity check failed. Key rotation required.
93 and 2026-05-06 17:53:50,119 CRITICAL [com.metrics.collector] Telemetry collection pipeline dropped over 1,000,000 metrics packets.
95 and 2026-05-06 17:18:14,989 CRITICAL [com.loadbalancer.haproxy] HAProxy backend health check failed for all available pool servers.
98 and 2026-05-06 17:13:30,145 CRITICAL [com.ssl.cert] Wildcard SSL certificate expired 12 hours ago. Secure connections failing.
104 and 2026-05-06 17:36:01,954 CRITICAL [com.service.registry] Consul service catalog consistency verification failed.
112 and 2026-05-06 17:06:40,334 CRITICAL [com.network.bgp] BGP route flap dampening triggered on external peer interface eth1.
113 and 2026-05-06 17:17:03,778 CRITICAL [com.messaging.kafka] Kafka broker partition leader election failure on topic 'order-events'.
120 and 2026-05-06 17:43:09,220 CRITICAL [com.system.hardware] RAM ECC uncorrectable multi-bit memory error detected on DIMM slot 3.
129 and 2026-05-06 17:44:20,431 CRITICAL [com.auth.saml] SAML metadata parser failure. Identity provider public key unreadable.
130 and 2026-05-06 17:50:16,486 CRITICAL [com.network.proxy] Reverse proxy worker processes all terminated due to segment fault.
134 and 2026-05-06 17:32:28,321 CRITICAL [com.storage.ceph] Ceph storage cluster health state degraded to HEALTH_ERR.
139 and 2026-05-06 17:45:31,642 CRITICAL [com.io.nvme] NVMe storage controller fault code 0x82 reported on drive /dev/nvme1n1.
141 and 2026-05-06 17:04:22,890 CRITICAL [com.kernel.security] Kernel lockdown mode activated due to unauthorized module injection attempt.
```

