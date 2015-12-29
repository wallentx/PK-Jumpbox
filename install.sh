
#!/bin/bash

# Ensure that $HOME/bin dierctory exists, and add it to path
if [ -d "$HOME/bin" ]; then
    echo "Installing files to $HOME/bin - Please make sure to add this directory to your path."
else
    echo "Directory $HOME/bin does not exist. Creating..."
    mkdir $HOME/bin
fi

sleep 1

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
    echo "Adding 'PATH=:bin:$PATH' You may want to set this in your .profile"
fi

sleep 1

# move files where they belong
\cp -R bin/* $HOME/bin/
