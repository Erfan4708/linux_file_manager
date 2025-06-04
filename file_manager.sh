#!/bin/bash

mkdir -p Documents Images Videos Music Archives

organize_files() {
    echo "Organizing files..."
    for file in *; do
        [ -f "$file" ] || continue
        case "${file,,}" in
            *.doc|*.docx|*.txt|*.pdf)
                mv "$file" Documents/
                ;;
            *.jpg|*.jpeg|*.gif|*.png)
                mv "$file" Images/
                ;;
            *.mp4|*.avi|*.mkv|*.mov)
                mv "$file" Videos/
                ;;
            *.mp3|*.wav|*.ogg|*.flac)
                mv "$file" Music/
                ;;
            *.zip|*.tar.gz|*.rar)
                mv "$file" Archives/
                ;;
        esac
    done
    echo "Files organized."
}

find_file() {
    local filename="$1"
    find . -type f -name "$filename" | head -n 1
}

remove_file() {
    read -p "Enter filename to remove: " filename
    found=$(find_file "$filename")
    if [[ -n "$found" ]]; then
        rm "$found"
        echo "Removed $found"
    else
        echo "File not found."
    fi
}

show_file_details() {
    read -p "Enter filename to show details: " filename
    found=$(find_file "$filename")
    if [[ -n "$found" ]]; then
        echo "Details for $found:"
        file "$found"
        du -sh "$found"
        stat "$found"
    else
        echo "File not found."
    fi
}

move_file() {
    read -p "Enter filename to move into its own directory: " filename
    found=$(find_file "$filename")
    if [[ -n "$found" ]]; then
        dirname="${filename%.*}"
        mkdir -p "$dirname"
        mv "$found" "$dirname/"
        echo "Moved $found to $dirname/"
    else
        echo "File not found."
    fi
}


while true; do
    echo
    echo "==============================="
    echo "File Manager - Main Menu"
    echo "==============================="
    echo "1. Organize files"
    echo "2. Remove file"
    echo "3. Show file details"
    echo "4. Move file to a new folder"
    echo "5. Exit"
    echo "-------------------------------"

    read -p "Select an option [1-5]: " choice

    case $choice in
        1) organize_files ;;
        2) remove_file ;;
        3) show_file_details ;;
        4) move_file ;;
        5) echo "Exiting..."; break ;;
        *) echo "Invalid option, try again." ;;
    esac
done

