function fe -d "Open the selected file with the default editor"
    fzf --query="$argv[1]" --multi --exit-0 --bind 'enter:become($EDITOR {+})'
end
