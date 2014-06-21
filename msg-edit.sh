#/bin/bash
eval crypt_file=$1
plain_file="/tmp/.mysecretgarden$$"

sumask=$(umask)
umask 077
cp $crypt_file $crypt_file.backup.$$
openssl enc -a -aes-128-cbc -d -in $crypt_file -out $plain_file -salt -pass env:MSGPWD
emacsclient $plain_file
openssl enc -a -aes-128-cbc -e -in $plain_file -out $crypt_file -salt -pass env:MSGPWD
rm $plain_file
umask $sumask

