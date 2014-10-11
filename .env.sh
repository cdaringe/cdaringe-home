#!/bin/bash
export COINS_ENV='dev'
goprd ()
{
    printf "Setting COINS_ENV to prd..."
    export COINS_ENV='prd'
    printf "$COINS_ENV"
    echo
}

godev ()
{
    printf "Setting COINS_ENV to dev..."
    export COINS_ENV='dev'
    printf "$COINS_ENV"
    echo
}
