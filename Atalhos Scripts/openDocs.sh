#!/bin/bash
# Ativa o modo de depuração para mostrar cada comando executado
set -x

# --- Configuração ---
SHORTCUT_NAME="Abrir Documentos"
SHORTCUT_COMMAND="nautilus /home/$USER/Documents"
SHORTCUT_BINDING="<Super>e"
SCHEMA="org.gnome.settings-daemon.plugins.media-keys"
KEY="custom-keybindings"

# --- Lógica do Script ---

# Pega a lista de atalhos atual
current_bindings=$(gsettings get $SCHEMA $KEY)
echo "--- Lista de atalhos atual: $current_bindings"

# Define o caminho base para novos atalhos
base_path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/"

# Encontra o próximo ID numérico disponível
last_id=$(echo "$current_bindings" | grep -o 'custom[0-9]*' | grep -o '[0-9]*' | sort -nr | head -n 1)
if [ -z "$last_id" ]; then
  next_id=0
else
  next_id=$((last_id + 1))
fi
echo "--- Próximo ID de atalho a ser usado: $next_id"

# Monta o caminho completo para o novo atalho
new_path="${base_path}custom${next_id}/"
echo "--- Caminho do novo atalho: $new_path"

# Adiciona o novo atalho à lista
if [[ $current_bindings == "@as []" || $current_bindings == "[]" ]]; then
  new_bindings="['$new_path']"
else
  new_bindings="${current_bindings%]*}, '$new_path']"
fi
gsettings set $SCHEMA $KEY "$new_bindings"

# Define os detalhes do novo atalho
KEYBINDING_SCHEMA="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding"
gsettings set $KEYBINDING_SCHEMA:$new_path name "$SHORTCUT_NAME"
gsettings set $KEYBINDING_SCHEMA:$new_path command "$SHORTCUT_COMMAND"
gsettings set $KEYBINDING_SCHEMA:$new_path binding "$SHORTCUT_BINDING"

# Desativa o modo de depuração
set +x

echo ""
echo "✅ Script concluído! O atalho 'Abrir Documentos' foi configurado para Win+E."
echo "Por favor, teste o atalho agora."
