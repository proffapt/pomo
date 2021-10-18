# pomo
Almost the simplest pomodoro timer CLI for Linux

### Installation
Attention: Always inspect scripts before running

With sound notifications:
```bash
curl https://raw.githubusercontent.com/Tashima42/pomo/main/install-pomo-sound.sh | bash 
```
Without sound notifications:
```bash
curl https://raw.githubusercontent.com/Tashima42/pomo/main/pomo.sh > ~/.local/bin/pomo && sudo chmod +x ~/.local/bin/pomo
```

Uninstall:
```bash
rm ~/.local/bin/pomo
```

### Usage

```
Usage: pomo [options] focus break long_break breaks_until_long
    options            -h: display help message
    focus              Minutes of focus until break      | Default = 25
    break              Minutes of break until focus      | Default = 5
    long_break         Minutes of long break until focus | Default = 15
    breaks_until_long  Number of breaks until long break | Default = 4
```
