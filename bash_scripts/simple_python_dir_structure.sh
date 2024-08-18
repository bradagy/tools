#!/bin/bash

create_python_project_directory() {
    name_of_user="$(whoami)"
    read -p "Enter the name of your local directory that stores your Github projects" local_directory

    base_directory="/home/$name_of_user/Desktop/$local_directory"
    cd "$base_directory" || exit

    read -p "Enter the name of the new directory: " new_python_project_dir

    if [ -d "$new_python_project_dir" ]; then
        echo "Directory $new_python_project_dir already exists. Exiting..."
        exit 1
    fi

    echo "Creating directory $new_python_project_dir..."

    mkdir -p "$new_python_project_dir" || exit
    sleep 2
    echo -n "The $new_python_project_dir directory was created."

    cat << EOF >> "/home/$name_of_user/Desktop/github/$new_python_project_dir/LICENSE.md"
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

    cd "$new_python_project_dir" || exit
    touch README.md

    git init || exit

    sleep 2

    mkdir "$new_python_project_dir"
    cd "$new_python_project_dir"
    touch __init__.py
    chmod +x __init__.py
    touch "$new_python_project_dir.py"
    chmod +x "$new_python_project_dir.py"

    python3 -m venv venv
    cd ..
    touch .gitignore
    sleep 2
    echo "The project directory has been created."

}

create_python_project_directory
