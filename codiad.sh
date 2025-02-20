#!/usr/bin/bash

# installs the browser-based editor Codiad 
#
# call via: 
# bash <(wget -qO- https://gist.githubusercontent.com/rnauber/9f579d1480db4cc5a9a3c97c00c52fb9/raw/install_codiad.sh )
#

DEST="$HOME/codiad"
ADDR=127.0.0.1:9876

echo -e "\033[1;32m Installing prerequisites... \033[0m"
pkg install -y php readline git

if [ -e "$DEST" ]
then
    echo -en "\033[1;31m" 
    read -p " The folder $DEST already exists, please press 'y' to delete it! " -n 1 -r
    echo -e "\033[0m"
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm -rf "$DEST"
    else
        echo -e "\033[1;31m Aborting ! \033[0m" 
        exit 1
    fi
fi


echo -e "\033[1;32m Cloning repository ... \033[0m"

git clone --depth 1 https://github.com/francescom/Codiad "$DEST"

cat > "$DEST/config.php" << XXXXX
<?php

/*
*  Copyright (c) Codiad & Kent Safranski (codiad.com), distributed
*  as-is and without warranty under the MIT License. See
*  [root]/license.txt for more. This information must remain intact.
*/

//////////////////////////////////////////////////////////////////
// CONFIG
//////////////////////////////////////////////////////////////////

// PATH TO CODIAD
define("BASE_PATH", "$DEST");

// BASE URL TO CODIAD (without trailing slash)
define("BASE_URL", "$ADDR");

// THEME : default, modern or clear (look at /themes)
define("THEME", "default");

// ABSOLUTE PATH
define("WHITEPATHS", BASE_PATH . ",/");

// SESSIONS (e.g. 7200)
\$cookie_lifetime = "0";

// TIMEZONE
date_default_timezone_set("Asia/Damascus");

// External Authentification
define("AUTH_PATH", "$DEST/noauth.php");

//////////////////////////////////////////////////////////////////
// ** DO NOT EDIT CONFIG BELOW **
//////////////////////////////////////////////////////////////////

// PATHS
define("COMPONENTS", BASE_PATH . "/components");
define("PLUGINS", BASE_PATH . "/plugins");
define("THEMES", BASE_PATH . "/themes");
define("DATA", BASE_PATH . "/data");
define("WORKSPACE", BASE_PATH . "/workspace");

// URLS
define("WSURL", BASE_URL . "/workspace");

// Marketplace
//define("MARKETURL", "http://market.codiad.com/json");

// Update Check
//define("UPDATEURL", "http://update.codiad.com/?v={VER}&o={OS}&p={PHP}&w={WEB}&a={ACT}");
//define("ARCHIVEURL", "https://github.com/Codiad/Codiad/archive/master.zip");
//define("COMMITURL", "https://api.github.com/repos/Codiad/Codiad/commits");

XXXXX


cat > "$DEST/data/users.php" << XXXXX
<?php
/*|[{"username":"termux","password":"6558b496fb21c09603c5b28c998481ae075228ad","project":"\/data\/data\/com.termux\/files\/home\/"}]|*/
?>
XXXXX

cat > "$DEST/data/projects.php" << XXXXX
<?php
/*|[{"name":"termux_home","path":"\/data\/data\/com.termux\/files\/home\/"}]|*/
?>
XXXXX

cat > "$DEST/noauth.php" << XXXXX
<?php 
	\$_SESSION['user'] = 'termux'; 
?>
XXXXX


cat > "$PREFIX/bin/codiad" << XXXXX
cd "$DEST"
php -S $ADDR &
xdg-open http://$ADDR
wait
XXXXX


chmod +x "$PREFIX/bin/codiad"

echo -e "\033[1;32m Done! Try starting it with 'codiad'...  \033[0m"
