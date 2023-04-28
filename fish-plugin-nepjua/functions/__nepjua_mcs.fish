function __nepjua_mcs
    function mcs
        set SCRIPT_DIR ~/code/mastercontrol/mc-scripts/bin
        set SCRIPT_PATH "$SCRIPT_DIR/$argv[1]"
        eval "$SCRIPT_PATH" $argv
    end

    # Completion for mcs function
    function __mcs_completion
        set completions (ls ~/code/mastercontrol/mc-scripts/bin)
        set -l curword (commandline -ct)
        set -l completions (string match -q -r "^$curword" $completions)
        echo $completions
    end

    # Register completion for mcs
    complete -c mcs -a "(__mcs_completion)"
end
