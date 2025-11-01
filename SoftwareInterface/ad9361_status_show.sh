#!/bin/bash

# Define the IP address variable
ip_address="192.168.20.2"

print_section_header() {
	echo ""
    echo "--------------------------------"
    echo "$1"
    echo "--------------------------------"
}

# Info of Tx1
print_section_header "Tx1"
iio_attr -u ip:$ip_address -c ad9361-phy altvoltage1 -o frequency | awk -F': ' '{print "RF frequency is " $NF}'
iio_attr -u ip:$ip_address -c ad9361-phy voltage0 -o hardwaregain | awk -F': ' '{print "hardwaregain is " $NF}'
iio_attr -u ip:$ip_address -c ad9361-phy voltage0 -o rf_bandwidth | awk -F': ' '{print "rf_bandwidth is " $NF}'
iio_attr -u ip:$ip_address -c ad9361-phy voltage0 -o rf_port_select | awk -F': ' '{print "rf_port_select is " $NF (should be A)}'
iio_attr -u ip:$ip_address -c ad9361-phy voltage0 -o sampling_frequency | awk -F': ' '{print "sampling_frequency is " $NF}'
iio_attr -u ip:$ip_address -c ad9361-phy voltage0 -o filter_fir_en | awk -F': ' '{print "filter_fir_en is " $NF}'

# Info of Rx1
print_section_header "Rx1"
iio_attr -u ip:$ip_address -c ad9361-phy altvoltage0 -o frequency | awk -F': ' '{print "RF frequency is " $NF}'
iio_attr -u ip:$ip_address -c ad9361-phy voltage0 -i gain_control_mode | awk -F': ' '{print "gain_control_mode is " $NF}'
iio_attr -u ip:$ip_address -c ad9361-phy voltage0 -i hardwaregain | awk -F': ' '{print "hardwaregain is " $NF}'
iio_attr -u ip:$ip_address -c ad9361-phy voltage0 -i rf_port_select | awk -F': ' '{print "rf_port_select is " $NF (should be A_BALANCED)}'
iio_attr -u ip:$ip_address -c ad9361-phy voltage0 -i quadrature_tracking_en | awk -F': ' '{print "quadrature_tracking_en is " $NF}'
iio_attr -u ip:$ip_address -c ad9361-phy voltage0 -i bb_dc_offset_tracking_en | awk -F': ' '{print "bb_dc_offset_tracking_en is " $NF}'
iio_attr -u ip:$ip_address -c ad9361-phy voltage0 -i rf_dc_offset_tracking_en | awk -F': ' '{print "rf_dc_offset_tracking_en is " $NF}'
iio_attr -u ip:$ip_address -c ad9361-phy voltage0 -i rf_bandwidth | awk -F': ' '{print "rf_bandwidth is " $NF}'
iio_attr -u ip:$ip_address -c ad9361-phy voltage0 -i sampling_frequency | awk -F': ' '{print "sampling_frequency is " $NF}'
iio_attr -u ip:$ip_address -d ad9361-phy filter_fir_config | awk -F': ' '{print "filter_fir_config is " $NF}'
iio_attr -u ip:$ip_address -c ad9361-phy voltage0 -i filter_fir_en | awk -F': ' '{print "filter_fir_en is " $NF}'