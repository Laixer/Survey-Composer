#!/bin/bash

DESTDIR="`pwd`/pki"

cleanup() {
  rm -rf $DESTDIR
  mkdir -p $DESTDIR
}

generate_key() {
  openssl ecparam -genkey -name $1 > $DESTDIR/secret.key
}

generate_req() {
  openssl req -new -sha256 -nodes -key $DESTDIR/secret.key > $DESTDIR/request.csr
}

cleanup
generate_key prime256v1
generate_req

echo ""
echo "Request and secret in $DESTDIR"
echo ""
cat $DESTDIR/request.csr
