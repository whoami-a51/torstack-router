#!/bin/bash
# Script para iniciar Kalitorify no Kali Linux

echo "[+] Iniciando Kalitorify para roteamento via Tor..."
sudo kalitorify --start

echo "[+] Verificando IP atual na rede Tor:"
curl https://check.torproject.org