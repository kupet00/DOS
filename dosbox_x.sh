#!/usr/bin/env bash

### Colors ##
ESC=$(printf '\033') RESET="${ESC}[0m" BLACK="${ESC}[30m" RED="${ESC}[31m"
GREEN="${ESC}[32m" YELLOW="${ESC}[33m" BLUE="${ESC}[34m" MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m" WHITE="${ESC}[37m" DEFAULT="${ESC}[39m"

### Color Functions ##

greenprint() { printf "${GREEN}%s${RESET}\n" "$1"; }
blueprint() { printf "${BLUE}%s${RESET}\n" "$1"; }
redprint() { printf "${RED}%s${RESET}\n" "$1"; }
yellowprint() { printf "${YELLOW}%s${RESET}\n" "$1"; }
magentaprint() { printf "${MAGENTA}%s${RESET}\n" "$1"; }
cyanprint() { printf "${CYAN}%s${RESET}\n" "$1"; }
fn_goodafternoon() { echo; echo "Good afternoon."; }
fn_goodmorning() { echo; echo "Good morning."; }
fn_bye() { echo "Bye bye."; exit 0; }
fn_fail() { echo "Wrong option."; }

sub-submenu() {
    echo -ne "
$(yellowprint 'SUB-SUBMENU')
$(greenprint '1)') GOOD MORNING
$(greenprint '2)') GOOD AFTERNOON
$(blueprint '3)') Go Back to SUBMENU
$(magentaprint '4)') Go Back to MAIN MENU
$(redprint '0)') Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        fn_goodmorning
        sub-submenu
        ;;
    2)
        fn_goodafternoon
        sub-submenu
        ;;
    3)
        submenu
        ;;
    4)
        mainmenu
        ;;
    0)
        fn_bye
        ;;
    *)
        fn_fail
        ;;
    esac
}

princemenu() {
    echo -ne "
$(blueprint 'CMD1 SUBMENU')
$(greenprint '1)') Prince of Persia CGA
$(greenprint '2)') Prince of Persia VGA
$(redprint 'b)') Back to Main Menu
$(redprint '0)') Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        cd confs/
        flatpak run com.dosbox_x.DOSBox-X -conf prince_cga.conf
        ;;
    2)
        cd confs/
        flatpak run com.dosbox_x.DOSBox-X -conf prince.conf
        ;;
    b)
        mainmenu
        ;;
    0)
        fn_bye
        ;;
    *)
        fn_fail
        princemenu
        ;;
    esac
}

mainmenu() {
    echo -ne "
$(magentaprint 'MAIN MENU')
$(greenprint '1)') Prince of Persia
$(redprint '0)') Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        princemenu
        ;;
    0)
        fn_bye
        ;;
    *)
        fn_fail
        mainmenu
        ;;
    esac
}

mainmenu