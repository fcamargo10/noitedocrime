-- Resource Metadata
fx_version 'bodacious'
game 'gta5'

author 'Filipe Camargo'
description 'Script para o Servidor Villa Lobos para noite do crime'
version '1.0.0'

ui_page {'files/index.html'}

server_scripts {"server.lua"}

client_scripts {"client.lua"}

shared_script 'cfg/*.lua'

files {
  'files/index.html',
  'files/main.css',
  'files/main.js',
  'files/alert.mp3',
  'files/logopf.png',
  'fonts/VCR_OSD_MONO.ttf'
}
