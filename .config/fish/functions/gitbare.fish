function gitbare --description 'Clone git repo for worktree use' --argument where repo
    mkdir $where
    git clone --bare $repo (string join '/' $where .bare)
    echo "gitdir: ./.bare" > (string join '/' $where .git)
end
