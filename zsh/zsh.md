```
          __ 
 ___ ___ / / 
/_ /(_-</ _ \
/__/___/_//_/
             
```
**Package:** git 
**Version:** 1:2.47.3-0+deb13u1 
**Priority:** optional 
**Section:** vcs 
**Maintainer:** Jonathan Nieder <jrnieder@gmail.com> 
**Installed-Size:** 50,3 MB 
**Provides:** git-completion, git-core 
**Depends:** libc6 (>= 2.38), libcurl3t64-gnutls (>= 7.56.1), libexpat1 (>= 2.0.1), libpcre2-8-0 (>= 10.34), zlib1g (>= 1:1.2.2), perl, liberror-perl, git-man (>> 1:2.47.3), git-man (<< 1:2.47.3-.) 
**Recommends:** ca-certificates, patch, less, ssh-client 
**Suggests:** gettext-base, git-doc, git-email, git-gui, gitk, gitweb, git-cvs, git-mediawiki, git-svn 
**Breaks:** bash-completion (<< 1:1.90-1), cogito (<= 0.18.2+), dgit (<< 5.1~), git-buildpackage (<< 0.6.5), git-el (<< 1:2.32.0~rc2-1~), gitosis (<< 0.2+20090917-7), gitpkg (<< 0.15), guilt (<< 0.33), openssh-client (<< 1:6.8), stgit (<< 0.15), stgit-contrib (<< 0.15) 
**Homepage:** https://git-scm.com/ 
**Tag:** devel::lang:perl, devel::library, devel::rcs, implemented-in::c, 
 implemented-in::perl, implemented-in::shell, interface::text-mode, 
 network::client, network::server, protocol::ssh, protocol::tcp, 
 role::devel-lib, role::program, works-with::file, 
 works-with::software:source, works-with::vcs 
**Download-Size:** 8 862 kB 
**APT-Manual-Installed:** yes 
**APT-Sources:** http://deb.debian.org/debian trixie/main amd64 Packages 
**Description:** масштабируемая распределённая система контроля версий 
 Git — это популярная система контроля версий, предназначенная для быстрой и 
 эффективной работы над очень большими проектами; используется многими 
 проектами с открытым исходным кодом, самым заметным из которых является 
 ядро Linux. 
 . 
 Git является распределённой системой контроля версий: для работы с ней не 
 нужен центральный сервер. Репозитории хранятся локально полностью, со всей 
 историей изменений, а соединение с центральным сервером (если такой 
 имеется) нужно только для публикации своих изменений и загрузки изменений 
 опубликованных другими (т.е. для синхронизации удалённого и локального 
 репозиториев). 
 . 
 Этот пакет устанавливает основные компоненты git. Дополнительные 
 компоненты, такие как графический интерфейс пользователя и утилита для 
 наглядного представления дерева версий, утилиты для организации 
 взаимодействия с другими системами контроля версий и веб-интерфейс, 
 доступны в отдельных пакетах git*. 
 

## Структура пакета
```
.
└── usr
    ├── bin
    │   ├── rzsh -> zsh
    │   ├── zsh
    │   └── zsh5
    ├── lib
    │   └── x86_64-linux-gnu
    └── share
        ├── bug
        ├── debianutils
        ├── doc
        ├── lintian
        └── man

11 directories, 3 files
```

## Файл preinst
```
#!/bin/sh
set -e
# Automatically added by dh_installdeb/13.24.2
dpkg-maintscript-helper symlink_to_dir /usr/share/doc/zsh zsh-common 5.0.7-3 -- "$@"
# End automatically added section
```

## Файл postinst
```
#!/bin/sh

set -e

# ksh alternatives
update-alternatives --remove ksh /usr/bin/zsh
update-alternatives --remove ksh /bin/zsh4

# Remove alternatives system for zsh in general
update-alternatives --remove zsh /bin/zsh5
update-alternatives --remove rzsh /bin/zsh5

case "$1" in
    (configure)
    ;;
    (abort-upgrade|abort-remove|abort-deconfigure)
	exit 0
    ;;
    (*)
	echo "postinst called with unknown argument \`$1'" >&2
	exit 0
    ;;
esac

# Automatically added by dh_installdeb/13.24.2
dpkg-maintscript-helper symlink_to_dir /usr/share/doc/zsh zsh-common 5.0.7-3 -- "$@"
# End automatically added section


exit 0
```

## Файл prerm
```
#!/bin/sh
set -e
# Automatically added by dh_installdeb/13.24.2
dpkg-maintscript-helper symlink_to_dir /usr/share/doc/zsh zsh-common 5.0.7-3 -- "$@"
# End automatically added section
```

## Файл postrm
```
#!/bin/sh
set -e
# Automatically added by dh_installdeb/13.24.2
dpkg-maintscript-helper symlink_to_dir /usr/share/doc/zsh zsh-common 5.0.7-3 -- "$@"
# End automatically added section
```
