#!/bin/bash

# Copyright (C) 2014  Nicolas Lamirault <nicolas.lamirault@gmail.com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

COPYRIGHT="Nicolas Lamirault <nicolas.lamirault@gmail.com>"
VERSION="0.1.0"

GOENVWRAPPER_HOME=$HOME/.goenvs

SCRIPT=$(readlink -f $0)
GOENVWRAPPER_PATH=`dirname $SCRIPT`
echo $GOENVWRAPPER_PATH
if [ "$GOENVWRAPPER_GO" = "" ]
then
    GOENVWRAPPER_GO="$(command \which go)"
fi


# function listenvs {
#     projects=`ls -d $GOENVWRAPPER_HOME/`
#     echo $projects
#     for name in $projects
#     do
#         echo $name
#     done
# }


function write-activate {
    project=$1
    env=$2
    cat << ACTIVATE > $env/bin/activate
export GOPATH="$env"
export PATH="\$GOPATH/bin:\$PATH"
export PS1="($project)\$PS1"
ACTIVATE
}



function goenv-workon {
    name=$1
    if [ -z "$name" ]
    then
        echo "Usage: $0 goenv-workon <name>"
    else
        if [ ! -d "$GOENVWRAPPER_HOME/$name" ]
        then
            echo "Error: unavailable environment $name"
        else
            goenv="$GOENVWRAPPER_HOME/$name"
            echo "Go env: $goenv"
            write-activate $name "$goenv"
            echo "Ready to $name. Run: source $goenv/bin/activate"
        fi
    fi
}

function goenv-activate {
    echo $GOPATH
    unset GOPATH
    echo $GOPATH
    #export $GOPATH
}

function goenv-make {
    name=$1
    if [ -z "$name" ]
    then
        echo "Usage: $0 mkgoenv <name>"
    else
        if [ ! -d "$GOENVWRAPPER_HOME/$name" ]
        then
            mkdir -p $GOENVWRAPPER_HOME/$name/bin
            goenv-workon $name
        else
            echo "ERROR: $name already exists."
        fi
    fi
}

function goenv-delete {
    name=$1
    if [ -z "$name" ]
    then
        echo "Usage: $0 rmgoenv <name>"
    else
        if [ -d "$GOENVWRAPPER_HOME/$name" ]
        then
            rm -fr $GOENVWRAPPER_HOME/$name
        fi
    fi
}


function goenv-help {
    echo "Usage: $0 <command>"
    echo "Commands:"
    echo "  goenv-make       :    Creates a new virtual environment for a Go project"
    echo "  goenv-delete     :    Delete an existing virtual environment"
    echo "  goenv-workon     :    Activate an existing virtual environment "
    echo "  goenv-deactivate :    Deactivate an existing virtual environment "
    echo "  goenv-list       :    List available environments"
}

function goenv-version {
    echo "$0 v$VERSION"
    echo "Copyright (c) $COPYRIGHT"
}


# if [ $# -eq 0 ]
# then
#     help
#     exit 0
# fi

# case $1 in
#     mkgoenv)
#         mkgoenv $2
#         ;;
#     rmgoenv)
#         rmgoenv $2
#         ;;
#     workon)
#         goworkon $2
#         ;;
#     deactivate)
#         deactivate $2
#         ;;
#     # list)
#     #     listenvs
#         # ;;
#     version)
#         version
#         ;;
#     *)
#         help
#         ;;
# esac
