for device in $(cat vendor/aokp/aokp.devices)
do
add_lunch_combo aokp_$device-userdebug
done
