# Disable paste on click middle button on Ubuntu

## Execute script automatically when longin

*   Clone this repo and place it where you want
*   In your terminal, enter this command line:

```bash
  xinput list | grep 'id='
```

*   In the returned list, find the name of your mouse and copy it
*   Open your `.xrinputrc` file:

```bash
  vim ~/.xrinputrc
```

*   Add execution instruction to your `.xrinputrc` file:

```
  path/of/repo/clone/disable-middle-click-paste.sh "Name of your mouse"
```

> :bulb: If you have many mouses, you can use a word contained in both mouses name like "Mouse" etc...

> :warning: But be carful this word must be contained in mouses name only. \
> You don't want the script to remap your other devices like keyboard etc...

*   Save it and restart your computer. Middle click is disable and scroll still work :heartpulse:

## Execute manually

If you want to execute the script manually you just have to enter this command:

```bash
path/of/repo/clone/disable-middle-click-paste.sh "Name of your mouse"
```
