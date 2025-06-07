# 🧅 VPN no Roteador + Kalitorify no Kali Linux

> Projeto de anonimato com estrutura em camadas: tráfego da rede passa por uma VPN física (via roteador) e depois por Tor (via kalitorify) dentro do Kali Linux.  
> **Modelo: VPN → Tor**

---

## 🛡️ Objetivo

Garantir **anonimato real** e **não-vazamento de IP** com o uso conjunto de:

- **VPN no roteador**: Esconde o IP real de todos os dispositivos da rede.
- **Kalitorify no Kali Linux**: Redireciona todo o tráfego da máquina para a rede Tor.

---

## ⚙️ Requisitos

### Roteador:
- Compatível com **OpenVPN** (DD-WRT, OpenWRT, AsusWRT, pfSense, Mikrotik, etc.)
- Conta ProtonVPN gratuita ou paga

### Kali Linux:
- Máquina física ou virtual
- `git`, `iptables`, `torsocks`, `tor` e `kalitorify`

---

## 🛜 Etapa 1: Configurar VPN no Roteador

### 1. Acesse o painel do seu roteador
Geralmente em `192.168.0.1` ou `192.168.1.1`.

### 2. Configure a VPN (ProtonVPN)
Se o roteador for compatível:

- Baixe os arquivos `.ovpn` no painel da ProtonVPN:
  https://account.protonvpn.com/downloads

- Faça upload no painel do roteador ou configure manualmente no cliente VPN do firmware.

- Salve, conecte e aplique.

### 3. Verifique o IP da rede
Acesse `https://ipinfo.io` de qualquer dispositivo conectado e veja se o IP é o da ProtonVPN.

---

## 🧠 Etapa 2: Instalar Kalitorify no Kali Linux

### 1. Clonar o repositório
```bash
git clone https://github.com/brainfucksec/kalitorify.git
cd kalitorify
```

### 2. Instalar
```bash
sudo ./install.sh
```

### 3. Ativar o roteamento via Tor
```bash
sudo kalitorify --start
```

---

## 🧪 Etapa 3: Verificar a conexão

### 1. Verifique o IP Tor
```bash
curl https://check.torproject.org
```

Se retornar algo como **"You are using Tor"**, está tudo certo.

### 2. Verifique o IP do roteador (VPN)
Em outro dispositivo da rede, acesse:
```bash
https://ipinfo.io
```
Deve mostrar o IP da ProtonVPN.

---

## 🔒 Resultado esperado

Todo o tráfego do Kali Linux:
```
[ Kali (Tor via kalitorify) ] → [ VPN no roteador ] → [ Internet ]
```

- Nenhum tráfego sai da rede sem passar pela VPN.
- Nenhum app dentro do Kali fura o Tor.

---

## 🧱 Segurança extra (opcional)

- Não usar contas pessoais nesse Kali
- Não abrir PDFs direto
- Rodar o Kali numa VM para isolamento
- Usar DNS fora do roteador (Cloudflare, etc.)

---

## 📜 Licença

Este projeto é livre para uso educacional.  
Não nos responsabilizamos por mau uso.  
Licença: MIT.

---

## 🙏 Créditos

- [ProtonVPN](https://protonvpn.com)
- [Kalitorify](https://github.com/brainfucksec/kalitorify)