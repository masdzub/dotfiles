function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    # Set prompt colors
    set -l host_color FF748C
    set -l cwd_color $fish_color_cwd
    set -l prompt_char_color normal

    # User and host
    set_color $host_color
    echo -n 'Dzubayyans-mac-mini '

    # Current working directory
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    set_color $cwd_color
    echo -n [(prompt_pwd)]
    set_color normal

    # Git status
    set -q __fish_git_prompt_showdirtystate; or set -g __fish_git_prompt_showdirtystate 1
    set -q __fish_git_prompt_showuntrackedfiles; or set -g __fish_git_prompt_showuntrackedfiles 1
    set -q __fish_git_prompt_showcolorhints; or set -g __fish_git_prompt_showcolorhints 1
    set -q __fish_git_prompt_color_untrackedfiles; or set -g __fish_git_prompt_color_untrackedfiles yellow
    set -q __fish_git_prompt_char_untrackedfiles; or set -g __fish_git_prompt_char_untrackedfiles '?'
    set -q __fish_git_prompt_color_invalidstate; or set -g __fish_git_prompt_color_invalidstate red
    set -q __fish_git_prompt_char_invalidstate; or set -g __fish_git_prompt_char_invalidstate '!'
    set -q __fish_git_prompt_color_dirtystate; or set -g __fish_git_prompt_color_dirtystate blue
    set -q __fish_git_prompt_char_dirtystate; or set -g __fish_git_prompt_char_dirtystate '*'
    set -q __fish_git_prompt_char_stagedstate; or set -g __fish_git_prompt_char_stagedstate '✚'
    set -q __fish_git_prompt_color_cleanstate; or set -g __fish_git_prompt_color_cleanstate green
    set -q __fish_git_prompt_char_cleanstate; or set -g __fish_git_prompt_char_cleanstate '✓'
    set -q __fish_git_prompt_color_stagedstate; or set -g __fish_git_prompt_color_stagedstate yellow
    set -q __fish_git_prompt_color_branch_dirty; or set -g __fish_git_prompt_color_branch_dirty red
    set -q __fish_git_prompt_color_branch_staged; or set -g __fish_git_prompt_color_branch_staged yellow
    set -q __fish_git_prompt_color_branch; or set -g __fish_git_prompt_color_branch green
    set -q __fish_git_prompt_char_stateseparator; or set -g __fish_git_prompt_char_stateseparator '⚡'

    fish_vcs_prompt '|%s'

    echo

    # Indicate the last command's exit status
    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    # Prompt character
    echo -n '➤ '
    set_color $prompt_char_color


end
