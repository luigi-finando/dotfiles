#!/bin/sh

bat="$(acpi -b | awk '{print $4}' | sed 's/,/ /')"
echo "⚡$bat|"
