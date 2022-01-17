#!/usr/bin/bash
usage()
{
    echo "usage: <command> options:<d|i|f>"
}

while getopts "di:f:" arg; do
  case $arg in
    d)
    
    # grep "usb" ?
      lsblk -x size 
      ;;
    i)
    # input file = if
      iso=$OPTARG
      ;;
    f)
    # output file = of
      flashdrive=$OPTARG
      ;;
    *)
    	usage
    	exit;;
  esac
done


# sudo dd bs=4M if=/home/$USER/Downloads/$iso of=/dev/$flashdrive status=progress oflag=sync
if [ $OPTIND -eq 2 ]; then exit 0; fi
if [ $OPTIND -eq 1 ]; then usage; exit 0; fi
echo "sudo dd bs=4M if=/home/$USER/Downloads/$iso of=/dev/${flashdrive} status=progress conv=noerror oflag=sync"

exit 0;
