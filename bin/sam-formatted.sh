#!/bin/bash
# @author Alhanis Espinal
# @date 2025-06-27
# @description This script runs the AWS SAM CLI in watch mode, automatically rebuilding and restarting the local API whenever changes are detected.

# Function to display help information
show_help() {
  echo -e "\x1b[36m===== SAM Local Development Script Help =====\x1b[0m"
  echo -e "Usage: ./run-sam-formatted.sh [OPTIONS] [AWS_PROFILE]"
  echo -e ""
  echo -e "Options:"
  echo -e "  --help                 Display this help message"
  echo -e "  --profile=PROFILE      AWS profile to use (can also be specified as first argument)"
  echo -e "  --network=NETWORK      Docker network to use (default: aws_local_services_default)"
  echo -e "  --lambda=FUNCTION      Lambda function name for invoke mode (default: RecordTransformation)"
  echo -e "  --event=FILE           Event file path for invoke mode (default: ./events/transformationData.json)"
  echo -e "  --api                  Run in API mode (default)"
  echo -e "  --invoke               Run in invoke mode"
  echo -e "  --api-command=CMD      Custom command for API mode"
  echo -e "  --invoke-command=CMD   Custom command for invoke mode"
  echo -e ""
  echo -e "Examples:"
  echo -e "  ./run-sam-formatted.sh DevGinih                    # Run with DevGinih profile"
  echo -e "  ./run-sam-formatted.sh --profile=DevGinih          # Same as above"
  echo -e "  ./run-sam-formatted.sh --invoke --lambda=MyFunction --event=./events/myEvent.json    # Run invoke mode with specific function"
  echo -e "  ./run-sam-formatted.sh --network=my_custom_network # Use custom Docker network"
  echo -e "  ./run-sam-formatted.sh --network=my_custom_network # Use custom Docker network"
  echo -e "\x1b[36m============================================\x1b[0m"
  exit 0
}

# Default values
AWS_PROFILE_TO_USE="default"
LOCAL_NETWORK_NAME="aws_local_services_default"
AWS_LAMBDA_NAME="lambda_function" # Default Lambda function name
AWS_EVENT_FILE="./events/event.json"
MODE="api" # Default mode is API

# Process command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --help)
      show_help
      ;;
    --profile=*)
      AWS_PROFILE_TO_USE="${1#*=}"
      shift
      ;;
    --network=*)
      LOCAL_NETWORK_NAME="${1#*=}"
      shift
      ;;
    --lambda=*)
      AWS_LAMBDA_NAME="${1#*=}"
      shift
      ;;
    --event=*)
      AWS_EVENT_FILE="${1#*=}"
      shift
      ;;
    --api)
      MODE="api"
      shift
      ;;
    --invoke)
      MODE="invoke"
      shift
      ;;
    --api-command=*)
      CUSTOM_API_COMMAND="${1#*=}"
      shift
      ;;
    --invoke-command=*)
      CUSTOM_INVOKE_COMMAND="${1#*=}"
      shift
      ;;
    *)
      # If no flag is specified, assume it's the profile
      if [[ -z "$EXPLICIT_PROFILE" ]]; then
        AWS_PROFILE_TO_USE="$1"
        EXPLICIT_PROFILE=true
      fi
      shift
      ;;
  esac
done

# Set commands based on parameters
API_COMMAND=${CUSTOM_API_COMMAND:-"sam build && sam local start-api --docker-network $LOCAL_NETWORK_NAME"}
INVOKE_COMMAND=${CUSTOM_INVOKE_COMMAND:-"sam build && sam local invoke $AWS_LAMBDA_NAME --event $AWS_EVENT_FILE --docker-network $LOCAL_NETWORK_NAME"}

# Display configuration
echo -e "\x1b[36m===== SAM Local Development Configuration =====\x1b[0m"
echo -e "AWS Profile: \x1b[32m$AWS_PROFILE_TO_USE\x1b[0m"
echo -e "Docker Network: \x1b[32m$LOCAL_NETWORK_NAME\x1b[0m"
echo -e "Mode: \x1b[32m$MODE\x1b[0m"

if [[ "$MODE" == "invoke" ]]; then
  echo -e "Lambda Function: \x1b[32m$AWS_LAMBDA_NAME\x1b[0m"
  echo -e "Event File: \x1b[32m$AWS_EVENT_FILE\x1b[0m"
  echo -e "Command: \x1b[33m$INVOKE_COMMAND\x1b[0m"
else
  echo -e "Command: \x1b[33m$API_COMMAND\x1b[0m"
fi
echo -e "\x1b[36m============================================\x1b[0m\n"

# Format output function
format_output() {
    count=0
    while IFS= read -r line; do
        # Increment the line count
        count=$((count + 1))
        
        # Color entire line based on keywords
        if [[ "$line" =~ DEBUG ]]; then
            # Yellow for DEBUG
            echo -e "\x1b[33m$line\x1b[0m"
        elif [[ "$line" =~ ERROR ]]; then
            # Red for ERROR
            echo -e "\x1b[31m$line\x1b[0m"
        elif [[ "$line" =~ INFO ]]; then
            # Blue for INFO
            echo -e "\x1b[34m$line\x1b[0m"
        # add other color lines if you need
        else
            # Normal color for other lines
            echo "$line"
        fi
        
        # Intentar detectar y formatear JSON
        if [[ "$line" =~ [{].*[}] ]] || [[ "$line" =~ [[].*[]] ]]; then
            # Extraer JSON usando grep
            json_part=$(echo "$line" | grep -o '{.*}' || echo "$line" | grep -o '\[.*\]')
            
            # Verificar si es JSON válido
            if [[ -n "$json_part" ]] && echo "$json_part" | jq -e . >/dev/null 2>&1; then
                # Mostrar versión formateada con identificación clara
                echo "$json_part" | jq -C .
            fi
        fi
    done
}

# Execute the command with nodemon and format the output
if [[ "$MODE" == "invoke" ]]; then
  AWS_PROFILE=$AWS_PROFILE_TO_USE nodemon --watch . --ext 'ts,js,json,yaml' \
    --exec "$INVOKE_COMMAND" 2>&1 | format_output
else
  AWS_PROFILE=$AWS_PROFILE_TO_USE nodemon --watch . --ext 'ts,js,json,yaml' \
    --exec "$API_COMMAND" 2>&1 | format_output
fi