## install-config

## install-tools

./install-tools.sh is an idempotent script that can be used to install all of
the varoius binaries that I have deemed necessary.

Each tool has a file in the `install-tools.d` folder. There are currently three things that must be set by a tool file. 

1. `name` is a human readable string naming the tool.
2. `check_install` is a function that returns zero if the tool is installed.
3. `install` is a function that performs the tool's installation.

Tools are installed in lexographic order of their file names. This allows for
deterministic installation if a tool depends on another being installed.
