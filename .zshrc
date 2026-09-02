# gimme my aliases
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

# gimme my prompt
if [ -f ~/.zsh_prompt ]; then
    source ~/.zsh_prompt
fi

# gimme git branch autocomplete, initial one-time setup commented out below
# curl -o ~/.zsh/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
# curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
autoload -Uz compinit && compinit

# make ls pretty again
export CLICOLOR=1
export LSCOLORS=ExGxFxdxCxDxDxhbadacec

# fix my problem with calling gs outside a git repo
gs() {
    local git_status="`git status -unormal 2>&1`"
    if [[ "$git_status" =~ not\ a\ git\ repo ]]; then
        ls -F
    else
        git status
    fi
}
