# REFERENCE
# https://thevaluable.dev/zsh-completion-guide-examples/

fpath=($DOTFILES_PATH/zsh-plugins/zsh-completions/src $fpath)
fpath=($DOTFILES_PATH/terminal/zsh/completions $fpath)
zmodload zsh/complist
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files


# To configure the completion system, you can use zstyle patterns following this template:
# :completion:<function>:<completer>:<command>:<argument>:<tag>
# The substring separated with colons : are called components. Let’s look at the ones used for the completion system in details:

# - completion - String acting as a namespace, to avoid pattern collisions with other scripts also using zstyle.
# - <function> - Apply the style to the completion of an external function or widget.
# - <completer> - Apply the style to a specific completer. We need to drop the underscore from the completer’s name here.
# - <command> - Apply the style to a specific command, like cd, rm, or sed for example.
# - <argument> - Apply the style to the nth option or the nth argument. It’s not available for many styles.
# - <tag> - Apply the style to a specific tag.

#####################Defining the Completers#######################

# _complete - This is the main completer we need to use for our completion.
# _approximate - This one is similar to _complete, except that it will try to correct what you’ve typed already (the context) if no match is found.
# _expand_alias - Expand an alias you’ve typed. It needs to be declared before _complete.
# _extensions - Complete the glob *. with the possible file extensions.

# Note that you can use _expand_alias with the keystroke CTRL+x a by default, without the need to use it as a completer. Simply type one of your alias in Zsh and try to use the keystroke.

# You need to set the zstyle completer to define the completer you want to use. The order matter: the completion system will try each of these completer one after the other. The completion stop when some matches are found or when the completer stop it by itself.

zstyle ':completion:*' completer _extensions _complete _approximate

# Since we’re dabbling into the completion system, the completer _complete_help might come in handy. You can use it as a function you can call with CTRL+x h by default.

# When you’re not sure why you end up with some matches and not others, you can hit CTRL+x h (for help) before completing your command. It will display some information about what the completion system will do to complete your context.


#####################Caching the Completion#######################
# Using a cache for the completion can speed up some commands, like apt for example. Let’s add the following in our file to enable it:

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

#####################Completion Menu#######################
# Instead of going through each match blindly to add what you want to your command, you can use a completion menu. For that, you need to set the style menu with the value select as follows:
zstyle ':completion:*' menu select
# You can also use this menu only if a precise <number> of matches is found with select=<number>. It’s even possible to start the menu selection only if the list of matches doesn’t fit the screen, by using the value select=long. Using both values select=<number> and select=long is possible too.

# Having the values select and interactive allows you to filter the completion menu itself using the completion system. You can also configure a keystroke to switch this interactive mode when the completion menu is displayed. More on that later in this article.

# Adding the value search to the style will allow you to fuzzy-search the completion menu. Again, a keystroke can be configured to have this functionality on demand.

#####################Formatting The Display#######################
#####################Colors and Decoration#######################

# Let’s now improve the display of our completion menu using the style format.

# Each completer can define different sequences (beginning with %) for different tags. For example:

zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'

# As we saw quickly above, a tag is most of the time a type of match. More generally, you can see it as a type of information displayed during completion. Here, the descriptions tag is specific to the format style. It generates descriptions depending on the type of match. For example, if you have files displayed in the completion menu, the description for the tag “files” will be displayed too.

# The value of format is used for displaying these descriptions. Here, we use in the style’s value the sequence %d which will be replaced by the description itself.

# If you’re using the completer _approximate, you can set the format of the possible corrections too. For example:

# zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
# Here’s the result:

# To format messages or warnings (for example when no match is found), you can add the following:

zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found 😒😒😒 --%f'

# We can use the escape sequence %F %f in the style’s value to use a foreground color. Here’s a summary of sequences you can use:

# %F{<color>} %f - Change the foreground color with <color>.
# %K{<color>} %k - Change the background color with <color>.
# %B %b - Bold.
# %U %u - Underline.
# For example, you can create a horrible display as follows:

# zstyle ':completion:*:descriptions' format '%U%K{yellow} %F{green}-- %F{red} %BNICE!1! %b%f %d --%f%k%u'
# Your descriptions are now a piece of art.

#####################Grouping Results#######################

# To group the different type of matches under their descriptions, you can add the following:

zstyle ':completion:*' group-name ''

# With the value of this style set with an empty string, the matches will be grouped under the descriptions depending on their types:

# If you’re not satisfied by the order these descriptions are displayed, you can modify it too. For example:

# zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
# Here, -command- means any word in the “command position”. It means that we want the matches tagged alias to appear before builtins, functions, and commands.

#####################Detailed List of Files and Folders#######################
# The style file-list can display the list of files and folder matched with more details, similar to the information you can display with ls -l.
# zstyle ':completion:*' file-list all

#####################Colorful Completion List#######################
# To have nice colors for your directories and file in the completion menu, you can add the style list-colors.
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# It will set the value with the content of the environment variable LS_COLORS, normally used by the command ls --color=auto.

# You apparently need to have the module zsh/complist loaded, but it worked without it on my system. I describe a bit more the module complist later in this article.

# You can configure the colors of any completion menu even further using the environment variable ZLS_COLORS.
# man zshmodules - Search “Colored completion listings”

#####################################################################
#####################Smarter Completion System#######################
#####################################################################

#####################Squeezing Slashes#######################
# By default, the completion system will expand // to /*/. For example, cd ~//Documents will be expanded to cd ~/*/Documents.

# Usually, on Unix systems, // is expanded to /. If you prefer this behavior, you can set the style squeeze-slashes to true as follows:
zstyle ':completion:*' squeeze-slashes true

# #####################Directory Stack Completion######################
# For the command cd, chdir and pushd, you can use a hyphen - not only for options but for a directory stack entry.

# By default, the Zsh completion system will try to complete for a directory stack entry when you hit tab after a hyphen - while using one of these commands. If you prefer completing for an option, you can set the style complete-options to true as follows:

zstyle ':completion:*' complete-options true
# If you’re interested to learn more about the directory stack, I described a nice way to navigate through it in this article

# #####################Sorting Matched Files######################
# You can sort the files appearing in the completion menu as follows:
# zstyle ':completion:*' file-sort dummyvalue

# If this style is not set (or set with a dummy value like in the example above), the files will be sorted alphabetically. You can use one of these values if you prefer another ordering:

# size - Order files by size.
# links - Order files depending on the links pointing to them.
# modification or date or time - Order files by date of modification.
# access - Order files by time of access.
# change or inode - Order files by the time of change.

# You can also add reverse to the values to reverse the order. For example:

zstyle ':completion:*' file-sort change reverse

# If you add the value follow, the timestamp of the targets for symlinks will be used instead of the timestamp of the symlinks themselves.

# #####################Completion Matching Control######################

# Setting the style matcher-list allows you to filter the matches of the completion with even more patterns.

# For example, you can set this style for the completion to first try the usual completion and, if nothing matches, to try a case-insensitive completion:
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# The completion can also try to complete partial words you’ve typed with the following style:
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# This style would allow you, for example, to complete the file _DSC1704.JPG if you only try to complete its substring 1704.

# The patterns themselves are quite… obscure. If you want a good intellectual challenge, you can look at the manual. I wish you good luck.

# man zshcompwid - Search for “COMPLETION MATCHING CONTROL”

######################Completion via Keystrokes######################

# You can bind any completion style to a keystroke instead of using it with the general completion. For that, you need to use the completer _generic.

# For example, if you want to expand aliases each time you hit CTRL+a, you can add the following lines:

zle -C alias-expension complete-word _generic
bindkey '^a' alias-expension
zstyle ':completion:alias-expension:*' completer _expand_alias

# You can replace alias-expension by the name of your choice. The behavior depends of the completer you use; for expanding aliases, we use _expand_alias. Feel free to use whatever completer you want for your own needs.

######################The Module complist######################
# https://thevaluable.dev/zsh-install-configure-mouseless/

# We saw there how to move around in the completion menu using the keys “hjkl”:

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# You can configure many more keystrokes related to the completion menu using these commands:

# accept-line - Validate the selection and leave the menu.
# send-break - Leaves the menu selection and restore the previous command.
# clear-screen - Clear the screen without leaving the menu selection.
# accept-and-hold - Insert the match in your command and let the completion menu open to insert another match.
# accept-and-infer-next-history - Insert the match and, in case of directories, open completion menu to complete its children.
# undo - Undo.
# vi-forward-blank-word - Move cursor to next group of match.
# vi-backward-blank-word - Move cursor to previous group of match.
# beginning-of-buffer-or-history - Move the cursor to the leftmost column.
# end-of-buffer-or-history - Move the cursor to the rightmost column.
# vi-insert - Toggle between normal and interactive mode. We’ve seen the interactive mode above.
# history-incremental-search-forward and history-incremental-search-backward - Begin incremental search.

# For example, I’ve configured CTRL+x i to switch to the interactive mode in the completion menu:
bindkey -M menuselect '^xi' vi-insert
# man zshmodules - Search for “THE ZSH/COMPLIST MODULE”

######################Completion Options######################

# You can also use options to modify the Zsh completion system. To set an option, you need to use the command setopt. For example:

setopt MENU_COMPLETE
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.

# Here’s a small selection of useful options for configuring the completion system:

# ALWAYS_TO_END - Always place the cursor to the end of the word completed.
# LIST_PACKED - The completion menu takes less space.
# AUTO_MENU - Display the completion menu after two use of the TAB key.
# AUTO_COMPLETE - Select the first match given by the completion menu. Override AUTO_MENU.
# AUTO_PARAM_SLASH - When a directory is completed, add a trailing slash instead of a space.
# COMPLETE_IN_WORD - By default, the cursor goes at the end of the word when completion start. Setting this will not move the cursor and the completion will happen on both end of the word completed.
# GLOB_COMPLETE - Trigger the completion after a glob * instead of expanding it.
# LIST_ROWS_FIRST - Matches are sorted in rows instead of columns.

# man zshoptions - Search for “Completion”







#################################################################################################
###################################      NPM     ################################################
#################################################################################################

