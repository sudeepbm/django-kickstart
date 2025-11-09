# Django Kickstart

A shell script to automate the setup of a new Django project with virtual environment, apps and basic templates.

## Description

`django-kickstart.sh` is a shell script designed to streamline the process of creating a new Django project. It handles directory creation, virtual environment setup, Django installation, project initialization, app creation, and basic template scaffolding. This script is ideal for developers who want to quickly bootstrap a Django project with multiple apps and a simple HTML/CSS structure.

## Development Status

This script is still in development. New features and enhancements are planned and will be added in future updates.

## Future Enhancements

Here are some of the features planned for future releases:

- [ ] **Windows Support**: Create Batch and PowerShell versions of the script for Windows users.
- [ ] **Modular Codebase**: Refactor the script into functions to improve readability and maintainability.
- [ ] **Custom Package Installation**: Allow the user to provide a list of additional Python packages (e.g., `djangorestframework`, `pillow`) to be installed.
- [ ] **Git Initialization**: Automatically initialize a Git repository and create a `.gitignore` file.
- [ ] **Non-Interactive Mode**: Add support for command-line flags to run the script without interactive prompts (e.g., `dk --name myproject --apps blog,api`).

## Features

- **Directory Creation**: Prompts for and creates a new project directory.
- **Virtual Environment Setup**: Creates and activates a Python virtual environment.
- **Django Installation**: Automatically installs Django in the virtual environment.
- **Project Initialization**: Starts a new Django project using `django-admin startproject`.
- **App Creation**: Allows creation of multiple Django apps, each with:
  - `urls.py` file
  - `templates` directory
- **Template Scaffolding**: Generates project-level `templates` and `static` folders with:
  - `main.html` (base template with navigation)
  - `nav.html` (navigation component)
  - `style.css` (basic CSS styling)
- **IDE Integration**: Opens the project in Visual Studio Code.
- **Error Handling**: Includes checks for command failures and prompts the user to re-enter if an input is empty.

## Prerequisites

- **Operating System**: Linux, macOS, or Windows (with WSL).
- **Python**: Python 3.x installed on your system.
- **Shell**: Bash or a compatible shell (like Zsh).
- **Visual Studio Code**: Installed and `code` command available in PATH (for opening the project).

## Installation

1. Clone the repository directly to your bin directory:
   ```bash
   mkdir -p /home/$USER/bin
   git clone https://github.com/sudeepbm/django-kickstart.git /home/$USER/bin/
   ```

2. Make the script executable:
   ```bash
   chmod +x /home/$USER/bin/django-kickstart.sh
   ```

3. Add the directory to your PATH by appending the following line to your shell's configuration file:
   - For Zsh, add to `~/.zshrc`
   - For Bash, add to `~/.bashrc`
   ```bash
   export PATH="$HOME/bin:$PATH"
   ```
   - Reload your shell configuration (e.g., `source ~/.zshrc` or `source ~/.bashrc`).

   Now you can run `django-kickstart.sh` from any directory.

4. Alternatively, create an alias for easier access. Add the following line to your `~/.bashrc` or `~/.zshrc` file:
   ```bash
   alias dk='~/bin/django-kickstart.sh'
   ```
   - Reload your shell configuration (e.g., `source ~/.zshrc` or `source ~/.bashrc`).
   
   Now you can run `dk` from any directory.

## Usage

1. Run the script from your desired parent directory:
   ```bash
   django-kickstart.sh
   ```
   or, if you created the alias:
   ```bash
   dk
   ```

2. Follow the interactive prompts:
   - Enter the name of the project directory to create.
   - Enter the name of the Python virtual environment.
   - Enter the name of the Django project.
   - Enter the number of Django apps to create.
   - For each app, enter the app name.

3. The script will:
   - Create the project directory and navigate into it.
   - Set up the virtual environment and activate it.
   - Install Django.
   - Create the Django project and apps.
   - Generate basic templates and static files.
   - Open the project in VS Code.

## Example

Suppose you run the script and provide the following inputs:

- Project directory name: `my_django_project`
- Virtual environment name: `venv`
- Project name: `myproject`
- Number of apps: `2`
- App 1 name: `blog`
- App 2 name: `accounts`

The script will create the following structure and open it in VS Code:

```
my_django_project/
├── venv/
└── myproject/
    ├── manage.py
    ├── myproject/
    │   ├── __init__.py
    │   ├── asgi.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── blog/
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations/
    │   ├── models.py
    │   ├── templates/
    │   ├── tests.py
    │   ├── urls.py
    │   └── views.py
    ├── accounts/
    │   ├── ... (similar to blog app)
    ├── templates/
    │   ├── main.html
    │   └── nav.html
    └── static/
        └── style.css
```

## Customization

- **Templates**: Modify `main.html`, `nav.html`, and `style.css` in the generated `templates` and `static` folders to fit your project's needs.
- **Script Modifications**: Edit `django-kickstart.sh` to change default behaviours, such as adding more packages or altering the template structure.

## Troubleshooting

- **Permission Denied**: Ensure the script is executable (`chmod +x django-kickstart.sh`).
- **Python Not Found**: Verify Python 3 is installed and accessible as `python3`.
- **Django Installation Fails**: Check internet connection and pip configuration.
- **VS Code Not Opening**: Ensure `code` command is in your PATH.
- **Virtual Environment Issues**: If activation fails, ensure `python3 -m venv` is installed and works on your system (on some Linux distributions, you may need to install a package like `python3-venv`).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

[SUDEEP.B.M.](https://github.com/sudeepbm) - Initial work

## Acknowledgments

- Inspired by the need for faster Django project setup.
- Thanks to the Django community for excellent documentation.
