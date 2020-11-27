SSH_ENV_FILE="$HOME/.ssh/ssh_env"

[ -f "$SSH_ENV_FILE" ] && source "$SSH_ENV_FILE"

if [ -z "$SSH_AGENT_PID" ] || [ -z "$(ps -p $SSH_AGENT_PID -o pid,cmd | grep ssh-agent)" ]; then
	ssh-agent > $SSH_ENV_FILE
	source $SSH_ENV_FILE
fi

unset SSH_ENV_FILE
