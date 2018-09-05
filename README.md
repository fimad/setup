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
the various binaries that I have deemed necessary.

Each tool has a file in the `install-tools.d` folder. There are currently four
things that a tool file can specify.

1. `name` is a human readable string naming the tool.
2. `apt_deps` is an array of apt packages that are required to install the tool.
3. `tags` is an array of tags that describe which environments the tool should
   be installed on.
4. `check_install` is a function that returns zero if the tool is installed.
5. `install` is a function that performs the tool's installation.

Tools are installed in lexicographic order of their file names. This allows for
deterministic installation if a tool depends on another being installed.

### upgrade-tools

Tools can be automatically updated by running `./upgrade-tools.sh`. This is
currently fairly dumb and does not perform any version checks. This means that a
tool may "upgrade" to the current version.

To allow a tool to be upgraded a `upgrade` function needs to be defined in the
appropriate script in the `install-tools.d` folder.

### Tags

The `install-tools.sh` script tags a list of tags as command line arguments. The
currently used tags are:

* work - An instance that I use at work. Avoid installing tools that aren't
  appropriate for running at work (e.g. backup utilities).
* tui - An instance that will only run terminal applications. No need to install
  any gui applications.

The `tags` array in a tool script can contain positive and negative tags. A
positive is just the tag, a negative tag is written by prefixing a tag name with
a `-`.

A positive tag match will make it so that the tool is *only* installed on
instances where the user supplied that tag.

A negative tag match will prevent installation of the tool if the user supplies
that specific tag.

## setup

`./setup.sh` performs one time setup operations such as RSA key generation. This
script should not be repeated more than once per installation.
