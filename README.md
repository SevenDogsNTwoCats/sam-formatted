# sam-formatted
A command-line tool for formatting and displaying logs from AWS SAM (Serverless Application Model). This project provides an easy way to run and manage AWS SAM locally, with features for automatic rebuilding and restarting of the local API and formatting Logs.

https://github.com/SevenDogsNTwoCats/sam-formatted/tree/main

https://www.npmjs.com/package/sam-formatted

## Features
- Run AWS SAM CLI in watch mode.
- Automatically rebuild and restart the local API on changes.
- Supports invoking Lambda functions with custom event files.
- Color-coded output for better readability.

## Installation

### Using npm
You can install the project globally using npm:
```
npm install -g sam-formatted
```
You can uninstall the package with
```
npm uninstall -g sam-formatted
```

### Using Homebrew
If you are on macOS, you can install the project using Homebrew:
```
brew tap SevenDogsNTwoCats/sam-formatted
brew install sam-formatted
```

### Using curl
You can also download the script directly using curl:
```
curl -o install.sh https://raw.githubusercontent.com/SevenDogsNTwoCats/sam-formatted/main/scripts/install.sh
chmod +x install.sh
./install.sh
```

You can uninstall with
```
curl -s https://raw.githubusercontent.com/SevenDogsNTwoCats/sam-formatted/main/scripts/uninstall.sh | bash 
```

or deleting the folder
```
sudo rm /usr/local/bin/sam-formatted
```

## Usage
After installation, you can run the script using:
```
sam-formatted [OPTIONS] [AWS_PROFILE]
```

### Options
- `--help`: Display help information.
- `--profile=PROFILE`: Specify the AWS profile to use.
- `--network=NETWORK`: Specify the Docker network to use.
- `--lambda=FUNCTION`: Specify the Lambda function name for invoke mode.
- `--event=FILE`: Specify the event file path for invoke mode.
- `--api`: Run in API mode (default).
- `--invoke`: Run in invoke mode.

## Examples
```
sam-formatted DevGinih
sam-formatted --profile=DevGinih
sam-formatted --invoke --lambda=MyFunction --event=./events/myEvent.json
sam-formatted --network=my_custom_network
```

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.