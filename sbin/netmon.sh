#!/bin/bash

[[ "${SHARED_FILE}" ]] || SHARED_FILE="/dev/shm/prober"
declare PID_FILE="${SHARED_FILE}.pid"
declare PROCID

[[ -f "${PID_FILE}" ]] && PROCID="$(cat ${PID_FILE})"
[[ "${PROCID}" ]] && [[ -d /proc/"${PROCID}"/ ]] && {
  declare SCRIPT_NAME="${0##*/}"
  declare COMM="$(cat /proc/${PROCID}/comm)"
  COMM="${COMM##*/}"
  [[ "${SCRIPT_NAME}" == "${COMM}" ]] && exit 0
}

echo $$ > "${PID_FILE}" || exit 1
[[ -w "${PID_FILE}" ]] && chmod 666 "${PID_FILE}"
> "${SHARED_FILE}" || exit 2
[[ -w "${SHARED_FILE}" ]] && chmod 666 "${SHARED_FILE}"

function _try_it(){
  declare timeout=${1}
  declare -i tries=${2}
  shift 2
  for i in $(seq 1 ${tries})
  do
    timeout ${timeout} ${@} &> /dev/null && return 0
  done
  return 1
}

declare -i INTERFACE_UP=1
declare -i GATEWAY_ONLINE=1
declare -i DNS_ONLINE=1
declare -i GOOGLE_DNS_ONLINE=1
declare ROUTER DNS

while :
do
  echo ${INTERFACE_UP}   \
    ${GATEWAY_ONLINE}    \
    ${DNS_ONLINE}        \
    ${GOOGLE_DNS_ONLINE} \
    > "${SHARED_FILE}"
  sleep 5

  INTERFACE_UP=0
  GATEWAY_ONLINE=0
  DNS_ONLINE=0
  GOOGLE_DNS_ONLINE=0

  ROUTER=$(ip route list | grep "^default via" | head -1 | cut -d' ' -f3)
  [[ ${ROUTER} ]] && INTERFACE_UP=1
  (( INTERFACE_UP == 1 )) || continue

  [[ ${ROUTER} ]] && {
    _try_it 1s 3 ping -c1 ${ROUTER} && GATEWAY_ONLINE=1
  }
  (( GATEWAY_ONLINE == 1 )) || continue

  _try_it 1s 3 getent ahostsv4 gmail.com && DNS_ONLINE=1
  (( DNS_ONLINE == 1 )) || continue

  _try_it 3s 3 ping -c1 8.8.8.8 && GOOGLE_DNS_ONLINE=1
done
