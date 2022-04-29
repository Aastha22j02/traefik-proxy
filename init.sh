terraform init \
    -backend-config="address=https://git.os3.coe.com.com/api/v4/projects/19/terraform/state/prod" \
    -backend-config="lock_address=https://git.os3.coe.com/api/v4/projects/19/terraform/state/prod/lock" \
    -backend-config="unlock_address=https://git.os3.coe.com/api/v4/projects/19/terraform/state/prod/lock" \
    -backend-config="username=ankita" \
    -backend-config="password=G82Muf8d_dJ4MfZ3-s6F" \
    -backend-config="lock_method=POST" \
    -backend-config="unlock_method=DELETE" \
    -backend-config="retry_wait_min=5"
