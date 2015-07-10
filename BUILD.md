
# Build HowTo and Tips

## Install

    $ aptitude install -y npm
    $ npm install gitbook-cli -g
    $ aptitude install -y calibre fonts-arphic-gbsn00lp

## Build

    $ gitbook build // make
    $ gitbook pdf   // make pdf

## Tips

### Error: getaddrinfo ENOTFOUND elinux.org

    $ gitbook pdf
    info: loading book configuration....
    warn: you should specify a gitbook version to use in your book.json, for example: 2.x.x
    info: OK
    info: >0 plugins loaded
    info: Parsing multilingual book, with 1 lanuages
    info: Preparing language book en
    info: loading book configuration....OK
    info: >0 plugins loaded
    info: start generation with pdf generator
    info: clean pdf generatorOK
    info: start generation with pdf generator
    info: clean pdf generatorOK
    stream.js:94
          throw er; // Unhandled stream error in pipe.
                ^
    Error: getaddrinfo ENOTFOUND elinux.org
        at errnoException (dns.js:44:10)
        at GetAddrInfoReqWrap.onlookup [as oncomplete] (dns.js:94:26)

* Solution

        $ ping elinux.org
        PING elinux.org (140.211.15.183) 56(84) bytes of data.

        $ sudo -s
        $ echo "140.211.15.183 elinux.org" >> /etc/hosts
