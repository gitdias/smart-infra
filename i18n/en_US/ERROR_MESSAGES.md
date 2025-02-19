# Error Messages Documentation

## ERROR_NOT_ROOT
**Output**: ERROR_NOT_ROOT  
**Description**: This script must be run as root.  
**Solution**: Run the script using the `sudo` command.  
**------**

## ERROR_TRANSLATION_FILE_MISSING
**Output**: ERROR_TRANSLATION_FILE_MISSING  
**Description**: The translation file for the detected language is missing.  
**Solution**: Ensure that the appropriate `.lang` file (e.g., `pt_BR.lang`, `en_US.lang`, `es_ES.lang`) exists in the same directory as the script. If not, use the default `en_US.lang`.  
**------**

## ERROR_UNSUPPORTED_LANGUAGE
**Output**: ERROR_UNSUPPORTED_LANGUAGE  
**Description**: The detected system language is not supported by the script.  
**Solution**: The script will automatically fall back to English (`en_US.lang`). If you want support for your language, create a new `.lang` file and add it to the script's logic.  
**------**

## ERROR_OS_RELEASE_MISSING
**Output**: ERROR_OS_RELEASE_MISSING  
**Description**: The `/etc/os-release` file is missing, and the script cannot determine the Linux distribution.  
**Solution**: Ensure that the `/etc/os-release` file exists or provide an alternative method to detect the distribution (e.g., `/etc/lsb-release` or `/etc/$distro-release`).  
**------**

## ERROR_DISTRIBUTION_UNKNOWN
**Output**: ERROR_DISTRIBUTION_UNKNOWN  
**Description**: The script could not identify the Linux distribution.  
**Solution**: Check if your distribution is supported by the script. If not, consider adding it to the list of supported distributions in the script.  
**------**

## ERROR_PERMISSION_DENIED
**Output**: ERROR_PERMISSION_DENIED  
**Description**: The script does not have sufficient permissions to read system files.  
**Solution**: Run the script with elevated privileges using `sudo`.  
**------**

## ERROR_INVALID_INPUT
**Output**: ERROR_INVALID_INPUT  
**Description**: Invalid input was provided to the script.  
**Solution**: Ensure that all inputs to the script are valid and follow the expected format.  
**------**

## ERROR_LANG_FILE_EXECUTED
**Output**: ERROR_LANG_FILE_EXECUTED  
**Description**: The `.lang` file was executed directly, causing errors because it contains variable definitions, not commands.  
**Solution**: Do not execute `.lang` files directly. They are meant to be loaded by the main script using the `source` command.  
**------**

## ERROR_LANG_FILE_QUOTES
**Output**: ERROR_LANG_FILE_QUOTES  
**Description**: Missing double quotes around variable values in `.lang` files may cause parsing issues.  
**Solution**: Ensure all variable values in `.lang` files are enclosed in double quotes (`"`).  
**------**