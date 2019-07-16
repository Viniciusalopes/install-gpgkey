# install-gpgkey
Script para automatizar a importação de chave privada gpg (GnuPG).

### Finalidade
Este script foi criado para facilitar a importação da chave privada gpg em um computador com a distribuição Gnu/Linux Mazon Os,
mas pode ser utilizado em qualquer sistema operacional.

---
### Filosofia
FUNCIONAR, sem dogmatismos, apegos ideológicos, culturais ou filosóficos de qualquer natureza.

---
### Instruções
Para importar uma chave privada gpg, digite no terminal:

```# install-gpgkey <local-da-chave>/<arquivo.key>```    


#### Exemplo:

Supondo que eu tenha um arquivo de chave privada já exportada, com o nome 'minhachave.key' e que esta chave esteja em /home/minhapasta, o comando acima ficaria assim:

```# install-gpgkey /home/minhapasta/minhachave.key```

---
Para ver um texto de ajuda, digite no terminal:

```# install-gpgkey -h```ou então ```# install-gpgkey --help```

---
### Instalação
No terminal utilize o usuário root:

```# su -```


Faça o download :

```# wget -O /usr/bin/mz https://raw.githubusercontent.com/Viniciusalopes/install-gpgkey/master/install-gpgkey.sh```


Conceda as permissões de execução:

```# chmod + x /usr/bin/install-gpgkey.sh```


Crie um link simbólico:

```# ln -s /usr/bin/install-gpgkey.sh /usr/bin/install-gpgkey```

---
### Referências

Mazon Os -> http://mazonos.com/

bananapkg -> https://bananapkg.github.io/

GnuPg -> https://gnupg.org/
