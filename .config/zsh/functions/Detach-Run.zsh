
# Start & detach Apps from terminal

function dtch {
    local program=$1
    nohup ${program} &
}
