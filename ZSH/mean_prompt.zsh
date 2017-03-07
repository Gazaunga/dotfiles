# mean prompt theme
# by Bryan Gilbert: https://github.com/gilbertw1/mean
#
# Based on Lean by Miek Gieben: https://github.com/miekg/lean
#   Based on Pure by Sindre Sorhus: https://github.com/sindresorhus/pure
#
# MIT License

PROMPT_MEAN_TMUX=${PROMPT_MEAN_TMUX-"t"}

# turns seconds into human readable time, 165392 => 1d 21h 56m 32s
prompt_mean_human_time() {
    local tmp=$1
    local days=$(( tmp / 60 / 60 / 24 ))
    local hours=$(( tmp / 60 / 60 % 24 ))
    local minutes=$(( tmp / 60 % 60 ))
    local seconds=$(( tmp % 60 ))
    (( $days > 0 )) && echo -n "${days}d "
    (( $hours > 0 )) && echo -n "${hours}h "
    (( $minutes > 0 )) && echo -n "${minutes}m "
    echo "${seconds}s "
}

# fastest possible way to check if repo is dirty
prompt_mean_git_dirty() {
    # check if we're in a git repo
    command git show-ref --head &>/dev/null || return

    git diff-files --no-ext-diff --quiet && git diff-index --no-ext-diff --quiet --cached HEAD
    (($? != 0)) && echo '✱'
}

# displays the exec time of the last command if set threshold was exceeded
prompt_mean_cmd_exec_time() {
    local stop=$EPOCHSECONDS
    local start=${cmd_timestamp:-$stop}
    integer elapsed=$stop-$start
    (($elapsed > ${PROMPT_LEAN_CMD_MAX_EXEC_TIME:=5})) && prompt_mean_human_time $elapsed
}

prompt_mean_preexec() {
    cmd_timestamp=$EPOCHSECONDS

    # shows the current dir and executed command in the title when a process is active
    print -Pn "\e]0;"
    echo -nE "$PWD:t: $2"
    print -Pn "\a"
}

prompt_short_pwd() {

  local short full part cur
  local first
  local -a split    # the array we loop over

  split=(${(s:/:)${(Q)${(D)1:-$PWD}}})

  if [[ $split == "" ]]; then
    print "/"
    return 0
  fi

  if [[ $split[1] = \~* ]]; then
    first=$split[1]
    full=$~split[1]
    shift split
  fi

  if (( $#split > 0 )); then
    part=/
fi

for cur ($split[1,-2]) {
  while {
           part+=$cur[1]
           cur=$cur[2,-1]
           local -a glob
           glob=( $full/$part*(-/N) )
           # continue adding if more than one directory matches or
           # the current string is . or ..
           # but stop if there are no more characters to add
           (( $#glob > 1 )) || [[ $part == (.|..) ]] && (( $#cur > 0 ))
        } { # this is a do-while loop
  }
  full+=$part$cur
  short+=$part
  part=/
}
  print "$first$short$part$split[-1]"
  return 0
}

function prompt_mean_insert_mode () { echo "-- INSERT --" }
function prompt_mean_normal_mode () { echo "-- NORMAL --" }

prompt_mean_precmd() {
    rehash

    local jobs
    local prompt_mean_jobs
    unset jobs
    for a (${(k)jobstates}) {
        j=$jobstates[$a];i="${${(@s,:,)j}[2]}"
        jobs+=($a${i//[^+-]/})
    }
    # print with [ ] and comma separated
    prompt_mean_jobs=""
    [[ -n $jobs ]] && prompt_mean_jobs="%F{242}["${(j:,:)jobs}"] "

    vcsinfo="$(git symbolic-ref --short HEAD 2>/dev/null)"
    if [[ !  -z  $vcsinfo  ]] then
        vcsinfo="%F{cyan}$vcsinfo%F{magenta}`prompt_mean_git_dirty` "
    else
        vcsinfo=" "
    fi

    case ${KEYMAP} in
      (vicmd)      VI_MODE="%F{blue}$(prompt_mean_normal_mode)" ;;
      (main|viins) VI_MODE="%F{2}$(prompt_mean_insert_mode)" ;;
      (*)          VI_MODE="%F{2}$(prompt_mean_insert_mode)" ;;
    esac

    PROMPT="$prompt_mean_jobs%F{yellow}$prompt_mean_tmux `prompt_mean_cmd_exec_time`%f%F{blue}`prompt_short_pwd` %B%F{1}❯%(?.%F{3}.%B%F{red})❯%(?.%F{2}.%B%F{red})❯%f%b "
    RPROMPT="$VI_MODE $vcsinfo%F{yellow}λ$prompt_mean_host%f"

    unset cmd_timestamp # reset value since `preexec` isn't always triggered
}

prompt_mean_setup() {
    prompt_opts=(cr subst percent)

    zmodload zsh/datetime
    autoload -Uz add-zsh-hook

    add-zsh-hook precmd prompt_mean_precmd
    add-zsh-hook preexec prompt_mean_preexec

    prompt_mean_host=" %F{cyan}%m%f"
    [[ "$TMUX" != '' ]] && prompt_mean_tmux=$PROMPT_MEAN_TMUX
}

function zle-line-init zle-keymap-select {
    prompt_mean_precmd
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

prompt_mean_setup "$@"
