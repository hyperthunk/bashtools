#export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"
export PYTHONPATH="/usr/local/src/python/hamcrest/hamcrest-read-only/hamcrest-python:/usr/local/lib"
export JYTHON_HOME="/usr/local/jython"
#export XERCESCROOT=/usr/local/xerces
#export XALANCROOT=/usr/local/src/native/xml-xalan2/c
export CABAL_BIN=/Users/pax/.cabal/bin
export RUBY_HOME=/System/Library/Frameworks/Ruby.framework/Versions/Current/usr
export JRUBY_HOME=/usr/local/src/java/jruby/jruby1.0-svn/
export PGDATA=/usr/local/pgsql/data
export POSTGRES_BIN=/usr/local/pgsql/bin
export FEDORA_HOME=/usr/local/fedora
export CATALINA_HOME="/usr/local/tomcat"
export PATH="$PATH:$HOME/.bash/utilities:$POSTGRES_BIN:$JAVA_HOME:$CABAL_BIN:$RUBY_HOME/bin:$JRUBY_HOME/bin:$FEDORA_HOME/server/bin:$FEDORA_HOME/client/bin:$JYTHON_HOME"
export LIBPATH=$XERCESCROOT/lib:$LIBPATH
export LD_LIBRARY_PATH=$XERCESCROOT/lib:$LD_LIBRARY_PATH
export SHLIB_PATH=$XERCESCROOT/lib:$SHLIB_PATH
export DYLD_LIBRARY_PATH=/opt/local/lib:$DYLD_LIBRARY_PATH
export ORACLE_HOME=/Users/pax/oracle/instantclient_10_2
export PGDATA=/usr/local/pgsql/data
export ERL_LIBS="/Users/t4/Library/Erlang"
# export ERL_LIBS="/usr/local/src/erlang/erlydtl:/usr/local/src/erlang/esmtp:/usr/local/src/erlang/webmachine-justin:/Users/pax/work/hyperthunk/hmail/spikes/mailer_daemon:/usr/local/src/erlang/webmachine-justin/deps/mochiweb"
export ROO_HOME="/usr/local/src/java/spring-roo/spring-roo-1.0.0.RC1"
export M2_HOME="/usr/local/src/java/maven"
export FLASH_HOME="/Applications/Flash Player.app/Contents/MacOS"
export CATALINA_HOME="/usr/local/tomcat"
export PGSQLHOME="/Library/PostgreSQL/8.4"
export ABBOT_HOME="/usr/local/src/web/abbot"
export JYTHON_HOME="/usr/local/src/jython"
export PATH="/Users/t4/bin:/Users/t4/bin/cccs:$PGSQLHOME/bin:$PATH:$M2_HOME/bin:$CATALINA_HOME/bin:$ROO_HOME/bin:$FLASH_HOME:$ABBOT_HOME/bin:$JYTHON_HOME/bin"
#export MAVEN_OPTS="-Xmx1024m"
export MAVEN_OPTS="-Xms768m -Xmx2046m -XX:MaxPermSize=1024m"
# set up PS1
# export PS1='h:w u$ `echo w > ~/.last_cwd_$$`'

# PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 12 ]; then CurDir=${DIR:0:5}...${DIR:${#DIR}-8}; else CurDir=$DIR; fi'
# PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 12 ]; then CurDir="${DIR:0:5}...\W"; else CurDir=$DIR; fi'
PS1="\u@\h:\W \$ " 


