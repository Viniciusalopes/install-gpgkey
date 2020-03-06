#!/usr/bin/env bash
# Template orgulhosamente criado por (Shell-Base) tks SlackJeff
#-----------HEADER-------------------------------------------------------------|
#AUTOR
#  Vovolinux <suporte@vovolinux.com.br>
#
##DATA-DE-CRIAÇÃO
#  16/07/2019 ás 14:19
#
#PROGRAMA
#  install-gpgkey
#
#PEQUENA-DESCRIÇÃO
#  Script para automatizar a instalação de chave gpg privada.
#
#LICENÇA
#  MIT
#
#HOMEPAGE
#  https://github.com/Viniciusalopes/install-gpgkey
#
#CHANGELOG
#
#------------------------------------------------------------------------------|

# Interrompe a execução em caso de qualquer erro
set -e

#------- VÁRIAVEIS -------->

################################################################################
#   >>> CUIDADO!!! O SCRIPT PODE APAGAR O CONTEUDO DO DIRETÓRIO dir_gpg <<<    #
# Valor padrão:                                                                #
# dir_gpg='/root/.gnupg'                                                       #
dir_gpg='/root/.gnupg'                                                         #
#   >>> CUIDADO!!! O SCRIPT PODE APAGAR O CONTEUDO DO DIRETÓRIO dir_gpg <<<    #
################################################################################

### LEU AQUI EM CIMA??? ^^

#------- MENSAGENS -------->

msg_dir_existe='O diretório já existe!'
msg_arquivo_invalido='[ ERRO ] Arquivo inválido!'
msg_ate_breve='OK.\nAté breve!'

#----- FIM-MENSAGENS ------>

#----- FIM-VARIAVEIS ------>


#--------FUNÇÕES----------->
ajuda(){
cat << EOF

 INSTRUÇÕES:

    install-gpgkey <local-da-chave>/<arquivo.key>
        -> Importa uma chave privada gpg.

    install-gpgkey -h
    install-gpgkey --help
        -> Ver esta ajuda.

EOF

}

# Checagem inicial e obtenção do caminho do arquivo com a chave
check()
{
    # Sem root não vai, amiguinho.
    [[ "$UID" -ne '0' ]] && { echo "Execute como root."; exit 1 ;}

    # Verificando se o local da chave foi passado
    if [[ ! -e "$chave" ]]; then
        echo -e "${msg_arquivo_invalido} (${chave})"
        ajuda
        exit 1
    fi

    # Verificando se o diretório existe
    if [[ -d "${dir_gpg}" ]]; then 
        #dir_gpg já existe
        echo -e "${msg_dir_existe}"
        read -ep "Deseja REALMENTE excluir TODOS os arquivos em '${dir_gpg}' ? [s/N]: " -n 1

        case "$REPLY" in
             s|S) certeza ;;
            *) sair  ;;
        esac
    else
        instalar
    fi
}

certeza()
{
    read -ep "Você tem CERTEZA ? [s/N]: " -n 1

    case "$REPLY" in
        s|S) absoluta ;;
        *) sair  ;;
    esac
}

absoluta()
{
    read -ep "Você tem certeza ABSOLUTA ? [s/N]: " -n 1

    case "$REPLY" in
        s|S) instalar ;;
        *) sair  ;;
    esac

}

instalar()
{
    echo -e 'Então tá. E lá vamos nós...'
    rm -rfv $dir_gpg/*
    if ! [[ -d "${dir_gpg}" ]]; then 
        mkdir -v "${dir_gpg}"      # cria o dir_gpg
    fi

   # Instala
    echo 'Criando o arquivo '
    echo 'pinentry-mode loopback' >> ${dir_gpg}/gpg.conf
    gpg --import $chave
    echo -e 'Importação concluída!'
    sair
}

sair()
{
    echo -e "${msg_ate_breve}"
    exit 0
}
#-------------------------->

# Programa começa aqui :)

case $1 in
    -h|--help)
        ajuda
        exit 0
    ;;

    *)
        chave="${1}"
        check
    ;;
esac
exit 0
