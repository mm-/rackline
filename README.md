# Rackline

Gem for interacting with the Rackspace Cloud via command line

## Installation

Add this line to your application's Gemfile:

    gem 'rackline'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rackline

## Usage
Usage: rackline [options] server_name

CLI control of Rackspace Cloud servers

v0.0.1

Options:
        --version                    Show help/version info
        --username un                Connect with specified username
        --api_key ak                 Connect with specified api_key
    -n, --namesearch level           Search cloudservers by name. Output Levels: base, id_only, or full_info
    -r, --reboot type                Reboots specified server ID. Reboot Types: hard, soft
    -p, --passwd new_password        Changes root password for specified ID
    -c, --changename new_name        Changes the server name (not the hostname!) for the specified ID
        --log-level LEVEL            Set the logging level
                                     (debug|info|warn|error|fatal)
                                     (Default: info)

Arguments:

    server_name
        Server name or ID

