# Critical battery level (acpi reports it at 5%)
CRITICAL=5

battery_level=`acpi -b | grep -o [0-9]*% | sed s/%//`
if [ ! $battery_level ]
then
   exit
fi
if [ $battery_level -le $CRITICAL ]
then
   if acpi -a | grep 'off-line'
      sudo /usr/sbin/pm-hibernate
   fi
fi
