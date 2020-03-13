
# A reasonable Emacs config

This is an emacs configuration tree.
Some Windows users might need to follow
[these instructions](http://xn--9dbdkw.se/diary/how_to_enable_GnuTLS_for_Emacs_24_on_Windows/index.en.html)
to get TLS (ie. SSL) support included in their Emacs.
>>>>>>> 71db52615191b88b997a795119ae9a3318a4f243

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
