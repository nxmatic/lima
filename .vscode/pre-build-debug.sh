#!/usr/bin/env -S bash -xe -o pipefail

path+=( _output/bin )

lima:stop() {
    name=${1:-nerd}
    
    limactl ls --json nerd | 
        jq -r 'select(.status == "Running") |.name' | 
        xargs -I {} limactl stop {}
}

lima:remake:minimal:debug() {
    remake GO_DEBUG=true minimal    
}

lima:remake:minimal:debug
lima:stop ${LIMAC_INSTANCE:-nerd}