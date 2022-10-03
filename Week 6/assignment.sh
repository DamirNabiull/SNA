#!/bin/bash

declare -A MainMenu=([3]="System information" 
                     [2]="OS components" 
                     [1]="exit")
declare -A SytemInfoSubmenu=([4]="Print kernel" 
                             [3]="Print architecture" 
                             [2]="View logged in users" 
                             [1]="exit")
declare -A OSComponentsSubmenu=([4]="Verify EFI" 
                                [3]="List block devices" 
                                [2]="First boot device" 
                                [1]="exit")
IsExit=false

while true;
do
    select TYPE in "${MainMenu[@]}";
    do
        echo
        case $TYPE in
        "System information")
            select ACTION in "${SytemInfoSubmenu[@]}";
            do
                echo
                case $ACTION in
                "Print kernel")
                    echo "$(uname -sr)"
                    break
                    ;;
                "Print architecture")
                    echo "$(uname -m)"
                    break
                    ;;
                "View logged in users")
                    echo "USER | LOGIN@ | WHAT"
                    echo "$(w -h | awk -F " " 'BEGIN {OFS = " | "} {print $1,$4,$8}')"
                    break
                    ;;
                "exit")
                    echo "Exiting script ..."
                    break
                    ;;
                esac
            done
            break
            ;;
        "OS components")
            select ACTION in "${OSComponentsSubmenu[@]}";
            do
                echo
                case $ACTION in
                "Verify EFI")
                    if test -d /sys/firmware/efi ; then 
                        echo "EFI enabled";
                    else 
                        echo "EFI disabled";
                    fi
                    break
                    ;;
                "List block devices")
                    IFS=$'\n'
                    for DEVICE in $(lsblk -d -n -l -o NAME,PTTYPE); do
                        if [[ $DEVICE == *"gpt"* ]]; then
                            IFS=$' '
                            OUTPUTS=($DEVICE)
                            echo "* ${OUTPUTS[0]}"
                        else
                            echo "$DEVICE"
                        fi
                    done
                    break
                    ;;
                "First boot device")
                    NUMBER=$(efibootmgr -v | grep -oP '(?<=BootOrder:\s)(\d+)')
                    REGEXP="(?<=Boot$NUMBER\*\s)(.*)"
                    echo $(efibootmgr | grep -oP $REGEXP)
                    break
                    ;;
                "exit")
                    echo "Exiting script ..."
                    break
                    ;;
                esac
            done
            break
            ;;
        "exit")
            echo "Exiting ..."
            IsExit=true
            break
            ;;
        esac
    done

    echo

    if [ $IsExit = true ] ; then
        break
    fi
done