
# 如何构建 GitBook

## 安装

    $ sudo aptitude install -y retext git nodejs npm
    $ sudo ln -fs /usr/bin/nodejs /usr/bin/node
    $ aptitude install -y calibre fonts-arphic-gbsn00lp
    $ npm install gitbook-cli -g

## 下载

    $ git clone https://github.com/tinyclub/elinux.git && cd elinux/

## 构建 GitBook

    $ gitbook build // make
    $ gitbook pdf   // make pdf

## 小贴士

### 错误: getaddrinfo ENOTFOUND elinux.org

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

* 解决办法

	$ ping elinux.org
	PING elinux.org (140.211.15.183) 56(84) bytes of data.

	$ sudo -s
	$ echo "140.211.15.183 elinux.org" >> /etc/hosts
