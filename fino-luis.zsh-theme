# a ripoff of fino.zsh-theme, sorry
# I made this to help me with my Latex PHD thesis, it shows how my working directory differs from remote repository

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "%{$FG[100]%}╄╅┭" && return
  echo '┧'
}
#tex file without extension
local project_file="tese_main"

function latex_last_compile {
	if [ -f $project_file.tex ]; then
		echo "[ last compiled in $(echo $(head -n 1 $project_file.log) | awk '{print $12" "$13" - "$15}') ]"
	fi
}

function latex_pages {
	if [ -f $project_file.tex ]; then
		echo "║ [ $project_file.tex has $(cat $project_file.log | grep "Output" | awk '{print $5}' | sed 's/(//' ) pages ]"
	fi
}

function latex_prompt {
	echo " $(latex_pages)$(latex_last_compile)"
}

function virtual_env {
	if [ ! -z "$VIRTUAL_ENV" ]; then
		echo "Py-VENV: $VIRTUAL_ENV"
	fi
}

local latex_prompt='$(latex_prompt)'
local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)$(git_prompt_status)$(git_remote_status)$(git_commits_ahead)$(git_commits_behind)'
local prompt_char='$(prompt_char)'

local virtual_env='$(virtual_env)'

#information useful to sync my thesis in Latex to git repo
#I don't branch and I'd like detailed information on remote|local differences and types of changes
#function git_prompt_info
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%} | clean |"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[052]%} | repo state:"

#function git_prompt_status
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[153]%} untracked |"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[153]%} modified |"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[153]%} unmerged |"
ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[153]%} added |"
ZSH_THEME_GIT_PROMPT_DIVERGED="%{$FG[153]%} diverged |"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[153]%} deleted |"

#function git_remote_status - provides equal status
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$FG[052]%}"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$FG[052]%}"
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="%{$FG[068]%}| up-to-date |"

#function git_commits_ahead
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="%{$FG[023]%} | files to send: "
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX="%{$FG[023]%} |"
#function git_commits_behind
#I run git fetch origin when I cd into the folder
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="%{$FG[023]%} | files to fetch: "
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX="%{$FG[023]%} |"

#Paste this line in the middle to have the Latex prompt
#%{$FG[244]%}║╂┢╪${latex_prompt}

PROMPT="%{$FG[244]%}┏┮══%{$reset_color%} %{$FG[138]%}$virtual_env%{$reset_color%} %{$FG[007]%}in%{$reset_color%} %{$terminfo[bold]$FG[066]%} ${current_dir}%{$reset_color%}${git_info}%{$reset_color%}
%{$FG[244]%}╘━━%{$reset_color%}${prompt_char}%{$reset_color%} "

