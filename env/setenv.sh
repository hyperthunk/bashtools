
## Java-ness
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"
export JDK_HOME="$JAVA_HOME"
export CATALINA_HOME="/usr/local/tomcat"
export CATALINA_OPTS="-Xms512m -Xmx2046m -XX:MaxPermSize=512m"
export M2_HOME="/usr/local/src/java/maven"
export MAVEN_OPTS="-Xms768m -Xmx2046m -XX:MaxPermSize=1024m"
export JRUBY_HOME="/usr/local/src/java/jruby/jruby1.0-svn/"
export JYTHON_HOME="/usr/local/jython"

## Python and Ruby
export RUBY_HOME=/System/Library/Frameworks/Ruby.framework/Versions/Current/usr
export HAMCREST_PYPATH="/usr/local/src/python/hamcrest/hamcrest-read-only/hamcrest-python"
export PYTHONPATH="$HAMCREST_PYPATH:/usr/local/lib:/usr/local/src/python/matplotlib"
export PYTHON_BASE="/Library/Frameworks/Python.framework/Versions/Current"

## Native stuff
export XERCESCROOT=/usr/local/xerces
export XALANCROOT=/usr/local/src/native/xml-xalan2/c
export FEDORA_HOME="/usr/local/fedora"
export LIBPATH=$XERCESCROOT/lib:$LIBPATH
export LD_LIBRARY_PATH="/lib:/usr/lib:/usr/local/lib:$LD_LIBRARY_PATH"
export SHLIB_PATH=$XERCESCROOT/lib:$SHLIB_PATH
export DYLD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/local/lib:$DYLD_LIBRARY_PATH"

## Haskell/Cabal and OCaml
export GODI_TOP="$HOME/Library/OCaml"
export CABAL_BIN="$HOME/.cabal/bin"

## Misc/Homeless
export FLASH_HOME="/Applications/Flash Player.app/Contents/MacOS"
export ABBOT_HOME="/usr/local/src/web/abbot"

## Generic Oracle Shit - applies to instantclient only
export ORACLE_HOME="$SQLPATH"
export TNS_ADMIN="$ORACLE_HOME/admin"

## Path
export PATH="$HOME/.bash/utilities:$HOME/bin:$HOME/bin/cccs:$PATH"
export PATH="$GODI_TOP/bin:$CABAL_BIN:$RUBY_HOME/bin:$PYTHON_BASE/bin:$PATH"
export PATH="$ERL_ROOT/bin:$PATH"
export PATH="$FLASH_HOME:$ABBOT_HOME/bin:$PATH"
export PATH="$JAVA_HOME:$JRUBY_HOME/bin:$JYTHON_HOME:$JYTHON_HOME/bin:$PATH"
export PATH="$M2_HOME/bin:$CATALINA_HOME/bin:$ROO_HOME/bin:$PATH"
export PATH="$FEDORA_HOME/server/bin:$FEDORA_HOME/client/bin:$PATH"
export PATH="$POSTGRES_BIN:$PGSQLHOME/bin:$SQLPATH:$PATH"

# MacPorts Installer addition on 2010-07-08_at_21:29:30: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
