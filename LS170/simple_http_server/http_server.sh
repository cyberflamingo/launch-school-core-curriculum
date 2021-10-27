#!/usr/bin/env bash

set -euf -o pipefail

function server () {
  while true
  do
    message_arr=()
    check=true

    while $check
    do
      read -r line
      message_arr+=($line)

      if [[ "${#line}" -eq 1 ]]
      then
        check=false
      fi
    done

    method=${message_arr[0]}
    path=${message_arr[1]}

    if [[ $method = 'GET' ]]
    then

      if [[ -f "./www/$path" ]]
      then
        content_length=$(wc -c < "./www/$path")

        echo -ne "HTTP/1.1 200 OK\r\ncontent-type: text/html; charset=UTF-8\r\ncontent-length: $content_length\r\n\r\n"; cat "./www/$path"
      else
        echo -ne 'HTTP/1.1 404 Not Found\r\ncontent-length: 0\r\n\r\n'
      fi
    else
      echo -e 'HTTP/1.1 400 Bad Request\r\ncontent-length: 0\r\n\r\n'
    fi
  done
}

coproc SERVER_PROCESS { server; }

netcat -lkv 2345 <&"${SERVER_PROCESS[0]}" >&"${SERVER_PROCESS[1]}"
