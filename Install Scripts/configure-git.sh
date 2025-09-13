#!/bin/bash
set -e

# Configurações do Git
sudo apt install -y git
git config --global user.name "Victor Martinez"
git config --global user.email "victorjbamartinez@gmail.com"
git config --global init.defaultBranch main
git config --global core.editor "code --wait"

# Caminho padrão da chave
KEY_PATH="$HOME/.ssh/id_ed25519"

# Gera a chave SSH se não existir
if [ -f "$KEY_PATH" ]; then
    echo ">> Chave SSH já existe em $KEY_PATH"
else
    echo ">> Gerando nova chave SSH..."
    ssh-keygen -t ed25519 -C "victorjbamartinez@gmail.com" -f "$KEY_PATH" -N ""
fi

# Inicia o ssh-agent e adiciona a chave
eval "$(ssh-agent -s)"
ssh-add "$KEY_PATH"

# Mostra a chave pública para copiar no GitHub
echo
echo ">> Sua chave pública SSH (adicione no GitHub → Settings → SSH and GPG keys):"
echo "--------------------------------------------------------------------------"
cat "${KEY_PATH}.pub"
echo "--------------------------------------------------------------------------"

# Testa a conexão com o GitHub
echo
echo ">> Testando conexão com GitHub..."
ssh -T git@github.com || true

