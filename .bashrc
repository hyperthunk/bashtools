export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"
export JDK_HOME="$JAVA_HOME"
export CATALINA_HOME="/usr/local/tomcat"
export M2_HOME="/usr/local/src/java/maven"
export MAVEN_OPTS="-Xms768m -Xmx2046m -XX:MaxPermSize=1024m"

export ORACLE_HOME="/Users/oracle/oracle"
export ORACLE_TOOLS="/Users/oracle/oracle/product/10.2.0/db_1/bin"
export ORACLE_DYLD_LIBRARY_PATH="/usr/local/oracle/instantclient_10_2"
export SQLPATH="/usr/local/oracle/instantclient_10_2"
export TNS_ADMIN="/usr/local/oracle/network/admin"
# export NLS_LANG="AMERICAN_AMERICA.UTF8"

export HAMCREST_PYPATH="/usr/local/src/python/hamcrest/hamcrest-read-only/hamcrest-python"
export PYTHONPATH="$HAMCREST_PYPATH:/usr/local/lib:/usr/local/src/python/matplotlib"
export JYTHON_HOME="/usr/local/jython"

#export XERCESCROOT=/usr/local/xerces
#export XALANCROOT=/usr/local/src/native/xml-xalan2/c

export CABAL_BIN="$HOME/.cabal/bin"

export RUBY_HOME=/System/Library/Frameworks/Ruby.framework/Versions/Current/usr
export JRUBY_HOME=/usr/local/src/java/jruby/jruby1.0-svn/

export PGDATA=/usr/local/pgsql/data
export POSTGRES_BIN=/usr/local/pgsql/bin

export FEDORA_HOME=/usr/local/fedora

export LIBPATH=$XERCESCROOT/lib:$LIBPATH
export LD_LIBRARY_PATH="/lib:/usr/lib:$LD_LIBRARY_PATH"
export SHLIB_PATH=$XERCESCROOT/lib:$SHLIB_PATH
export DYLD_LIBRARY_PATH="/opt/local/lib:$ORACLE_DYLD_LIBRARY_PATH:$DYLD_LIBRARY_PATH"
export PATH="$PATH:$HOME/.bash/utilities:$POSTGRES_BIN:$JAVA_HOME:$CABAL_BIN:$RUBY_HOME/bin:$JRUBY_HOME/bin:$FEDORA_HOME/server/bin:$FEDORA_HOME/client/bin:$JYTHON_HOME"
export PATH="$HOME/bin:$HOME/bin/cccs:$PGSQLHOME/bin:$PATH:$M2_HOME/bin:$CATALINA_HOME/bin:$ROO_HOME/bin:$FLASH_HOME:$ABBOT_HOME/bin:$JYTHON_HOME/bin:$PATH:$DYLD_LIBRARY_PATH"

export PGSQLHOME="/Library/PostgreSQL/8.4"
export PGDATA="/usr/local/pgsql/data"

export ERL_LIBS="$HOME/Library/Erlang"

export FLASH_HOME="/Applications/Flash Player.app/Contents/MacOS"
export ABBOT_HOME="/usr/local/src/web/abbot"

# set up PS1
# export PS1='h:w u$ `echo w > ~/.last_cwd_$$`'

# PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 12 ]; then CurDir=${DIR:0:5}...${DIR:${#DIR}-8}; else CurDir=$DIR; fi'
# PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 12 ]; then CurDir="${DIR:0:5}...\W"; else CurDir=$DIR; fi'
PS1="\u@\h:\W \$ " 

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
