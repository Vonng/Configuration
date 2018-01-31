# shit: shell-it

bash util library 

## Feature

* Cross platform: Linux & Darwin
* Useful


## Requirement

* Bash 4.x 

since macOS use bash 3.x by default, you may consider upgrade to bash 4.x in macOS
```bash
# Step 1 : Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Step 2 : Install Bash via homebrew
brew update && brew install bash

# Step 3 : Register 4.x bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'

# Step 4 : Change your default bash
chsh -s /usr/local/bin/bash

# Notice : use `#!/usr/bin/env bash` instead of `#!/bin/bash`
```


## Install

```shell
make
```


## Directory

```bash


~/.shit             # main directory
~/.shit/main        # plugins manager
~/.shit/shitrc      # startup scripts
~/.shit/lib/        # standard library

```

## Example

```bash



```