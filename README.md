dotfiles
===

@koirand's dotfiles.

## Install

ghq のレイアウトに合わせて配置する。

```
$ ghq get koirand/dotfiles
$ cd $(ghq root)/github.com/koirand/dotfiles
$ make install
```

`make install` はこのリポジトリの位置を Makefile 自身から導出するので、
別の場所に置いても動く。
