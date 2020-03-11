# Helpful Bash Scripts

## Tested on Linux Debian 10 and Ubuntu 18
## Should work on Mac and Windows(Provided you are using GitBash)

## Instructions for Shell Scripts
1. To use the scripts put clone this repo into your home folder
2. Make a symbolic link for aliases (linux) `ln -sv ./.bash_scripts/bash_aliases ~/.bash_aliases`
3. Make them executeable (linux) `chmod +x ~/.bash_scripts/* -R`
4. Run the script you want to run eg.. `bash ~/.bash_scripts/setup-react.sh` or Double Click it.
5. You can create aliases for them as well

## Instructions for Aliases
1. You can put them in `~/.bashrc` or `~/.bash_aliases`
2. `alias cra ='~/.bash_scripts/setup-react.sh`
- This will run the script in your current folder.

## Make sudo run with no password
1. Edit `/etc/sudoers`
2. Add `YourUsernameHere  ALL=(ALL) NOPASSWD: ALL`
3. `source /etc/sudoers/` or open a new terminal.

## Scripts
1. Setup React App With Working Navigation
- Asks for App Name
- Installs React Router
- Creates Files (With Content)
  * AppRouter
  * Private Route
  * NavBar
  * Header
  * Footer
  * Home
  * About
  * Contact
- Rewrites app and index.js
2. Git Create Branch
- Asks for branch name
- Creates a new branch
- Sets the upstream for the branch
3. Git Deploy
- Asks for a Commit message
- Adds files
- Commits files with commit message
- Pushes files to current branch as long as the upstream is set
4. Clean Node Modules
- Digs down deep to remove node modules folders
