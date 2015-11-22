# I usually pipe the output of `git diff` and `git log` to less so that when
# I'm done viewing them, I will see the output of my previous commands again.

gd() { git d "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
gdc() { git dc "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
gdu() { git du "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
# word-diff is especially useful for files with very long lines of text
# (e.g. a paragraph per line) - in that case we actually want wrapped lines
gwd() { git wd "$@" | less --RAW-CONTROL-CHARS; }
gwdc() { git wdc "$@" | less --RAW-CONTROL-CHARS; }
gdm() { git dm "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }

gl() { git l "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
gls() { git ls "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
# I want NO line wrapping on these two, so I pipe them to less with
# line-wrapping disabled and exit less immediately without clearing screen.
g5() { git ls -5 "$@" | less --RAW-CONTROL-CHARS --chop-long-lines --QUIT-AT-EOF --no-init; }
g8() { git ls -8 "$@" | less --RAW-CONTROL-CHARS --chop-long-lines --QUIT-AT-EOF --no-init; }
g13() { git ls -13 "$@" | less --RAW-CONTROL-CHARS --chop-long-lines --QUIT-AT-EOF --no-init; }
g21() { git ls -21 "$@" | less --RAW-CONTROL-CHARS --chop-long-lines --QUIT-AT-EOF --no-init; }
gla() { git la "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
gll() { git ll "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
glu() { git lu "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
glm() { git lm "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
gl2() { git l2 "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
gl2a() { git l2a "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
glp() { git lp "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
alias lgp=glp # I keep making this typo; let's just accept it
glpw() { git lpw "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }

# HEAD has to be listed explicitly so that it will be displayed even when it's detached.
# Also list HEAD's upstream (if exists).
gtk() {
    gitk \
    --branches \
    HEAD \
    `git for-each-ref --format='%(upstream:short)' HEAD $(git symbolic-ref --quiet HEAD)` \
    "$@" &
}
# I don't use --all because I don't want stashes to be shown, they are annoying
gtkr() { gitk --branches --remotes HEAD "$@" & }

# checkout previous branch/commit (like `cd -`)
alias g-='git checkout -'

alias gs='git s' # lol I'm crazy
