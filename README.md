# Helpful Bash Scripts

## Tested on Linux Debian 10 and Ubuntu 18
## Should work on Mac and Windows(Provided you are using GitBash)

## Instructions for Shell Scripts
1. To use the scripts put them in a folder I usually put mine in `~/.
bash_scripts`
2. Make them executeable `chmod +x ~/.bash_scripts/* -R`
3. Run the script you want to run eg.. `bash ~/.bash_scripts/setup-react.sh` or Double Click it.
4. You can create aliases for them as well

## Instructions for Aliases
1. You can put them in `~/.bashrc` or `~/.bash_aliases`
2. `alias cra ='~/.bash_scripts/setup-react.sh`
- This will run the script in your current folder.

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
