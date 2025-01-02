# Ultimate Vim/Neovim Reference Guide - Part 1

## Table of Contents

1. [Most Used Commands](#most-used-commands)
2. [Vim Core Commands](#vim-core-commands)
   - [Basic Motions](#basic-motions)
   - [Text Objects](#text-objects)
   - [Operators](#operators)
3. [Modified Vim Commands](#modified-vim-commands)
4. [Custom Commands](#custom-commands)
5. [Plugin Commands](#plugin-commands)

_Note: This is Part 1 of the complete reference. Subsequent parts will cover additional sections._

## Most Used Commands

### Navigation

- `h/j/k/l` - Left/Down/Up/Right [Vim Default]
- `w/b` - Next/previous word [Vim Default]
- `e/ge` - End of word forward/backward [Vim Default]
- `gg/G` - Start/end of file [Vim Default]
- `0/$` - Start/end of line [Vim Default]
- `%` - Matching bracket [Vim Default]
- `<C-d>/<C-u>` - Half page down/up [Modified: centers cursor]
- `<leader>ff` - Find files [Custom]
- `<C-p>` - Git files [Custom]
- `gd` - Go to definition [Custom LSP]

### Quick Operations

- `i/a` - Insert before/after cursor [Vim Default]
- `o/O` - New line below/above [Vim Default]
- `dd/yy` - Delete/yank line [Vim Default]
- `cc` - Change line [Vim Default]
- `p/P` - Paste after/before [Vim Default]
- `u/<C-r>` - Undo/redo [Vim Default]
- `<leader>y` - Copy to clipboard [Custom]
- `<leader>p` - Paste from clipboard [Custom]
- `<leader>f` - Format [Custom]
- `<leader>ca` - Code actions [Custom]

## Vim Core Commands

### Basic Motions

#### Character Movement

- `h/j/k/l` - Left/Down/Up/Right
- `gj/gk` - Move through wrapped lines

#### Word Movement

- `w/W` - Start of next word/WORD
- `e/E` - End of word/WORD
- `b/B` - Previous word/WORD
- `ge/gE` - End of previous word/WORD

#### Line Movement

- `0` - Start of line
- `^` - First non-blank
- `$` - End of line
- `g_` - Last non-blank
- `+/-` - First non-blank next/previous line

#### File Movement

- `gg/G` - File start/end
- `{number}G` - Go to line
- `{/}` - Previous/next paragraph
- `(/)`- Previous/next sentence

#### Screen Movement

- `H/M/L` - High/Middle/Low screen
- `zt/zz/zb` - Current line to top/center/bottom

#### Character Finding

- `f{char}` - Find forward
- `F{char}` - Find backward
- `t{char}` - Till forward
- `T{char}` - Till backward
- `;/,` - Repeat find forward/backward

### Text Objects

#### Word Objects

- `iw/aw` - Inner/around word
- `iW/aW` - Inner/around WORD

#### Quotes/Brackets/Tags

- `i"/a"` - Inner/around double quotes
- `i'/a'` - Inner/around single quotes
- `i(/a(` - Inner/around parentheses
- `i{/a{` - Inner/around curly braces
- `i[/a[` - Inner/around square brackets
- `i</a<` - Inner/around angle brackets
- `it/at` - Inner/around tags

#### Paragraph/Sentence

- `ip/ap` - Inner/around paragraph
- `is/as` - Inner/around sentence

### Operators

- Basic Operators
  - `d` - Delete
  - `c` - Change
  - `y` - Yank (copy)
  - `>` - Indent right
  - `<` - Indent left
  - `=` - Auto indent
  - `!` - Filter through external command
  - `gq` - Format text
  - `gu/gU` - Lowercase/uppercase

# Ultimate Vim/Neovim Reference Guide - Part 2

## Visual Mode

### Mode Selection

- `v` - Character-wise visual mode [Vim Default]
- `V` - Line-wise visual mode [Vim Default]
- `<C-v>` - Block-wise visual mode [Vim Default]
- `gv` - Reselect last selection [Vim Default]

### Visual Mode Operations

- Text Operations
  - `d/x` - Delete selection
  - `y` - Yank selection
  - `c` - Change selection
  - `p` - Replace with register
  - `J` - Join lines
  - `u/U` - Lowercase/uppercase
  - `~/g~` - Toggle case
  - `>/<` - Indent/outdent
  - `=` - Auto indent
  - `:` - Start ex command for selection

### Block Mode Special Operations [Vim Default]

- `I` - Insert at start of each line
- `A` - Append at end of each line
- `c` - Change block
- `r` - Replace characters
- `d` - Delete block
- `o/O` - Move to other corner

### Visual Mode Movement [Modified]

- `J` - Move selection down [Custom]
- `K` - Move selection up [Custom]

## Search and Replace

### Basic Search [Vim Default]

- `/pattern` - Search forward
- `?pattern` - Search backward
- `n/N` - Next/previous match [Modified: centers cursor]
- `*/#` - Search word under cursor forward/backward
- `g*/g#` - Search partial word under cursor
- `<leader>nh` - Clear search highlights [Custom]

### Search Modifiers [Vim Default]

- Pattern Magic Characters:
  - `.` - Any character
  - `*` - 0 or more of previous character
  - `\+` - 1 or more of previous character
  - `\?` - 0 or 1 of previous character
  - `\{n,m}` - n to m of previous character
  - `[]` - Any character inside brackets
  - `\(\)` - Group pattern
  - `\|` - Alternative (OR)
  - `\<\>` - Word boundaries
  - `^/$` - Start/end of line

### Search Options

- `/pattern\c` - Case insensitive search
- `/pattern\C` - Case sensitive search
- `/\v` - Very magic (fewer escapes needed)
- `/\V` - Very nomagic (literal text)
- `/pattern/e` - Move cursor to end of match

### Replace Commands [Vim Default]

- Basic Replace:

  - `:s/old/new` - Replace first on line
  - `:s/old/new/g` - Replace all on line
  - `:%s/old/new/g` - Replace all in file
  - `:%s/old/new/gc` - Replace with confirmations
  - `<leader>s` - Replace word under cursor [Custom]

- Replace Flags:
  - `g` - Replace all occurrences
  - `c` - Confirm each substitution
  - `i` - Case insensitive
  - `I` - Case sensitive
  - `n` - Show count only
  - `e` - No error if pattern not found

### Global Commands [Vim Default]

- `:g/pattern/cmd` - Execute cmd on matching lines
- `:g!/pattern/cmd` - Execute cmd on non-matching lines
- `:v/pattern/cmd` - Same as :g!
- Common Uses:
  - `:g/pattern/d` - Delete matching lines
  - `:g/pattern/t$` - Copy matching lines to end
  - `:g/pattern/m$` - Move matching lines to end
  - `:g/pattern/normal @q` - Run macro on matches

## Marks

### Local Marks [Vim Default]

- `ma` to `mz` - Set mark
- `` `a `` to `` `z `` - Jump to mark position
- `'a` to `'z` - Jump to mark line

### Global Marks [Vim Default]

- `mA` to `mZ` - Set global mark
- `` `A `` to `` `Z `` - Jump to global mark
- `'A` to `'Z` - Jump to global mark line

### Special Marks [Vim Default]

- `` `. `` - Last change position
- `` `" `` - Last exit position in current buffer
- `` `^ `` - Last insert position
- ``` `[ ``] ``` - Start/end of last change/yank
- ``` `< ``> ``` - Start/end of last visual selection
- `` `0 `` - Position in last edited file

### Mark Commands [Vim Default]

- `:marks` - List all marks
- `:delmarks a` - Delete mark a
- `:delmarks!` - Delete all lowercase marks
- `:delmarks a-d` - Delete marks a through d

## Registers

### Register Types [Vim Default]

- Unnamed register (`""`)

  - Last delete or yank
  - Used when no register specified

- Numbered registers (`"0` to `"9`)

  - `"0` - Last yank
  - `"1` to `"9` - Last deletes

- Named registers (`"a` to `"z`)

  - Explicitly specified storage
  - Append with uppercase (`"A` to `"Z`)

- Special registers
  - `"+` - System clipboard [Used in customs]
  - `"*` - Selection clipboard
  - `"_` - Black hole (null) register
  - `"/` - Last search pattern
  - `":` - Last command
  - `".` - Last inserted text
  - `"%` - Current filename
  - `"#` - Alternate filename
  - `"=` - Expression register

### Register Operations [Vim Default]

- `"xy` - Yank into register x
- `"xp` - Put from register x
- `:reg` - Show registers
- `:reg x` - Show register x
- `Ctrl-r x` - Insert register x in insert mode

### Custom Register Operations

- `<leader>y` - Yank to clipboard [Custom]
- `<leader>Y` - Yank line to clipboard [Custom]
- `<leader>p` - Paste from clipboard [Custom]
- `<leader>P` - Paste before from clipboard [Custom]
- `<leader>d` - Delete to black hole register [Custom]

# Ultimate Vim/Neovim Reference Guide - Part 3

## Window Management

### Split Creation

Default Commands:

- `:sp[lit]` or `<C-w>s` - Split horizontally
- `:vs[plit]` or `<C-w>v` - Split vertically
- `:new` - New horizontal split with empty buffer
- `:vnew` - New vertical split with empty buffer
- `<C-w>T` - Move window to new tab

Custom Commands:

- `<leader>sv` - Split vertical [Custom]
- `<leader>sh` - Split horizontal [Custom]
- `<leader>se` - Make splits equal size [Custom]
- `<leader>sx` - Close current split [Custom]

### Window Navigation

Default Commands:

- `<C-w>h/j/k/l` - Move to left/down/up/right window
- `<C-w>w` - Cycle through windows
- `<C-w>p` - Go to previous window
- `<C-w>t` - Go to top-left window
- `<C-w>b` - Go to bottom-right window
- `<C-w>H/J/K/L` - Move window to far left/bottom/top/right

### Window Resizing

Default Commands:

- `<C-w>=` - Make all windows equal size
- `<C-w>_` - Maximize height
- `<C-w>|` - Maximize width
- `<C-w>+` - Increase height
- `<C-w>-` - Decrease height
- `<C-w>>` - Increase width
- `<C-w><` - Decrease width
- `{n}<C-w>_` - Set height to n
- `{n}<C-w>|` - Set width to n

Custom Commands:

- `<C-w>,` - Decrease width [Custom]
- `<C-w>.` - Increase width [Custom]

## Buffer Operations

### Buffer Navigation

Default Commands:

- `:ls` or `:buffers` - List buffers
- `:b{n}` - Go to buffer n
- `:bn` - Next buffer
- `:bp` - Previous buffer
- `:bf` - First buffer
- `:bl` - Last buffer
- `:ba` - Open all buffers
- `:{n}bd` - Delete buffer n
- `:bd` - Delete current buffer
- `:bufdo {cmd}` - Execute command on all buffers

Custom Commands (via Telescope):

- `<leader>fb` - Find buffers [Custom]

### Buffer Management

Default Commands:

- `:w` - Write buffer
- `:e {file}` - Edit file in new buffer
- `:saveas {file}` - Save buffer as file
- `:r {file}` - Read file into buffer
- `:bufdo w` - Write all buffers
- `:wa` - Write all buffers
- `:qa` - Quit all buffers

## Plugin Commands

### Telescope

#### File Navigation

Default Commands:

- `:Telescope find_files` - Find files
- `:Telescope live_grep` - Live grep
- `:Telescope git_files` - Git files
- `:Telescope oldfiles` - Recent files
- `:Telescope grep_string` - Search current word

Custom Keymaps:

- `<leader>ff` - Find files [Custom]
- `<C-p>` - Git files [Custom]
- `<leader>lg` - Live grep [Custom]
- `<leader>pws` - Search current word [Custom]
- `<leader>pWs` - Search current WORD [Custom]
- `<leader>fb` - Find buffers [Custom]
- `<leader>fh` - Help tags [Custom]

#### Telescope Window Commands

- `<C-n/p>` - Next/previous selection
- `<C-c>` - Close telescope
- `<CR>` - Confirm selection
- `<C-x>` - Split horizontal
- `<C-v>` - Split vertical
- `<C-t>` - Open in new tab
- `<C-u/d>` - Preview scroll
- `<Tab>` - Toggle selection
- `<C-q>` - Send to quickfix
- `<M-q>` - Send selected to quickfix

### Trouble

Default Commands:

- `:Trouble` - Open trouble window
- `:Trouble workspace_diagnostics`
- `:Trouble document_diagnostics`
- `:Trouble quickfix`
- `:Trouble loclist`
- `:Trouble lsp_references`

Custom Keymaps:

- `<leader>xx` - Toggle diagnostics [Custom]
- `<leader>xX` - Buffer diagnostics [Custom]
- `<leader>cs` - Symbols [Custom]
- `<leader>cl` - LSP [Custom]
- `<leader>xL` - Location List [Custom]
- `<leader>xQ` - Quickfix List [Custom]
- `[t/]t` - Navigate issues [Custom]

### Nvim-Tree

Default Commands:

- File Operations:
  - `o` or `<CR>` - Open file/directory
  - `a` - Create file/directory
  - `d` - Delete
  - `r` - Rename
  - `x` - Cut
  - `c` - Copy
  - `p` - Paste
  - `R` - Refresh
  - `?` - Help

Custom Keymaps:

- `<leader>ee` - Toggle explorer [Custom]
- `<leader>ef` - Find current file [Custom]
- `<leader>ec` - Collapse [Custom]
- `<leader>er` - Refresh [Custom]

### LSP

Default Commands:

- Hover/Information:
  - `:LspInfo` - Show LSP information
  - `:LspLog` - Show LSP log
  - `:LspRestart` - Restart LSP
  - `:LspStart` - Start LSP
  - `:LspStop` - Stop LSP

Custom Keymaps:

- `gd` - Go to definition [Custom]
- `gD` - Go to declaration [Custom]
- `gr` - Go to references [Custom]
- `gi` - Go to implementation [Custom]
- `K` - Hover documentation [Custom]
- `<leader>ca` - Code actions [Custom]
- `<leader>rn` - Rename [Custom]
- `<leader>D` - Buffer diagnostics [Custom]
- `<leader>d` - Line diagnostics [Custom]
- `[d/]d` - Previous/next diagnostic [Custom]
- `<leader>rs` - Restart LSP [Custom]

### Auto-session

Custom Keymaps:

- `<leader>wr` - Restore session [Custom]
- `<leader>ws` - Save session [Custom]

### Snacks

Custom Keymaps:

- `<leader>gg` - LazyGit [Custom]
- `<leader>z` - Zen mode [Custom]
- `<leader>gB` - Git browse [Custom]
- `<leader>gb` - Git blame line [Custom]
- `<leader>gf` - LazyGit file [Custom]
- `<leader>un` - Dismiss notifications [Custom]

### Conform (Formatting)

Custom Keymaps:

- `<leader>f` - Format file/selection [Custom]

### Nvim-cmp (Completion)

Default Behavior:

- Automatic completion popup
- Documentation floating window

Custom Keymaps:

- `<C-k>` - Previous item [Custom]
- `<C-j>` - Next item [Custom]
- `<C-b>` - Scroll docs up [Custom]
- `<C-f>` - Scroll docs down [Custom]
- `<C-Space>` - Complete [Custom]
- `<C-e>` - Close [Custom]
- `<CR>` - Confirm [Custom]
