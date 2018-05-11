# Made by Alexandre Hachim, modified from https://stackoverflow.com/questions/18755967/how-to-make-a-program-that-finds-ids-of-xinput-devices-and-sets-xinput-some-set/18756948

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# $SEARCH = first parameter passed to the script when called
SEARCH=$1

# If no device name is passed as parameter to the command then do nothing
if [ "$SEARCH" = "" ]; then
    echo "${RED}No criteria given.\nPlease use the following synthax: ${CYAN}disable-middle-click-paste.sh \"name of the device\"${NC}"
    exit 1
fi

echo "Searching for devices with name containing ${CYAN}${SEARCH}${NC}"

# Store every device that match with $SEARCH in $ids
ids=$(xinput --list | awk -v search="$SEARCH" \
    '$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                 }'\
     )

echo "${GREEN}${#ids[@]} device(s) found.${NC}"

# Disable paste on middle click for each device stored in $ids
for i in $ids
do
    echo " - Disabling paste on middle click for device with id ${i}"
    xinput set-button-map $i 1 0 3
done

echo "${GREEN}Complete!${NC}"
