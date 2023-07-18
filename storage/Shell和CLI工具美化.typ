#set text(
  font: ("Source Han Serif SC", "Source Han Serif")
)
#set heading(numbering: "I.1.a.")

#let tweet(bgcolor: green, text) = {
  box(width: 100%, inset: (x: 0.8em, y: 1em), fill: bgcolor.lighten(90%), [
    #text
  ])
}
#let warn(text) = {
  tweet(bgcolor: red, text)
}
#let example(text) = {
  tweet(bgcolor: blue, text)
}
#let addition(text) = {
  tweet(bgcolor: maroon, text)
}
#let important(text) = {
  tweet(bgcolor: yellow, text)
}
#let todo(text) = {
  tweet(bgcolor: black, text)
}
#let col2(a, b, gutter: 50pt) = {
  set align(center)
  grid(columns: 2, column-gutter: gutter, a, b)
}

// https://github.com/typst/typst/issues/344#issuecomment-1518710375
#let code(
    caption: none,             // content of caption bubble (string, none)
    bgcolor: rgb("#fefae0"),   // back ground color (color)
    strokecolor: 1pt + maroon, // frame color (color)
    hlcolor: auto,             // color to use for highlighted lines (auto, color)
    width: 100%,
    radius: 3pt,
    inset: 5pt,
    numbers: false,            // show line numbers (boolean)
    stepnumber: 1,             // only number lines divisible by stepnumber (integer)
    numberfirstline: false,    // if the firstline isn't divisible by stepnumber, force it to be numbered anyway (boolean)
    numberstyle: auto,         // style function to apply to line numbers (auto, style)
    firstnumber: 1,            // number of the first line (integer)
    highlight: none,           // line numbers to highlight (none, array of integer)
    content
) = {
    if type(hlcolor) == "auto" {
        hlcolor = bgcolor.darken(10%)
    }
    if type(highlight) == "none" {
        highlight = ()
    }
    block(
        width: width,
        fill: bgcolor,
        stroke: strokecolor,
        radius: radius,
        inset: inset,
        clip: false,
        {
            // Draw the caption bubble if a caption was set
            if caption != none {
                style(styles => {
                    let caption_block = block(width: auto,
                            inset: inset,
                            radius: radius,
                            fill: bgcolor,
                            stroke: strokecolor,
                            h(.5em) + raw(caption) + h(.5em))
                    place(
                        top + left,
                        dx: 0em,
                        dy: -(measure(caption_block, styles).height / 2 + inset),
                        caption_block 
                    )
                })
                // skip some vertical space to avoid the caption overlapping with
                // the beginning of the content
                v(.6em)
            }

            let (columns, align, make_row) = {
                if numbers {
                    // line numbering requested
                    if type(numberstyle) == "auto" {
                        numberstyle = text.with(style: "italic", 
                                                slashed-zero: true, 
                                                size: .6em)
                    }
                    ( ( auto, 1fr ),
                      ( right + horizon, left ),
                      e => {
                        let (i, l) = e
                        let n = i + firstnumber
                        let n_str = if (calc.rem(n, stepnumber) == 0) or (numberfirstline and i == 0) { numberstyle(str(n)) } else { none }
                        (n_str + h(.5em), raw(lang: content.lang, l))
                      }
                    )
               } else {
                    ( ( 1fr, ),
                      ( left, ),
                      e => {
                        let (i, l) = e
                        raw( lang:content.lang, l)
                      }
                    )
                }
            }
            table(
                stroke:none,
                columns: columns,
                rows: (auto,),
                gutter: 0pt,
                inset: 2pt,
                align: (col, _) => align.at(col),
                fill: (c, row) => if (row / 2 + firstnumber) in highlight { hlcolor } else { none },
                ..content
                    .text
                    .split("\n")
                    .enumerate()
                    .map(make_row)
                    .flatten()
                    .map(c => if c.has("text") and c.text == "" { v(1em) } else { c })
            )
        }
    )
}

#show link: underline

// ----------------------------------------------------------------------------

#{
  set align(center)
  strong(text(20pt)[Shell 和 CLI 工具美化])
  set align(center)
  link("https://github.com/Yestercafe")[Ivan Chien]
  linebreak()
  text[2023.7.18]
}

// ----------------------------------------------------------------------------

#outline(title: [目录])

= 前置知识

+ 你需要刚好够用的 Shell 知识
+ 你需要知道 git 和 GitHub 是什么、是干嘛用的
+ 最好完整学过 #link("https://www.bilibili.com/video/BV1uc411N7eK/")[MIT 6.NULL] 公开课，对 Linux 有一定了解

= 我使用到的和你可能同样需要的东西

+ 一台电脑
+ Linux 系统。可以装在主机上，也可以使用虚拟机。如果你是 Windows 平台亦可以使用 #link("https://learn.microsoft.com/zh-cn/windows/wsl/install")[WSL 2]。我这边使用的是 SSH 连接真实 Linux 机器的方式。
+ Linux 最好是 Ubuntu。我演示使用的可能是 Fedora。

= 使用到的软件

+ `apt`
+ `bash` / `zsh`
+ `vim`
+ `tmux`

= 使用到的初始配置

== Vim

#linebreak()
#code(caption: "~/.vimrc")[```vimrc
"" Basic
set noswf
set nobk
set title
set vb
set noeb
set t_vb=

"" Editing
syntax on
set nu
set rnu
set et
set ts=4
set sw=4
set sts=4
set mouse=a

"" Keymaps
let mapleader=' '
imap kj <Esc>
nnoremap <leader>fs :w<CR>
nnoremap <leader>fr :source %<CR>
nnoremap <leader>q :q<CR>
nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv
nnoremap H ^
nnoremap L $
nnoremap U <C-u>
nnoremap D <C-d>
nmap J <nop>
nmap s <nop>

"" 
```]

== Tmux

#linebreak()
#code(caption: "~/.tmux.conf")[```conf
unbind C-b
set -g prefix C-x
bind C-x send-prefix

# 

set-option -sa terminal-overrides ",xterm*:Tc"
set -g default-terminal "screen-256color"
```]

== Bash

如果你用的是 Ubuntu 那就用 Ubuntu 默认的 Bash 配置。

= 流程大纲

== Bash/Zsh

+ Bash、Zsh、Shell 分别都是什么？#link("https://www.zhihu.com/question/21418449/answer/2292448029")
+ Emacs
+ prompt 和 PS1
+ 安装和使用 zsh 和 oh-my-zsh
+ 如何选择？
+ fish

=== Zsh 插件

#code[```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
```]

== Vim

+ 「无缝」：
  - 终端内
  - 全键盘
  - 主键区
+ 优势
  - 高度可定制
  - leader key
+ 插件管理
+ 主题和 status line
+ 想要深入了解？#link("https://www.bilibili.com/video/BV1ko4y1A7fQ/")

== Tmux

+ 是什么
+ 有什么用/怎么用
+ 常用配置
+ 插件和 status line

= 链接

== Shell

- #link("https://bash-prompt-generator.org/")[Bash prompt generator]
- #link("https://ohmyz.sh/")[Oh-my-zsh 官网]
- #link("https://github.com/spaceship-prompt/spaceship-prompt")[spaceship prompt]
- #link("https://github.com/romkatv/powerlevel10k")[powerlevel10k]

== Vim

- #link("https://github.com/junegunn/vim-plug")[vim-plug]
- #link("https://github.com/akrawchyk/awesome-vim")[Awesome Vim]
- #link("https://github.com/vim-airline/vim-airline")[vim-airline]
- #link("https://github.com/catppuccin/vim")[Catppuccin for Vim]

== Tmux

- #link("https://github.com/tmux-plugins/tpm")[Tmux Plugin Manager]
- #link("https://github.com/gpakosz/.tmux")

== 我的相关配置

- #link("https://github.com/Yestercafe/dotfiles")
- #link("https://github.com/Yestercafe/vim")
- #link("https://github.com/Yestercafe/nvim")

= 附录

== 本篇 PDF 的源码

#link("https://github.com/lab530/lab530.github.io/blob/main/storage/Shell和CLI工具美化.typ")

== Tmux 成品配置

#linebreak()
#code(caption: "~/.tmux.conf")[```conf
# 24-bit true color
set-option -sa terminal-overrides ",xterm*:Tc"
# set -g default-terminal "screen-256color"

# Operations
set -g mouse on
unbind C-b
set -g prefix C-x
bind C-x send-prefix

# Navigation
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
bind -n S-Left  previous-window
bind -n S-Right next-window

# Index
set -g base-index 1
set -g pane-base-index 1
set-window-option -g pane-base-index 1
set -g renumber-windows on
setw -g allow-rename off
setw -g automatic-rename off

# TPM
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @catppuccin_flavour 'mocha'
set -g @plugin 'dreamsofcode-io/catppuccin-tmux'
set -g @plugin 'tmux-plugins/tmux-yank'
run '~/.tmux/plugins/tpm/tpm'

# Vi mode
## use C-[ to enter vi-mode
set-window-option -g mode-keys vi
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

# Rewrite split behavior
bind '"' split-window -v -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
```]

