#!/bin/bash
set -e
emerge sys-power/acpid
rc-update add acpid default
