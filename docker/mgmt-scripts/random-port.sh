#!/usr/bin/env bash

NC="\033[0m"
BLUE="\033[0;34m"
RED="\033[1;31m"
MAGENTA="\033[1;35m"
GREEN="\033[1;32m"
CYAN="\033[1;36m"

generate_random_port()
{
    #  ${NC}  ${B_BLUE}  ${B_RED}  ${B_MAGENTA}
    while true; do
        PORT=$(shuf -i 1024-9999 -n 1)
            echo -e "\n\n\t${BLUE}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
            echo -e "\n\n\t\t${GREEN}Random port:${NC}${RED} $PORT${NC}"
            echo -e "\n\n\t${BLUE}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}\n"
            break
    done
}
generate_random_port