#!/usr/bin/env bash
# Script to create a folder in the current directory after asking for the name

while true; do
  echo "Enter the name of the project directory to create:"
  read dir_name
  [ -n "$dir_name" ] && break
  echo "Project directory name cannot be empty. Please try again."
done

if [ -d "$dir_name" ]; then
  echo "Project directory '$dir_name' already exists."
else
  mkdir "$dir_name"
  echo "Project directory '$dir_name' created successfully."
fi

# Change to the new directory
cd "$dir_name"

# Ask for the venv name
while true; do
  echo "Enter the name of the Python virtual environment (venv) to create:"
  read venv_name
  [ -n "$venv_name" ] && break
  echo "Virtual environment name cannot be empty. Please try again."
done

# Create the virtual environment
python3 -m venv "$venv_name"
if [ $? -eq 0 ]; then
  echo "Virtual environment '$venv_name' created successfully inside '$dir_name'."
else
  echo "Failed to create virtual environment."
  exit 1
fi

# Activate the virtual environment
echo "Activating the virtual environment..."
source "$venv_name/bin/activate"
if [ $? -eq 0 ]; then
  echo "Virtual environment '$venv_name' is now active."
else
  echo "Failed to activate the virtual environment."
  exit 1
fi

# Show installed packages in the virtual environment
echo "Listing installed packages in the virtual environment:"
pip list

# Install Django
echo "Installing Django in the virtual environment..."
pip install django
if [ $? -eq 0 ]; then
  echo "Django installed successfully."
else
  echo "Failed to install Django."
  exit 1
fi

# Ask for the Django project name
while true; do
  echo "Enter the name of the Django project to create:"
  read project_name
  [ -n "$project_name" ] && break
  echo "Project name cannot be empty. Please try again."
done

# Start the Django project
echo "Creating Django project '$project_name'..."
django-admin startproject "$project_name"
if [ $? -eq 0 ]; then
  echo "Django project '$project_name' created successfully."
else
  echo "Failed to create Django project."
  exit 1
fi

# Open VS Code in the top-level project directory
echo "Opening VS Code in the project directory..."
code .

# Change directory into the new Django project
cd "$project_name"
echo "Changed directory to $(pwd)"

# Ask how many Django apps to create
echo "How many Django apps do you want to create?"
read app_count

if ! [[ "$app_count" =~ ^[0-9]+$ ]] || [ "$app_count" -lt 0 ]; then
  echo "Invalid number of apps. Exiting."
  exit 1
fi

# Loop to create each app and its urls.py
for ((i=1; i<=app_count; i++)); do
  while true; do
    echo "Enter name for app $i:"
    read app_name
    [ -n "$app_name" ] && break
    echo "App name cannot be empty. Please try again."
  done
  echo "Creating Django app '$app_name'..."
  python manage.py startapp "$app_name"
  if [ $? -eq 0 ]; then
    echo "App '$app_name' created successfully."
    # Create urls.py inside the app directory
    touch "$app_name/urls.py"
    echo "from django.urls import path\n\nurlpatterns = [\n    # Add your app's URL patterns here\n]" > "$app_name/urls.py"
    echo "urls.py created in $app_name."
    # Create templates directory inside the app
    mkdir -p "$app_name/templates"
    echo "templates directory created in $app_name."
  else
    echo "Failed to create app '$app_name'."
    exit 1
  fi
done

# Create project-level templates and static folders beside apps
mkdir -p templates
mkdir -p static
echo "Created 'templates' and 'static' folders beside apps."

# Create main.html and nav.html in templates
cat << EOF > templates/main.html
{% load static %}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="{% static 'style.css' %}">
</head>
<body>
    {% include 'nav.html' %}
    {% block content %}
    {% endblock content %}
</body>
</html>
EOF
cat << EOF > templates/nav.html
<nav>
    <div class="logo">
        <h2>Project_Name</h2>
    </div>

    <div class="links">
        <a href="{% url 'home' %}">Home</a>
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
    </div>
</nav>
EOF
echo "Created main.html and nav.html in templates."

# Create style.css in static
touch static/style.css
echo "Created style.css in static."

pwd
ls -la