#!/bin/bash

# Script para agregar eventos-chetos.local al archivo /etc/hosts (Linux/Mac)

DOMAIN="eventos-chetos.local"
HOST_ENTRY="127.0.0.1 $DOMAIN"
HOSTS_FILE="/etc/hosts"

echo "Configurando host $DOMAIN para desarrollo..."

# Verificar si ya existe la entrada
if grep -q "$DOMAIN" "$HOSTS_FILE"; then
    echo "⚠️  El host $DOMAIN ya existe en $HOSTS_FILE"
    echo "Entrada actual:"
    grep "$DOMAIN" "$HOSTS_FILE"
else
    echo "Agregando $DOMAIN a $HOSTS_FILE..."
    
    # Agregar entrada al archivo hosts (requiere sudo)
    echo "" | sudo tee -a "$HOSTS_FILE" > /dev/null
    echo "# Desarrollo - Eventos Chetos" | sudo tee -a "$HOSTS_FILE" > /dev/null
    echo "$HOST_ENTRY" | sudo tee -a "$HOSTS_FILE" > /dev/null
    
    if [ $? -eq 0 ]; then
        echo "✅ Host $DOMAIN agregado exitosamente"
        echo "Ahora puedes acceder a la aplicación en: http://$DOMAIN"
    else
        echo "❌ Error al agregar el host. Verifica permisos de sudo."
        exit 1
    fi
fi

echo ""
echo "Para verificar la configuración:"
echo "curl -I http://$DOMAIN"