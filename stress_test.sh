#!/bin/bash
# Script for Stress Test
# Camila Lui
# 01-Jul-2015
# Convert to tabled
# tr -s '\t' <input | tr '\t'' ' > output


echo -e "Hour\tMemFree\tCPU%Idle\tLoad Average"

while true
        do
                echo -e $(date | awk '{print $4}'; vmstat| egrep -v 'swap|disk'| awk '{print $5/1024/1024,$22}'; uptime | awk '{print $10,$11,$12}');
                sleep 3
        done

echo "Finished."