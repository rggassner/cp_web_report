#!/bin/bash

# === Configurable variables ===
BASE_DIR="/home/checkpoint/cp_web_report"
OUTPUT_BASE="/var/www/html/report"
API_SERVER="1.1.5.1"
API_USER="user"
API_PASS="password"

# === Derived variables ===
MDS_FWDIR="$BASE_DIR"
DATE_TAG=$(date +%Y%m%d)
OUTPUT_DIR="$OUTPUT_BASE/$DATE_TAG"

# === Environment setup ===
cd "$BASE_DIR" || exit 1
export MDS_FWDIR
export PATH="$PATH:$MDS_FWDIR/scripts:$MDS_FWDIR/api/samples/lib"

# === Main loop ===
for cma in "$BASE_DIR"/cptapi_get_domains/cptapi_get_domains.py; do
    for domain in $("$cma"); do
        echo "Working on $domain"

        CMA_OUT="$OUTPUT_DIR/$domain"
        mkdir -p "$CMA_OUT"

        web_api_show_package.sh \
            -m "$API_SERVER" \
            -d "$domain" \
            -o "$CMA_OUT" \
            -u "$API_USER" \
            -p "$API_PASS"

        tar xvfzp "$CMA_OUT"/*.tar.gz -C "$CMA_OUT"/
        rm -f "$CMA_OUT"/*.tar.gz
    done
done
