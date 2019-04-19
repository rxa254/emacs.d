# A reasonable Emacs config

This is an emacs configuration tree.

* Flycheck or Flymake ?
* melpa or elpa ?
* what about daemons to reduce startup time?
* should i use Prelude ?
* is Aquamacs any better than vanilla emacs?


## Installation

To install, clone this repo to `~/.emacs.d`, i.e. ensure that the
`init.el` contained in this repo ends up at `~/.emacs.d/init.el`:

```
git clone https://github.com/rxa254/emacs.d.git ~/.emacs.d
```

Upon starting up Emacs for the first time, further third-party
packages will be automatically downloaded and installed. If you
encounter any errors at that stage, try restarting Emacs, and possibly
running `M-x package-refresh-contents` before doing so.


## Useful links
* https://www.emacswiki.org/emacs/EmacsForMacOS
* http://thegreyblog.blogspot.com/2017/12/starting-emacs-daemon-automatically-at.html
* https://www.emacswiki.org/emacs/AquamacsFAQ
