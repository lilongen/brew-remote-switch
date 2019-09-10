### brew remote switcher
- 1-click brew remote repository switcher.
- simple bash wrapper to switch brew remote repositoy to china tsinghua mirror or set to original default.

### run directly without git clone or download to local firstly
- switch brew remote repository to china tsinghua mirror
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lilongen/brew-remote-switch/master/brswitch.sh)" "" tsinghua
```
- switch brew remote repository to original default
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/lilongen/brew-remote-switch/master/brswitch.sh" "" default
```

### download to local and run
- download or git clone
```shell
curl -Lo brswitch.sh https://raw.githubusercontent.com/lilongen/brew-remote-switch/master/brswitch.sh
```
or
```shell
git clone https://github.com/lilongen/brew-remote-switch.git
```
- switch brew remote repository to china tsinghua mirror
```shell
./brswitch.sh tsinghua
```
- switch brew remote repository to original default
```shell
./brswitch.sh default
```
