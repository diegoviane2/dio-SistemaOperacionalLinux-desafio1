#!/bin/bash

##########################################
#                                        #
# Written by Diego Viane                 #
# Github: https://github.com/diegoviane2 #
#                                        #
########################################## 

# Folders list
folders=("/publico" "/adm" "/ven" "/sec")

# Groups list
groups=("GRP_ADM" "GRP_VEN" "GRP_SEC")

# Users list
users=("carlos" "maria" "joao" "debora" "sebastiana" "roberto" "josefina" "amanda" "rogerio")

#User Groups List
adm=("carlos" "maria" "joao")
ven=("debora" "sebastiana" "joao")
sec=("josefina" "amanda" "rogerio")

echo "Criando Diretórios"
for folder in ${folders[*]}; do
    mkdir $folder
done


echo "Criando Grupos de Usuários"
for group in ${groups[*]}; do
    groupadd $group
done


echo "Criando Usuários"
for user in ${users[*]}; do
    useradd $user -m -s /bin/bash -p $(openssl passwd -crypt Senha123)
done


echo "Adicionando Usuários aos Grupos Especificos"

echo "Adicionando Usuários ao grupo GRP_ADM"
for u in ${adm[*]}; do
    usermod -a -G GRP_ADM $u
done

echo "Adicionando Usuários ao grupo GRP_VEN"
for u in ${adm[*]}; do
    usermod -a -G GRP_VEN $u
done

echo "Adicionando Usuários ao grupo GRP_SEC"
for u in ${adm[*]}; do
    usermod -a -G GRP_SEC $u
done

echo "Especificando Permissões dos Diretórios"
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

for folder in ${folders[*]}; do
    chomd 770 $folder
done

chmod 777 /publico

echo "FIM"
