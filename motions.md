## VIM motions reference

## General Motions

- `h`: Move left.
- `l`: Move right.
- `j`: Move down.
- `k`: Move up.
- `0`: Move to the beginning of the current line.
- `^`: Move to the first non-whitespace character of the line.
- `$`: Move to the end of the current line.

---

## Word Motions

- `w`: Move to the beginning of the next word.
- `W`: Move to the beginning of the next word (ignores punctuation).
- `e`: Move to the end of the current/next word.
- `E`: Move to the end of the current/next word (ignores punctuation).
- `b`: Move to the beginning of the previous word.
- `B`: Move to the beginning of the previous word (ignores punctuation).
- `ge`: Move to the end of the previous word.
- `gE`: Move to the end of the previous word (ignores punctuation).

---

## Sentence and Paragraph Motions

- `(`: Move to the beginning of the current/previous sentence.
- `)`: Move to the beginning of the next sentence.
- `{`: Move to the beginning of the current/previous paragraph.
- `}`: Move to the beginning of the next paragraph.

---

## Search Motions

- `/pattern`: Search forward for `pattern`.
- `?pattern`: Search backward for `pattern`.
- `n`: Repeat the last search in the same direction.
- `N`: Repeat the last search in the opposite direction.
- `*`: Search forward for the word under the cursor.
- `#`: Search backward for the word under the cursor.
- `g*`: Search forward for the partial word under the cursor.
- `g#`: Search backward for the partial word under the cursor.

---

## Mark Motions

- `'x`: Move to the beginning of the line marked by `x`.
- `` `x ``: Move to the exact position marked by `x`.
- `'[`: Move to the beginning of the last changed or yanked text.
- `']`: Move to the end of the last changed or yanked text.
- `` `[ ``: Move to the beginning of the last changed or yanked text (exact position).
- `` `] ``: Move to the end of the last changed or yanked text (exact position).

---

## Line Motions

- `gg`: Move to the beginning of the file.
- `G`: Move to the end of the file.
- `nG`: Move to line `n`.
- `H`: Move to the top of the screen.
- `M`: Move to the middle of the screen.
- `L`: Move to the bottom of the screen.

---

## Screen Motions

- `Ctrl-d`: Move half a screen down.
- `Ctrl-u`: Move half a screen up.
- `Ctrl-f`: Move a full screen down.
- `Ctrl-b`: Move a full screen up.
- `zz`: Center the current line in the middle of the screen.
- `zt`: Move the current line to the top of the screen.
- `zb`: Move the current line to the bottom of the screen.

---

## Text Object Motions

### Word and Sentence Objects

- `aw`: A word (including trailing space).
- `iw`: Inner word (excluding trailing space).
- `as`: A sentence (including trailing space).
- `is`: Inner sentence (excluding trailing space).

### Paragraph Objects

- `ap`: A paragraph (including trailing newline).
- `ip`: Inner paragraph (excluding trailing newline).

### Bracket and Tag Objects

- `a(` or `ab`: A pair of parentheses (including parentheses).
- `i(` or `ib`: Inner parentheses (excluding parentheses).
- `a{` or `aB`: A pair of curly braces (including braces).
- `i{` or `iB`: Inner curly braces (excluding braces).
- `at`: A tag block (including the tags).
- `it`: Inner tag block (excluding the tags).

### Quote Objects

- `a"`: A double-quoted string (including quotes).
- `i"`: Inner double-quoted string (excluding quotes).
- `a'`: A single-quoted string (including quotes).
- `i'`: Inner single-quoted string (excluding quotes).

---

## Advanced Motions with Plugins

### Surround Motions (requires **vim-surround**)

- `ys<motion><char>`: Surround the selected motion with `<char>`.
- `ds<char>`: Delete surrounding `<char>`.
- `cs<from><to>`: Change surrounding `<from>` to `<to>`.

### Multiple Cursors (requires **vim-multiple-cursors**)

- `Ctrl-n`: Select the next occurrence of the word under the cursor.
- `Ctrl-p`: Select the previous occurrence of the word under the cursor.
- `Ctrl-x`: Skip the current occurrence and move to the next.

---

## Tips

1. Combine motions with operators like `d` (delete), `c` (change), or `y` (yank).  
   Example: `daw` deletes a word, `ci"` changes the content inside quotes.
2. Use `:help <motion>` in Neovim to get detailed explanations for any motion.
