# Setup Scripts

These scripts perform all the setup required to install all my preferred
programs and configuration files on a fresh Ubuntu machine.

## boostrap

The bootstrap script is intended to be piped into `sh` from curl and will run
all the required installation scripts in the appropriate order.

```shell
curl -sSL https://raw.githubusercontent.com/fimad/setup/master/bootstrap.sh | sh
```

## install-dots

`./install-dots.sh` is an idempotent script that will symlink each file in dot.d
into the current user's home directory. If there is already a file it will be
backed up before the symlink is created. Symlinks will not be backed up.

Host specific configuration files can be specified under the dot.$(hostname).d
directory. Files under this directory will override the corresponding file under
dot.d.

## install-tools

`./install-tools.sh` is an idempotent script that can be used to install all of
the varoius binaries that I have deemed necessary.

Each tool has a file in the `install-tools.d` folder. There are currently four
things that a tool file can specify.

1. `name` is a human readable string naming the tool.
2. `apt_deps` is an array of apt packages that are required to install the tool.
3. `check_install` is a function that returns zero if the tool is installed.
4. `install` is a function that performs the tool's installation.

Tools are installed in lexographic order of their file names. This allows for
deterministic installation if a tool depends on another being installed.
