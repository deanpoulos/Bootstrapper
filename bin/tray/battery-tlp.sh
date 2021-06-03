#!/bin/sh

battery=$(sudo -S tlp-stat -b | tac | grep -m 1 "Charge" |  tr -d -c "[:digit:],.")

echo "   $battery %"
