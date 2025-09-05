# Data Lifecycle Management

## Automated Data Movement

### Lifecycle Policies
```json
{
  "Rules": [
    {
      "Status": "Enabled",
      "Transitions": [
        {
          "Days": 30,
          "StorageClass": "STANDARD_IA"
        },
        {
          "Days": 90,
          "StorageClass": "GLACIER"
        },
        {
          "Days": 365,
          "StorageClass": "DEEP_ARCHIVE"
        }
      ]
    }
  ]
}
Data Retention Policies

Transactional Data: 7 years (compliance)
Log Data: 90 days (operational)
Backup Data: 30 days (recovery)
Archive Data: 10 years (legal)


Data Lifecycle By: AJ Almohammad, 2025-09-03

