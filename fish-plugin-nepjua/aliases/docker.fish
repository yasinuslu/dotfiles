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