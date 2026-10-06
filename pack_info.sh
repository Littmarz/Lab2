echo "Выбранный пакет: $1"
pack=$1

if [ -z "$pack" ]
then
	echo "Укажите название пакета!"
	exit 1
fi
work=~/projects/lab2/$1
rm -rf $work
mkdir $work
cd $work

apt download $pack

file=$(ls *.deb)

dpkg -x $file data
dpkg -e $file meta

rep=$work/$pack.md
#1 ASCII заголовок
echo '```' > $rep
figlet -f smslant $1 > $rep
echo '```' > $rep
#2 Информация о пакете
apt show git 2>/dev/null | sed 's/$/ /' | sed -E 's/(^\b.+?:) /**\1** /g' >> $rep
#3 Структура пакета
echo "" >> $rep
echo "## Структура пакета" >> $rep
echo '```' >> $rep
cd data
tree -L 3 >> $rep
cd ..
echo '```' >> $rep
#4 preinst postinst prerm postrm
if [ -e meta/preinst ]
then
	echo "" >> $rep
	echo "## Файл preinst" >> $rep
	echo '```' >> $rep
	cat meta/preinst >> $rep
	echo '```' >> $rep
fi
if [ -e meta/postinst ]
then
	echo "" >> $rep
	echo "## Файл postinst" >> $rep
	echo '```' >> $rep
	cat meta/postinst >> $rep
	echo '```' >> $rep
fi
if [ -e meta/prerm ]
then
	echo "" >> $rep
	echo "## Файл prerm" >> $rep
	echo '```' >> $rep
	cat meta/prerm >> $rep
	echo '```' >> $rep
fi
if [ -e meta/postrm ]
then
	echo "" >> $rep
	echo "## Файл postrm" >> $rep
	echo '```' >> $rep
	cat meta/postrm >> $rep
	echo '```' >> $rep
fi

echo "Отчёт готов: $rep:"
