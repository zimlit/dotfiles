function parse_git_branch
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
end

function fish_prompt
    echo -n (set_color 00a06f)$USER(set_color normal)@(set_color 006fa0)(prompt_hostname)
    set_color 00a000
    echo -n \ (prompt_pwd)
    set_color a08000
    echo -n \ (parse_git_branch)
    set_color normal
    echo \ "\$ "
end