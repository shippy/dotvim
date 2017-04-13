The `post-checkout` hook automatically updates plugins on every checkout of `dotvim`. It was necessary to patch Vundle for this (see issue [VundleVim/Vundle#807](https://github.com/VundleVim/Vundle.vim/issue/807) and PR [VundleVim/Vundle#808](https://github.com/VundleVim/Vundle.vim/pull/808)). To take advantage of this, run:

```bash
# Assuming standard install path
ln -s ~/dotfiles/.git/modules/dotvim/hooks/post-checkout ~/dotfiles/dotvim/git-hooks/post-checkout
```

Alternatively, run the standard `dotfiles` setup (i.e. `dotty/dotty.py setup_common.json`).

If the plugins aren't updating, check if the hook is executable.
