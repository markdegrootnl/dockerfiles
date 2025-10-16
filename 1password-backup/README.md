# 1password-backup
Docker image to run periodic backups of 1password using the [1Password CLI](https://developer.1password.com/docs/cli).

## Configuration
The backup tool can be configured using env variables:

| Variable                 | Default value | Description                            |
|--------------------------|---------------|----------------------------------------|
| TZ                       |               | Timezone to use for scheduling backups |
| CRONTAB_SCHEDULE         | 00 0 * * *    | CRONTAB expression to run the backup   |
| OP_SERVICE_ACCOUNT_TOKEN |               | 1Password Service Account token        |                                                   |

To generate a Service Account Token, see https://developer.1password.com/docs/service-accounts

Mount a volume on `/output` to store the backup files.

## Build and push
```bash
docker build -t markdegroot/1password-backup:latest -t markdegroot/1password-backup:2.32.0 --build-arg VERSION=2.32.0 --platform linux/amd64 --platform linux/arm64 --push .
```
