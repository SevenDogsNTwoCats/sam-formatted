# Usage Instructions for SAM Formatted Script

## Overview
The SAM Formatted script is designed to streamline the development process with AWS SAM (Serverless Application Model). It automatically rebuilds and restarts your local API whenever changes are detected, making it easier to develop and test serverless applications.

## Running the Script
To run the SAM Formatted script, use the following command in your terminal:

```bash
./sam-formatted.sh [OPTIONS] [AWS_PROFILE]
```

### Options
- `--help`: Display help information.
- `--profile=PROFILE`: Specify the AWS profile to use (can also be provided as the first argument).
- `--network=NETWORK`: Define the Docker network to use (default: `aws_local_services_default`).
- `--lambda=FUNCTION`: Set the Lambda function name for invoke mode (default: `RecordTransformation`).
- `--event=FILE`: Provide the event file path for invoke mode (default: `./events/transformationData.json`).
- `--api`: Run in API mode (default).
- `--invoke`: Run in invoke mode.
- `--api-command=CMD`: Specify a custom command for API mode.
- `--invoke-command=CMD`: Specify a custom command for invoke mode.

## Examples
1. **Run with a specific AWS profile:**
   ```bash
   ./sam-formatted.sh DevGinih
   ```

2. **Use a custom Docker network:**
   ```bash
   ./sam-formatted.sh --network=my_custom_network
   ```

3. **Invoke a specific Lambda function with an event file:**
   ```bash
   ./sam-formatted.sh --invoke --lambda=MyFunction --event=./events/myEvent.json
   ```

4. **Display help information:**
   ```bash
   ./sam-formatted.sh --help
   ```

## Conclusion
The SAM Formatted script simplifies the development workflow for AWS SAM applications. By utilizing the various options available, you can customize your development environment to suit your needs. For further assistance, refer to the installation instructions or the help command.