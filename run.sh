chmod +x run.sh

#-----------

#ARGUMENTS
URL_FILE="$1"
DOWNLOAD_DIR="$2"
ARCHIVES_DIR="$3"

# VARIABLES
DATE=$(date +"%Y-%m-%dT%H:%M:%S.%3N%z")
PATH_TO_FILE=$(realpath "$0")
TMP_DIR="$(pwd)/tmp"
HEADERS_FILE="$2/headers.txt"
ARCHIVE_NAME="D$(date +"%Y-%m-%dT%H-%M-%S").tar.gz"

# COLORS
BLUE_UNDERLINE="\033[34;4m"
GREEN="\033[32m"
RESET="\033[0m"

#-----------


#-----------

# FUNCTIONS
download_url() {
    for URL in $(cat "$URL_FILE" | tr -d '\r'); do
        FILE_NAME=$(basename "$URL")
        echo -e "> Downloading '${BLUE_UNDERLINE}${URL}${RESET}'…"
        curl -s -k -L -D "${TMP_DIR}/${FILE_NAME}.headers" -o "${TMP_DIR}/${FILE_NAME}" "$URL"
        if [[ -s "${TMP_DIR}/${FILE_NAME}" ]]; then
            echo -e "  ${GREEN}Done${RESET}"
        else
            echo -e "  Download failed for ${URL}${RESET}"
        fi
    done
}

copy_json() {
   cp "$TMP_DIR"/*.json "$DOWNLOAD_DIR"/
   cp "$TMP_DIR"/*.headers "$DOWNLOAD_DIR"/
   echo -e "${GREEN}Done${RESET}"
}

headers_compile() {
   > "$HEADERS_FILE"
   for header in "$DOWNLOAD_DIR"/*.headers; do
      echo "### $(basename "$header"):" >> "$HEADERS_FILE"
      cat "$header" >> "$HEADERS_FILE"
      echo "" >> "$HEADERS_FILE"
   done
   echo -e "  ${GREEN}Done${RESET}"
}

compressing_files() {
   GZIP=-9 tar -czf "$ARCHIVES_DIR/$ARCHIVE_NAME" -C "$DOWNLOAD_DIR" .
   echo -e "${GREEN}Done${RESET} (archive file name: $ARCHIVE_NAME)"
}

#-----------

# SCRIPT EXECUTION
echo "> Bash script starting at: $DATE"
echo "> Script full path: '$PATH_TO_FILE'"
mkdir -p "$TMP_DIR"
echo "> $TMP_DIR file created"
download_url
echo "> Copying JSON files from '$TMP_DIR' to '$2'…"
mkdir -p "$2"
copy_json
echo "> Compiling HTTP response headers from '$TMP_DIR' to '$2'…"
headers_compile
echo "> Compressing all files in '$2' to '$3'…"
mkdir -p "$3"
compressing_files
echo "> Bash script ending at: $DATE"
echo "> Bye!"
