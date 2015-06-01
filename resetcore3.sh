cd /home/swgemu/workspace
rm -fr /home/swgemu/workspace/Core3
rm -fr /home/swgemu/workspace/PublicEngine
rm -f MMOCoreORB MMOEngine Core3/MMOEngine

cd /home/swgemu/workspace
git clone http://review.swgemu.com:8080/Core3
git clone http://review.swgemu.com:8080/PublicEngine
cd Core3
git checkout -b unstable origin/unstable

cd /home/swgemu/workspace
(cd /home/swgemu/workspace/Core3;ln -s ../PublicEngine/MMOEngine .)
ln -s PublicEngine/MMOEngine .
ln -s Core3/MMOCoreORB .

cd /home/swgemu/workspace
mkdir -p /home/swgemu/workspace/PublicEngine/MMOEngine/lib/unix
cp /home/swgemu/workspace/PublicEngine/MMOEngine/lib/linux64/libengine3.a /home/swgemu/workspace/PublicEngine/MMOEngine/lib/unix/libengine3.a

##############################################################################
# Setup eclipse if we have the setup file
##############################################################################
logstep "Setup Eclipse"

eclipse_base=~/setup/eclipse-clean.tar.gz

if [ ! -f $eclipse_base ]; then
  echo "Missing $eclipse_base did you remove it?"
else
  if [ -d ~/eclipse ]; then
    echo "Looks like eclipse is already installed"
  else
    echo "Restoring basic eclipse install from $eclipse_base"
    cd ~
    ~/bin/bar $eclipse_base | tar xfz -
    echo "Import eclipse project settings (might take a few minutes)"
    for i in Core3/MMOCoreORB PublicEngine/MMOEngine
    do
      if [ -f ~/workspace/$i/.project ]; then
        echo "Importing $i"
        ~/eclipse/eclipse \
	  -nosplash \
	  -data ~/workspace \
	  -application org.eclipse.cdt.managedbuilder.core.headlessbuild \
	  -import ~/workspace/$i
      else
        echo "Missing project file for $i?"
      fi
    done

    for dir in ~/workspace/.metadata/.plugins/org.eclipse.core.resources/.projects/*
    do
      echo "Setup Egit properties for "$(basename $dir)
      cd $dir
      tar xzf ~/setup/Egit-properties.tar.gz
    done

    echo "Eclipse setup and import complete"
  fi
fi

##############################################################################
# Check for mysql database
##############################################################################
logstep "MySQL database"
if mysql -NB -e 'show databases'|grep swgemu > /dev/null 2>&1; then
  echo "swgemu database already exists"
  :
else
  echo "Restore blank swgemu database to mysql"
  mysql -e source -e ~/workspace/Core3/MMOCoreORB/sql/swgemu.sql
  for sql in ~/workspace/Core3/MMOCoreORB/sql/updates/*.sql
  do
    echo "Runing mysql update: $sql"
    mysql swgemu -e source -e $sql
  done
fi
##############################################################################
# Figure out what Engine library to link to
##############################################################################
logstep "Engine Library"
englib=PublicEngine/MMOEngine/lib/unix/libengine3.a
if [ ! -L $englib ]; then
  echo "Setup unix library link"
  mkdir -p PublicEngine/MMOEngine/lib/unix > /dev/null 2>&1
  (
  cd PublicEngine/MMOEngine/lib/unix
  if [ $(uname -s) = "Darwin" ]; then
    ln -s ../lion64/libengine3.a
  else
    case $(uname -m) in
      x86_64 ) ln -s ../linux64/libengine3.a ;;
      i386 ) ln -s ../linux32/libengine3.a ;;
    esac
  fi
  )
fi
