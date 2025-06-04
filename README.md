# File Manager Bash Script

A simple and interactive bash script to manage and organize files in a directory tree. The script provides an interactive menu for organizing, removing, viewing, and moving files using `find`, `mv`, `rm`, and other standard Linux utilities.

---

##  Features

* Organize files by type (Documents, Images, Videos, Music, Archives)
* Remove a file (searches all subdirectories)
* Show file details (type, size, metadata)
* Move a file into its own directory
  
---

##  Directory Structure

When organizing, the script will create these directories:

```
Documents/
Images/
Videos/
Music/
Archives/
```

---

##  Test File Generator

You can use the provided script to auto-generate dummy files for testing purposes. These files include multiple types and extensions to simulate a real file system.

Run the generator like this:

```bash
bash generate_test_files.sh
```

---

##  How to Use

1. Clone the project or copy the script to your system.
2. Run the file manager script:

```bash
bash file_manager.sh
```

3. Use the interactive menu to perform actions:

```
1. Organize files
2. Remove file
3. Show file details
4. Move file to a new folder
5. Exit
```

---

##  Method Overview

### `organize_files`

* Organizes files in the current directory by type (based on extension).
* Moves files into corresponding folders like `Documents/`, `Images/`, etc.

### `find_file filename`

* Searches for a file by name recursively from the current directory.
* Returns the first match (avoids duplicates).
* Used in all methods that act on a file (`remove_file`, `show_file_details`, etc.).

### `remove_file`

* Prompts for a filename.
* Uses `find_file` to locate and delete the file if found.

### `show_file_details`

* Prompts for a filename.
* Uses `file`, `du -sh`, and `stat` to show type, size, and metadata.

### `move_file`

* Prompts for a filename.
* Moves the file into a folder named after its base name (e.g., `notes.txt` → `notes/notes.txt`).

---

##  Example Output

```bash
===============================
File Manager - Main Menu
===============================
1. Organize files
2. Remove file
3. Show file details
4. Move file to a new folder
5. Exit
-------------------------------
Select an option [1-5]:
```
