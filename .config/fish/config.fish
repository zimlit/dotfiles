function fish_prompt
    echo -n (set_color 00a06f)$USER(set_color normal)@(set_color 006fa0)(prompt_hostname)
    set_color 00a000
    echo -n \ (prompt_pwd)
    set_color a08000
    echo -n (fish_git_prompt)
    set_color normal
    echo \ "\$ "
end