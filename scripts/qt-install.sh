#!/bin/bash

QT_INSTALLER=/tmp/qt-unified-linux-x64-online.run

wget -O $QT_INSTALLER http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run
chmod +x $QT_INSTALLER
$QT_INSTALLER
