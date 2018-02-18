# vim-mctab

### What is does:
1. displays a very simplified tabline;
2. provides a toggle tabline mapping (F3);
3. provides auto-hide of tabline (after 2 seconds of visibility);

The tabline shows the number of the tab with additional "+" character in case
one of the buffers in the tab has unsaved changes.

### What it requires:
1. VIM 8+ (uses timer)
2. "set nocompatible" in .vimrc

### How does it look:
Assuming there are 4 tabs, second and forth tabs with unsaved buffers and the
second tab currently selected, the tabline will look like this
```c
  1  [ 2+]  3    4+
```

### What is the motivation:
Usually, tablines (standard or from other plugins) show the path of the buffer
for the active window. This is fine as long as tabs are used with a single
  window.

But, when adding various number of splits per tab, this information becomes
useless and takes too much space to display. The only real information that a
tab with multiple windows can provide is it's number (to navigate quickly to
it) and whether there are any unsaved modifications and this is what this
plugin is all about.
