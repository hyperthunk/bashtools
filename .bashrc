
ENV="$HOME/.bash/env"
for dir in `find -L "$ENV" -name setenv.sh | grep current`
do
  source "$dir"
done

source "$ENV/setenv.sh" 

# set up PS1
# export PS1='h:w u$ `echo w > ~/.last_cwd_$$`'

# PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 12 ]; then CurDir=${DIR:0:5}...${DIR:${#DIR}-8}; else CurDir=$DIR; fi'
# PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 12 ]; then CurDir="${DIR:0:5}...\W"; else CurDir=$DIR; fi'
PS1="\u@\h:\W \$ " 

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
