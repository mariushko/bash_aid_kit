#!/bin/bash

declare SWAP_DEVICES=$(LANG=C swapon --show=NAME --noheadings)

declare -i mem_total=$(grep '^MemTotal' /proc/meminfo | awk '{print $2}')
declare -i swap_total=$(grep '^SwapTotal' /proc/meminfo | awk '{print $2}')

declare -l mem_total_human=$(_k2h_ ${mem_total})
declare -l swap_total_human=$(_k2h_ ${swap_total})

declare -i before_mem_free=$(grep '^MemFree' /proc/meminfo | awk '{print $2}')
declare -i before_swap_free=$(grep '^SwapFree:' /proc/meminfo | awk '{print $2}')
declare -l before_used_mem_human=$(_k2h_ $(( mem_total - before_mem_free )))
declare -l before_used_swap_human=$(_k2h_ $(( swap_total - before_swap_free )))

echo before:
echo -e "\tused memory: ${C_BWHITE}${before_used_mem_human}${C_RESET}/${mem_total_human}"
echo -e "\tused swap  : ${C_BWHITE}${before_used_swap_human}${C_RESET}/${swap_total_human}"
# Clear PageCache, dentries and inodes...
sudo sync
sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"

[[ ${SWAP_DEVICES} ]] && {
  # swap off...
  sudo swapoff -a || {
    echo swap off: something went wrong
    sudo swapon -a &> /dev/null || :
    exit 1
  }
  # swap on...
  sudo swapon -a &> /dev/null || {
    echo swap on: something went wrong
    exit 1
  }
}
declare -i after_mem_free=$(grep '^MemFree' /proc/meminfo | awk '{print $2}')
declare -i after_swap_free=$(grep '^SwapFree:' /proc/meminfo | awk '{print $2}')
declare -l after_used_mem_human=$(_k2h_ $(( mem_total - after_mem_free )))
declare -l after_used_swap_human=$(_k2h_ $(( swap_total - after_swap_free )))
declare -l recovered_mem_human=$(_k2h_ $(( after_mem_free - before_mem_free )))
declare -l recovered_swap_human=$(_k2h_ $(( after_swap_free - before_swap_free )))
echo after:
echo -e "\tused memory: ${C_BWHITE}${after_used_mem_human}${C_RESET}/${mem_total_human}"
echo -e "\tused swap  : ${C_BWHITE}${after_used_swap_human}${C_RESET}/${swap_total_human}"
echo recovered:
echo -e "\tmemory: ${C_BWHITE}${recovered_mem_human}${C_RESET}"
echo -e "\tswap  : ${C_BWHITE}${recovered_swap_human}${C_RESET}"

exit 0
