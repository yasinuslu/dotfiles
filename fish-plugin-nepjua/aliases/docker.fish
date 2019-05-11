alias dcomposer='docker run --rm -it --tty -v $PWD:/app composer'
alias dartisan='docker run --rm -it --tty -v $PWD:/app -w /app php:7-cli-alpine php artisan'
function dartisan-serve
    docker run \
        --rm \
        -it \
        --tty \
        -v $PWD:/app \
        -w /app \
        -p 8000:8000 \
        php:7-cli-alpine \
        php artisan serve --host=0.0.0.0 --port=8000
end
abbr --add d 'docker'
abbr --add doc 'docker-compose'
abbr --add docp 'docker-compose -f docker-compose.yml -f docker-compose.prod.yml'
abbr --add docd 'docker-compose -f docker-compose.yml -f docker-compose.dev.yml'
abbr --add k 'kubectl'
abbr --add mk 'microk8s.kubectl'
abbr --add md 'microk8s.docker'
abbr --add sk 'skaffold'
abbr --add df 'df -x"squashfs"'
abbr --add c 'code'
abbr --add ci 'code-insiders'

# dmeteor --dname=app --dport=5000 create app
# dmeteor --dname=app --dport=5000 npm install
# cd app
# dmeteor --dname=app --dport=5000
function dmeteor
    set PORT 3000
    set NAME "app"
    set i 0
    set params
    getopts $argv | while read -l key value
        switch $key
            case dport
                set PORT $value
                set i (math $i + 1)
            case dname
                set NAME $value
                set i (math $i + 1)
        end
    end
    if test $i -ne (count $argv)
        set params $argv[(math $i + 1)..-1]
    end
    docker run -it --rm --name=$NAME -v $PWD:/app -p $PORT:3000 golden/meteor-dev $params
end

# dmeteorx app <meteor command>
function dmeteorx
    docker exec -it $argv[1] meteor $argv[2..-1]
end