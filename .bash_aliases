alias ls='ls -AGhl'

alias ..='cd ..'

alias hosts='sudo $EDITOR /etc/hosts'

alias ip='dig +short myip.opendns.com @resolver1.opendns.com'

alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# https://github.com/django/django/blob/d7b2aa24f75434c2ce50100cfef3586071e0747a/django/utils/crypto.py#L69
alias django-secret-key='python3 -c "import random; chars = \"abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*(-_=+)\"; print(\"\".join(random.SystemRandom().choice(chars) for _ in range(50)))"'

# List open ports
# https://stackoverflow.com/a/34659332/758384
alias openports='sudo lsof -iTCP -sTCP:LISTEN -n -P'

