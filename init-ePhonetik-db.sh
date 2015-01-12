#!/bin/sh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Postinstallation ePhonetik.
#
# 2015, Heiko Jakubzik (shj)
# shj-software development
# Mannheim, Germany
#
# https://github.com/Jakubzik/ePhonetik
# 
# Prüft, ob der Datenbankserver (Postgres) läuft,
# und ob die Datenbank ePhonetik existiert.
# 
# Wenn die Datenbank nicht existert,
# versucht das Skript, sie zu erzeugen.
# 
# Wenn die Datenbank bereits existert, 
# ändert das Skript nichts.
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Farben
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0m' # SW

BASEDIR=$(dirname $0)

if [ "$1" = "--help" ] ; then
  echo "Postinstaller ePhonetik"
  echo "https://github.com/Jakubzik/ePhonetik"
  echo
  echo "Parameter:"
  echo "--help"
  echo "    (zeigt diese Informationen an)"
  echo 
  echo "--updatedb"
  echo "    (ersetzt die vorhandene ePhonetik Postgres"
  echo "     Datenbank durch die des Pakets;"
  echo "     legt in ./ePhonetik.sql.alt eine"
  echo "     Sicherheitskopie der vorhandenen Datenbank"
  echo "     an."
  echo
  echo "--undo-updatedb"
  echo "    (spielt aus dem Bakup ./ePhonetik.sql.alt "
  echo "     die ePhonetik Datenbank wieder ein)."
  echo
  echo "--test"
  echo "    (startet node und ruft im Browser die "
  echo "     Seite zum JS Backend-Test auf. ACHTUNG, "
  echo "     das macht nur Sinn, wenn auf dem Server "
  echo "     eine grafische Oberfläche und ein Browser"
  echo "     installiert sind"
  echo
  echo "Januar 2015, H. Jakubzik"
  echo "========================="
  exit 0
fi


echo "Postinstaller ePhonetik"
echo "========================"
echo
echo "Teste Backend Datenbank"
echo
echo "(1) Läuft Postgres?"
echo "-------------------"

# Prüfe, ob PostgreSQL läuft
SERVICE=postgres
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
echo "  ...${green}OK${NC}"
echo
else
echo "  ...${red}$SERVICE läuft nicht. Bitte den Datenbankserver starten, "
echo "     z.B. per /etc/init.d/postgresql start!"
echo 
echo "     Das Postinstallations-Skript wird hier abgebrochen."
echo "     Sie müssen/können die Postgres-Datenkbank manuell "
echo "     einrichten. Oder Sie starten den Datenbankserver "
echo "     und rufen 'npm install' erneut auf.${NC}"
exit 1
fi

echo "(2) Existiert ePhonetik?"
echo "-------------------"


if [ `psql -l | grep ePhonetik | wc -l` -ne 1 ] ; then
   echo "  ...${red}existiert nicht${NC}"
    
   if [ "$1" = "--undo-updatedb" ] ; then
   echo "  ...versuche, das Backup wieder einzuspeieln"
   echo "     (Parameter --undo-updatedb)"
   echo
      psql -U postgres -h localhost < $BASEDIR/ePhonetik.sql.alt > /dev/null
	    if [ `psql -l | grep ePhonetik | wc -l` -ne 1 ] ; then
		    echo "     ${red}... hat leider nicht geklappt :-("
		    echo "        Versuchen Sie die Installation manuell.${NC}"
	    else
		    echo "     ... ${green}OK, Datenbank aus Backup eingespielt${NC}"
	    fi
   
   else
      echo "  ...versuche die Installation"
      psql -U postgres -h localhost < $BASEDIR/app/_sql/ePhonetik-1.0.sql > /dev/null
	    if [ `psql -l | grep ePhonetik | wc -l` -ne 1 ] ; then
		    echo "     ${red}... hat leider nicht geklappt :-("
		    echo "        Versuchen Sie die Installation manuell.${NC}"
	    else
		    echo "     ... ${green}OK, Datenbank ist eingespielt${NC}"
	    fi
      echo
   fi
else
    if [ "$1" = "--updatedb" ] ; then
	echo "  ...${green}OK, ePhonetik Datenbank existiert ...${NC}"
	echo "        soll aber erneuert werden."
	echo "        (param --updatedb)."
	echo 
	echo "     ...(2a) Sichere vorhandene db als ./ePhonetik.sql.alt"
	
	# falle bereits eine Kopie vorliegt: Abbruch
	if [ -f ./ePhonetik.sql.alt ]; then
	  echo "        ${red}Alte Sicherungskopie gefunden"
	  echo "        Bitte entfernen Sie zunächst die Datei"
	  echo "        $BASEDIR/ePhonetik.sql.alt"
	  echo "        und rufen Sie dann das Skript erneut auf.${NC}"
	  exit 1
	fi
	
	pg_dump ePhonetik > ./ePhonetik.sql.alt
	if [ $? -ne 0 ] ; then 
	    echo "        ${red}$SERVICE Kopie konnte nicht angelegt werden!${NC}"
	    echo "        Breche ab."
	    exit 1
	else
	    echo "        ${green}OK, Kopie angelegt.${NC}"
	fi
	
	echo
	echo "     ...(2b) Lösche die Datenbank"
	
	dropdb ePhonetik
	if [ $? -ne 0 ] ; then 
	    echo "        ${red}$SERVICE Datenbank konnte nicht gelöscht werden!"
	    echo "        Breche ab.${NC}"
	    exit 1
	else
	    echo "        ${green}OK, alte Datenbank gelöscht.${NC}"
	fi
	
	echo
	echo "     ...(2c) Spiele Datenbank ein"
	
	psql -U postgres -h localhost < $BASEDIR/app/_sql/ePhonetik-1.0.sql > /dev/null
	      if [ `psql -l | grep ePhonetik | wc -l` -ne 1 ] ; then
		      echo "        ${red}$SERVICE Datenbank konnte nicht eingespielt werden!"
		      echo "        Am besten spielen Sie die Sicherungskopie unter"
		      echo "        $BASEDIR/ePhonetik.sql.alt wieder ein!"
		      echo "        Rufen Sie dazu z.B. "
		      echo "        ./init-ePhonetik-db.sh --undo-updatedb "
		      echo "	    auf."
		      echo "        Breche ab.${NC}"
		      exit 1
	      else
		      echo "     ... ${green}OK, Datenbank ist eingespielt${NC}"
	      fi
	echo
	
    else
	echo "  ...${green}OK${NC}"
	echo "     Die Datenbank wird nicht erneuert."
	echo "     Wenn Sie die Datenbank erneuern   "
	echo "     wollen, rufen Sie "
	echo "     ./init-ePhonetik-db.sh --updatedb "
	echo "     auf."
	echo
     fi
fi

if [ "$1" = "--test" ] ; then
  echo "STARTE TEST..."
  SERVICE=node
  if ps ax | grep -v grep | grep $SERVICE > /dev/null
  then
    echo " ... node läuft bereits..."
  else
    echo " ... starte node"
    node $BASEDIR/server.js &
    if ps ax | grep -v grep | grep $SERVICE > /dev/null
    then
      echo " ... ok, node läuft"
    else
      echo " ... ${red}Kann node nicht starten :-(. Abbruch.${NC}"
      exit 1
    fi
  fi
  echo " ... starte Test im Browser"
  xdg-open http://localhost:8080/test/test-backend.html &
  echo
  echo

fi
echo "Postinstaller ePhonetik abgeschlossen."
echo
echo "Starten Sie die App mit 'node server.js'"
echo
