# CLI Configuration Tool

A Swift command line tool built with Swift Argument Parser that accepts 
test configuration settings via command line flags and saves them as JSON.

## How to Run

```bash
swift run cli-config-tool --timeout 60 --retry-count 3 --environment staging
```

## Available Options

| Option | Description | Default |
|--------|-------------|---------|
| --timeout | Test timeout in seconds | 30 |
| --retry-count | Number of retries on failure | 0 |
| --environment | Test environment (dev/staging/prod) | dev |
| --skip-all | Skip all tests | false |

## Output
Prints configuration to console and saves it as config.json.
