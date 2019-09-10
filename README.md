### brew remote switcher
1. 1-click brew remote repository switcher.
2. simple bash wrapper to switch brew remote repositoy to china tsinghua mirror or set to original default.
### run directly without git clone or download to local firstly
- sh -c "$(curl -fsSL https://raw.githubusercontent.com/lilongen/brew-remote-switch/master/brswitch.sh)" "" tsinghua
- sh -c "$(curl -fsSL https://raw.githubusercontent.com/lilongen/brew-remote-switch/master/brswitch.sh" "" default

### download to local and run
- curl -Lo brswitch.sh https://raw.githubusercontent.com/lilongen/brew-remote-switch/master/brswitch.sh
- git clone https://github.com/lilongen/brew-remote-switch.git
- ./brswitch.sh tsinghua
- ./brswitch.sh default
