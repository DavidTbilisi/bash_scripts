#!/usr/bin/bash
usage()
{
    echo "usage: <command> options:<d|i|f>"
    echo "./bootable.sh -d shows information about disks and iso files"
    echo "./bootable.sh -i some.iso -f flashdrive_name <- that gives you command to run in terminal"
    
}
# data definition
while getopts "di:f:" arg; do
  case $arg in
    d)

    # grep "usb" ?
    echo
    echo "Drive:"
      lsblk | grep -v '^loop'
    echo "___________________________________________"
    echo
    echo "ISO files list below:"
    echo "___________________________________________"
      find ~/Downloads -type f -iname "*.iso"
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


# sudo dd bs=1M if=/home/$USER/Downloads/$iso of=/dev/$flashdrive status=progress oflag=sync
if [ $OPTIND -eq 2 ]; then exit 0; fi
if [ $OPTIND -eq 1 ]; then usage; exit 0; fi
echo "sudo dd bs=1M if=/home/$USER/Downloads/$iso of=/dev/${flashdrive} status=progress conv=noerror oflag=sync"

exit 0;
