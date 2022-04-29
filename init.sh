terraform init \
    -backend-config="address=https://git.os3.coe.com.com/api/v4/projects/27/terraform/state/dev" \
    -backend-config="lock_address=https://git.os3.coe.com/api/v4/projects/27/terraform/state/dev/lock" \
    -backend-config="unlock_address=https://git.os3.coe.com/api/v4/projects/27/terraform/state/dev/lock" \
    -backend-config="username=ankita" \
    -backend-config="password=RUT25jUvr8-4Nhmhq2WV" \
    -backend-config="lock_method=POST" \
    -backend-config="unlock_method=DELETE" \
    -backend-config="retry_wait_min=5"
