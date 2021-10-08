# pomo
Almost the simplest pomodoro timer CLI for Linux

### Installation
```bash
sudo sh -c "curl https://raw.githubusercontent.com/Tashima42/pomo/main/pomo.sh > /usr/local/bin/pomo" && sudo chmod +x /usr/local/bin/pomo
```

Uninstall:
```bash
sudo rm /usr/local/bin/pomo
```

### Usage

```bash
Usage: pomo [focus] [break] [long_break] [breaks_until_long]
    focus                 Minutes of focus until break      | Default = 25
    break                 Minutes of break until focus      | Default = 5
    long_break            Minutes of long break until focus | Default = 15
    breaks_until_long     Number of breaks until long break | Default = 4
```
