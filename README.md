goenvwrapper
============

Manage Golang virtual environments.

## Features

* Organizes all of your virtual environments in one place.
* Wrappers for managing your virtual environments (create, delete, copy).
* Use a single command to switch between environments.

## Usage

* Load `goenvwrapper.sh`:

```bash
$ source goenvwrapper.sh
```

* Creates a virtual environment :

```bash
$ goenv-make goo
goenv-make foo
Go env: /home/nlamirault/.goenvs/foo
Ready to foo. Run: source /home/nlamirault/.goenvs/foo/bin/activate
```

* Activate a virtual environment:

```bash
$ source /home/nlamirault/.goenvs/foo/bin/activate
(foo) $ echo $GOPATH
/home/nlamirault/.goenvs/foo
```

* Delete a virtual environment :

```bash
$ goenv-delete foo
$ ls ~/.goenvs/foo
ls: cannot access /home/nlamirault/.goenvs/foo: No such file or directory

```

## Support

Feel free to ask question or make suggestions in our [Issue Tracker][].


## Contribute

See [here](CONTRIBUTING.md)

## License

Scame is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

Scame is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

See [COPYING][] for the complete license.


## Changelog

A changelog is available [here](ChangeLog.md).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>


[COPYING]: https://github.com/nlamirault/goenvwrapper/blob/master/COPYING
[Issue tracker]: https://github.com/nlamirault/goenvwrapper/issues
