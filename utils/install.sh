#!/bin/bash

echo "[*] Installing dependencies..."

pkg update -y
pkg install wget proot git -y
