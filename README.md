# libc-patcher

Allows use of i386 libc6 on x86_64 systems when targeting i386 binaries. Downloads appropriate libc & debug symbols, unstrips libc and patches the binary to use the new libraries. Code offsets may be a little off after patching.

## Install

```bash
./init

ln -s $(realpath patch) /usr/local/bin/libc-patch

```

## Usage

```bash
libc-patch -f <binary> -l <libc version w/ architecture> 
```

## Example

```
carey@ubuntu-debug in /work/unsw/18s2/cs6447/wargames/war4/babys_first_2 on master*
> libc-patch -f babys_first_2 -l libc6_2.24-3ubuntu1_i386
[+] Found .deb @ http://old-releases.ubuntu.com/ubuntu/pool/main/g/glibc//libc6_2.24-3ubuntu1_i386.deb, downloading into libc-patch/
####################################################################################################################################### 100.0%
####################################################################################################################################### 100.0%
[+] Extracting debs
[+] Extracted debs, readding debug symbols..
[+] Creating backup and patching binary
'babys_first_2' -> 'babys_first_2-patched'
[+] Binary patched
```
