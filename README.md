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
carey@ubuntu-debug in /work/unsw/18s2/cs6447/wargames/war4/babys_first_2 on master*
> ldd babys_first_2*
babys_first_2:
        linux-gate.so.1 (0xf7fbe000)
        libdl.so.2 => /lib/i386-linux-gnu/libdl.so.2 (0xf7f9c000)
        libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf7dc0000)
        /lib/ld-linux.so.2 (0xf7fc0000)
babys_first_2-patched:
        linux-gate.so.1 (0xf7f8f000)
        libdl.so.2 => libc-patch/lib/i386-linux-gnu/libdl.so.2 (0xf7f85000)
        libc.so.6 => libc-patch/lib/i386-linux-gnu/libc.so.6 (0xf7dcb000)
        libc-patch/lib/i386-linux-gnu/ld-2.24.so => /lib/ld-linux.so.2 (0xf7f91000)
```
