# atlascloud-backup
CLI tool to manage backups for Atlassian cloud instances of Jira and Confluence. Uses the semi-official REST API. Features OpsGenie integration and backup rotation.

This is a dockerized version of https://bitbucket.org/addcraftio/atlascloud-backup.

## Configuration
The backup tool can be configured using env variables:

| Variable                       | Default value | Description                                                                                                         |
|--------------------------------|---------------|---------------------------------------------------------------------------------------------------------------------|
| TZ                             |               | Timezone to use for scheduling backups                                                                              |
| CONFLUENCE                     |               | Subdomain for the Confluence site to backup. If omitted Confluence will not be backed up                            |
| JIRA                           |               | Subdomain for the Jira site to backup. If omitted Jira will not be backed up                                        |
| EMAIL                          |               | The e-mail of the user of the site you used to create the API token                                                 |
| TOKEN                          |               | The API token your created for the given email address                                                              |
| CONFLUENCE_INCLUDE_ATTACHMENTS | false         | True or false, whether to include Confluence attachment files or go data-only                                       |
| JIRA_INCLUDE_ATTACHMENTS       | false         | True or false, whether to include Jira attachment files or go data-only                                             |
| RETAIN_COUNT                   | 7             | Only the {retainCount} newest backups are kept, older ones are deleted.                                             |
| MAX_AGE_HOURS                  | 192           | For status checks: how old in hours is acceptable for the newest backup per site?                                   |
| MAX_SIZE_SHRINK_PERCENT        | 10            | For status checks: how much smaller may the newest backup be than the previous one? (%)                             |
| MAX_WAIT_MINUTES               | 120           | How long do we allow the Atlassian cloud to take when creating backups? (min) Raise this if you have big instances! |
| SLEEP_SECONDS                  | 10            | What is the interval in seconds between checks at the Atlassian cloud if the backup is done? (sec)                  |
| RUN_AT_HOUR                    | 0             | At what hour should the backups run. Uses CRON expression                                                           |
| RUN_AT_MINUTE                  | 0             | At what minute should the backups run. Uses CRON expression                                                         |
| RUN_AT_DAY                     | *             | At what day should the backups run. Uses CRON expression                                                            |

## More information
For more information, see https://bitbucket.org/addcraftio/atlascloud-backup

## Build and push
```bash
docker build -t markdegroot/atlascloud-backup --platform linux/amd64 --platform linux/arm64 --push .
```
