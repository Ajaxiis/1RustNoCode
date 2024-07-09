#!/bin/bash
#  This script installs various packages and tools on a Linux system, including:
#  - aptitude, qbittorrent, vlc
#  - gdebi, genny
#  - pinta
#  - flatpak and flathub
#  - Google Chrome
#  - Rust, Tauri, and Node.js
#  - VSCodium (a free/open-source build of Visual Studio Code)
#  - Various development tools and libraries

# It also performs system updates, upgrades, and reboots as needed. The script is designed to set up a development environment for building Tauri-based applications.
echo "Обновление списка пакетов"
sudo aptitude update
echo "Обновление установленных пакетов"
sudo aptitude upgrade
echo "Установка qBittorrent, VLC и aptitude"
sudo apt-get install aptitude qbittorrent vlc
echo "Установка gdebi и genny"  
sudo aptitude install gdebi genny
echo "Установка Pinta (редактор изображений)"
sudo aptitude install pinta
echo "Обновление списка пакетов"
sudo aptitude update
echo "Установка плагина xfce4-xkb для смены раскладки клавиатуры"
sudo apt-get install xfce4-xkb-plugin
echo "Установка vokoscreen-ng (запись экрана)"
sudo apt install vokoscreen-ng

echo "Добавление репозитория Flatpak"
sudo add-apt-repository ppa:flatpak/stable
echo "Обновление списка пакетов"
sudo apt update
echo "Установка Flatpak"
sudo apt install flatpak
echo "Установка плагина для Flatpak в GNOME Software"
sudo apt install gnome-software-plugin-flatpak
echo "Добавление удаленного репозитория Flathub"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Установка Google Chrome через Flatpak"
flatpak install flathub com.google.Chrome
echo "Обновление списка пакетов"
sudo aptitude update
echo "Запуск скрипта rust_tauri_node.sh"
bash rust_tauri_node.sh
echo "Обновление системы"
sudo apt update && sudo apt upgrade -y
echo "Установка зависимостей для Tauri"
sudo apt install -y curl wget build-essential libssl-dev libgtk-3-dev libwebkit2gtk-4.0-dev libappindicator3-dev librsvg2-dev
echo "Очистка кэша пакетов"
sudo aptitude autoclean
echo "Установка curl"
sudo aptitude install curl
echo "Установка Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "Настройка переменных окружения Rust"
source $HOME/.cargo/env
echo "Проверка версии Rust"
rustc --version
echo "Проверка версии Cargo"
cargo --version
echo "Установка Tauri CLI"
cargo install tauri-cli
echo "Установка Node.js LTS"
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
echo "Установка Node.js"
sudo apt install -y nodejs
echo "Обновление npm"
sudo npm install -g npm@latest
echo "Проверка версии Tauri CLI"
cargo tauri --version
echo "Установка create-tauri-app"
cargo install create-tauri-app --locked
echo "Создание нового Tauri приложения через create-tauri-app"
cargo create-tauri-app
echo "Обновление списка пакетов"
sudo apt update
echo "Установка зависимостей для Tauri"
sudo apt install libwebkit2gtk-4.0-dev build-essential curl wget file libssl-dev libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev
echo "Обновление списка пакетов"
sudo apt update

echo "Установка Git"
sudo apt install git
echo "Настройка Git (имя пользователя)"
git config --global user.name "Ajaxiis"
echo "Настройка Git (email пользователя)"
git config --global user.email ajaxii@yandex.ru
echo "Просмотр настроек Git"
git config --global --list
echo "Очистка кэша пакетов"
sudo aptitude autoclean
echo "Обновление списка пакетов"
sudo aptitude update
echo "Установка VSCodium"
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium
echo "Удаление ненужных пакетов"
sudo apt autoremove
echo "Установка Gnome Tweaks (настройка внешнего вида GNOME)"
sudo apt-get install gnome-tweaks
echo "Очистка терминала"
clear
echo "Программы установлены, необходима перезагрузка системы." 
delay 10
reboot