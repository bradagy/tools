create_python_project_directory() {
    name_of_user="$(whoami)"
    base_directory="$HOME/Desktop/github"

    # Prompt for the local directory name
    read -p "Enter the name of your local directory: " local_directory

    # Construct the full path
    full_path="$base_directory/$local_directory"

    # Check if the base directory exists
    if ! [ -d "$full_path" ]; then
        echo "Error: Directory $full_path does not exist. Exiting..."
        exit 1
    fi

    # Prompt for the new project directory name
    read -p "Enter the name of the new directory: " new_python_project_dir

    project_path="$full_path/$new_python_project_dir"

    # Check if the new directory already exists
    if [ -d "$project_path" ]; then
        echo "Directory $new_python_project_dir already exists. Exiting..."
        exit 1
    fi

    echo "Creating directory $new_python_project_dir..."
    mkdir -p "$project_path" || { echo "Failed to create directory $new_python_project_dir. Exiting..."; exit 1; }

    echo "Creating LICENSE.md..."
    cat << EOF > "$project_path/LICENSE.md"
MIT License

Copyright (c) 2019

Permission is hereby granted, free of charge, to any person obtaining a 
copy of this software and associated documentation files (the "Software"), 
to deal in the Software without restriction, including without limitation 
the rights to use, copy, modify, merge, publish, distribute, sublicense, 
and/or sell copies of the Software, and to permit persons to whom the 
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
EOF

    cd "$project_path" || { echo "Failed to navigate to $project_path. Exiting..."; exit 1; }
    
    echo "Initializing git repository..."
    git init || { echo "Git initialization failed. Exiting..."; exit 1; }

    echo "Creating README.md..."
    touch README.md

    echo "Setting up Python project structure..."
    mkdir src
    cd src || { echo "Failed to navigate to src directory. Exiting..."; exit 1; }
    
    touch __init__.py
    chmod +x __init__.py
    main_script="${new_python_project_dir}.py"
    touch "$main_script"
    chmod +x "$main_script"

    cd "$project_path" || exit
    python3 -m venv venv || { echo "Virtual environment setup failed. Exiting..."; exit 1; }

    echo "Creating an empty .gitignore..."
    touch .gitignore

    echo "The project directory has been successfully created."
}

create_python_project_directory

