# sdk command
function sdk
    bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk $argv"
    updatePath
end


# add paths
function updatePath
    set PATH (string match -v -r ".*sdkman" $PATH)
    for ITEM in $HOME/.sdkman/candidates/* ;
        if test -d $ITEM/current/bin
            set -gx PATH $PATH $ITEM/current/bin        
        end
    end
end

updatePath