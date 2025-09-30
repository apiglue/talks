import json
import yaml
from datetime import datetime
import tzlocal


def load_json_from_file(file_path):
    """Load JSON data from a file."""
    try:
        with open(file_path, "r", encoding="utf-8") as file:
            file_content = json.dumps(file.read(), separators=(',', ':'))
            return file_content
    except (FileNotFoundError, json.JSONDecodeError) as e:
        print(f"Error loading JSON from {file_path}: {e}")
        return None
    except Exception as e:
        print(f"Unexpected error loading JSON from {file_path}: {e}")
        return None


def load_yaml_from_file(file_path):
    """Load YAML data from a file."""
    try:
        with open(file_path, "r", encoding="utf-8") as file:
            file_content = yaml.safe_load(file)
            return file_content
    except (FileNotFoundError, yaml.YAMLError) as e:
        print(f"Error loading YAML from {file_path}: {e}")
        return None
    except Exception as e:
        print(f"Unexpected error loading YAML from {file_path}: {e}")
        return None

def save_result_to_file(path, results):
    """ Save results to a file """
    try:
        with open(path, "w", encoding="utf-8") as file:
            file.write(results)
    except FileNotFoundError as e:
        print(f"File not found error saving results to {path}: {e}")    
    except Exception as e:
        print(f"Error saving results to {path}: {e}")
        

def current_time():
    """Get the current time."""
    return datetime.now(tzlocal.get_localzone()).strftime("%H:%M:%S %Z")

def time_format(timestamp):
    total_seconds = int(timestamp.total_seconds())
    minutes = (total_seconds % 3600) // 60
    seconds = total_seconds % 60

    formatted_delta = f"{minutes:02}m {seconds:02}s"

    return formatted_delta

def total_tokens_utilized(message):
    """Calculate the total tokens utilized in a message."""
    total_tokens = 0
    token_key_usage = "token_usage"
    if token_key_usage in message:
        total_tokens = message[token_key_usage]
    return total_tokens