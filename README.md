# motis-m - Command Line Interface to MOTIS Routing Services

**motis-m** is a commandline client and Perl module for the arrival/departure
component of MOTIS routing interfaces. It can show the arrivals/departures at a
specific public transit stop, give details on individual trips, and look up
stops by name or geo coordinates. It supports text and JSON output.

This README documents installation of motis-m and the associated
Travel::Status::MOTIS Perl module.  See the [Travel::Status::MOTIS
homepage](https://finalrewind.org/projects/Travel-Status-MOTIS) and [motis-m
manual](https://man.finalrewind.org/1/motis-m) for a feature overview and usage
instructions.

## Installation

You have five installation options:

* `.deb` releases for Debian-based distributions
* finalrewind.org APT repository for Debian-based distributions
* Installing the latest release from CPAN
* Installation from source
* Using a Docker image

Except for Docker, __motis-m__ will be available in your PATH after
installation.  You can run `motis-m --version` to verify this. Documentation is
available via `man motis-m`.

### Release Builds for Debian

[lib.finalrewind.org/deb](https://lib.finalrewind.org/deb) provides Debian
packages of all release versions. Note that these are not part of the official
Debian repository and are not covered by its quality assurance process.

To install the latest release, run:

```
wget https://lib.finalrewind.org/deb/libtravel-status-motis-perl_latest_all.deb
sudo apt install ./libtravel-status-motis-perl_latest_all.deb
rm libtravel-status-motis-perl_latest_all.deb
```

Uninstallation works as usual:

```
sudo apt remove libtravel-status-motis-perl
```

### finalrewind.org APT repository

[lib.finalrewind.org/apt](https://lib.finalrewind.org/apt) provides an APT
repository with Debian packages of the latest release versions. Note that this
is not a Debian repository; it is operated under a best-effort SLA and if you
use it you will have to trust me not to screw up your system with bogus
packages. Also, note that the packages are not part of the official Debian
repository and are not covered by its quality assurance process.

To set up the repository and install the latest Travel::Status::MOTIS
release, run:

```
curl -s https://finalrewind.org/apt.asc | sudo tee /etc/apt/trusted.gpg.d/finalrewind.asc
echo 'deb https://lib.finalrewind.org/apt stable main' | sudo tee /etc/apt/sources.list.d/finalrewind.list
sudo apt update
sudo apt install libtravel-status-motis-perl
```

Afterwards, `apt update` and `apt upgrade` will automatically install new
Travel::Status::MOTIS releases.

Uninstallation of Travel::Status::MOTIS works as usual:

```
sudo apt remove libtravel-status-motis-perl
```

To remove the APT repository from your system, run:

```
sudo rm /etc/apt/trusted.gpg.d/finalrewind.asc \
        /etc/apt/sources.list.d/finalrewind.list
```

### Installation from CPAN

Travel::Status::MOTIS releases are published on the Comprehensive Perl Archive
Network (CPAN) and can be installed using standard Perl module tools such as
`cpanminus`.

Before proceeding, ensure that you have standard build tools (i.e. make,
pkg-config and a C compiler) installed. You will also need the following
libraries with development headers:

* libssl
* zlib

Now, use a tool of your choice to install the module. Minimum working example:

```
cpanm Travel::Status::MOTIS
```

If you run this as root, it will install script and module to `/usr/local` by
default. There is no well-defined uninstallation procedure.

### Installation from Source

In this variant, you must ensure availability of dependencies by yourself.
You may use carton or cpanminus with the provided `Build.PL`, Module::Build's
installdeps command, or rely on the Perl modules packaged by your distribution.
On Debian 10+, all dependencies are available from the package repository.

To check whether dependencies are satisfied, run:

```
perl Build.PL
```

If it complains about "... is not installed" or "ERRORS/WARNINGS FOUND IN
PREREQUISITES", it is missing dependencies.

Once all dependencies are satisfied, use Module::Build to build, test and
install the module. Testing is optional -- you may skip the "Build test"
step if you like.

If you downloaded a release tarball, proceed as follows:

```
./Build
./Build test
sudo ./Build install
```

If you are using the Git repository, use the following commands:

```
git submodule update --init
./Build
./Build manifest
./Build test
sudo ./Build install
```

Note that system-wide installation does not have a well-defined uninstallation
procedure.

If you do not have superuser rights or do not want to perform a system-wide
installation, you may leave out `Build install` and use **motis-m** from the
current working directory.

With carton:

```
carton exec motis-m --version
```

Otherwise (also works with carton):

```
perl -Ilocal/lib/perl5 -Ilib bin/motis-m --version
```

### Running motis-m via Docker

A motis-m image is available on Docker Hub. It is intended for testing
purposes: due to the latencies involved in spawning a container for each
motis-m invocation, it is less convenient for day-to-day usage.

Installation:

```
docker pull derfnull/motis-m:latest
```

Use it by prefixing motis-m commands with `docker run --rm
derfnull/motis-m:latest`, like so:

```
docker run --rm derfnull/motis-m:latest --version
```

Documentation is not available in this image. Please refer to the
[online motis-m manual](https://man.finalrewind.org/1/motis-m/) instead.
