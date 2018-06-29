PS1='[\u:\[\033[1;37m\]\w\[\033[0m\]]\$ '

HISTSIZE=25000
HISTFILESIZE=25000

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias cs_create='find . -name "*.[ch]" > cscope.files; cat cscope.files | xargs etags -a ; cscope -bq '
alias cs_rebuild='etags -a  cscope.files ; cscope -bq '
alias csk_create='find net/ include/ kernel/ init/ -name  "*.[ch]" > cscope.files ; cat cscope.files | xargs etags -a ; cscope -bqk '
alias csk_cmore='find net/ include/ kernel/ init/ mm/ fs/ lib/ security/ -name  "*.[ch]" > cscope.files ; cat cscope.files | xargs etags -a ; cscope -bqk '
alias csk_rebuild='cat cscope.files | xargs etags -a ; cscope -bqk '
