#!/bin/bash

set -euo pipefail
bash log_rotate.sh >> /var/log/maintenance.log
bash backup.sh >> /var/log/maintenance.log
sleep 10
cat /var/log/maintenance.log
