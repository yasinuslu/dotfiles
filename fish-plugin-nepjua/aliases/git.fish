# Aliases
alias g='git'
alias gst='git status'
alias gl='git pull'
alias gup='git fetch; and git rebase'
alias gp='git push'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcm='git checkout master'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias gss='git status -s'
alias ga='git add'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gdc='git diff --cached'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit; and git push github master:svntrunk'

alias gsr='git svn rebase'
alias gsd='git svn dcommit'

alias gls='git show'

function __fish_git_complete_commits
    git log --pretty=format:%h\t%s -20
end