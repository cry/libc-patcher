#!/bin/bash

die() {
  echo >&2 $1
  exit 1
}

# ===== Ubuntu ===== #

log_url() {
  local url="$1"

  echo $url
}

get_current_ubuntu() {
  local version=$1
  local arch=$2
  local pkg=$3
  local info=ubuntu-$version-$arch-$pkg
  local url=`(wget http://packages.ubuntu.com/$version/$arch/$pkg/download -O - 2>/dev/null \
               | grep -oh 'http://[^"]*libc6[^"]*.deb') || die "Failed to get package version"`
  log_url $url
}

get_all_ubuntu() {
  local info=$1
  local url=$2
  for f in `wget $url/ -O - 2>/dev/null | egrep -oh 'libc6(-i386|-amd64)?_[^"]*(amd64|i386)\.deb' |grep -v "</a>"`; do
    log_url $url/$f
  done
}
