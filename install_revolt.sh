#!/bin/bash

# === ReVOLT Self-Hosted Auto Installer ===
# Pour Ubuntu 22.04+

echo "[1/7] Mise à jour du système..."
sudo apt update && sudo apt upgrade -y

echo "[2/7] Installation de Docker & Docker Compose..."
sudo apt install -y docker.io docker-compose git
sudo systemctl enable docker --now

echo "[3/7] Clonage du dépôt ReVOLT..."
git clone https://github.com/revoltchat/self-hosted.git revolt-server
cd revolt-server

echo "[4/7] Création des fichiers de config..."
cp .env.example .env
cp docker-compose.example.yml docker-compose.yml

echo "[5/7] Configuration minimale de l'environnement..."
sed -i 's|REPLACE_ME|changeme123|g' .env
sed -i 's|http://localhost:8000|http://localhost:8000|g' .env

echo "[6/7] Lancement de ReVOLT avec Docker Compose..."
docker-compose up -d

echo "[7/7] Fait ! ReVOLT est en ligne sur : http://<ton-ip>:8000"
echo "Tu peux maintenant te connecter via l'interface web ReVOLT (client)."
