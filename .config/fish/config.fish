function fish_prompt
    set pc "\$ "
    if test (whoami) = "root"
        set pc "# "
    end
    echo -n (set_color 00a06f)(whoami)(set_color normal)@(set_color 006fa0)(prompt_hostname)
    set_color 00a000
    echo -n \ (prompt_pwd)
    set_color a08000
    echo -n (fish_git_prompt)
    set_color normal
    echo \ $pc
end

fundle plugin 'danhper/fish-ssh-agent'

fundle init

set -x PATH $PATH /home/devinr/.gem/ruby/2.7.0/bin
set -x PATH $PATH /home/devinr/.rbenv/bin
set -x PATH $PATH /home/devinr/.rbenv/versions/3.0.0/bin

status --is-interactive; and rbenv init - | source
