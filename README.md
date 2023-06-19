# Upkg

- [Upkg](#upkg)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
    - [Uninstall](#uninstall)
  - [Usage](#usage)
  - [Configuration](#configuration)


Upkg is a package manager tool that simplifies the installation and updating of various packages from different sources, such as Homebrew, npm, and Dart. It allows you to define your package dependencies in a unified configuration file and easily install or update them with a single command.

## Prerequisites

Clone the repository:

```sh
git clone git@github.com:errorempire/upkg.git
```

Install the necessary dependencies:

```sh
bin/setup deps
```

## Installation

Build the gem:

```sh
bin/setup build
```

Install the gem:

```sh
bin/setup install
```

### Uninstall

```sh
bin/setup uninstall
```

## Usage

Define your package dependencies in the `packages.upkg` file. Here's an example format:

```toml
[[source]]
name = "homebrew"
packages = ["google-chrome"]

[[source]]
name = "npm"
packages = ["typescript"]
```

Run the Upkg command to install the packages:

```sh
bin/upkg --install
```

To update the installed packages to their latest versions, run the following command:

```sh
bin/upkg --update
```

For more information on the available commands, run the following command:

```sh
bin/upkg --help
```

## Configuration

Upkg provides localization support through YAML files. You can customize the text and messages displayed by Upkg by modifying the YAML files in the `config/locales` directory.
