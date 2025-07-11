## DevOps Capstone Project - Windows 11 Local Setup Guide

### 1. Prerequisites
- **Python 3.9**: Make sure Python 3.9 is installed.  
  You can use [pyenv-win](https://github.com/pyenv-win/pyenv-win) to manage multiple Python versions.
- **Git Bash or PowerShell**: Recommended for running shell scripts.
- **pip**: Ensure pip is available (`python -m pip --version`).
- **GNU Make**: Required for running certain build and setup commands.
  - On Windows, you can install `make` easily using [Chocolatey](https://chocolatey.org/packages/make):
    ```powershell
    choco install make
    ```
  - Alternatively, you can use [Scoop](https://scoop.sh/):
    ```powershell
    scoop install make
    ```
  - After installation, restart your terminal to ensure `make` is available in your PATH.

### 2. Clone and Enter the Project Directory
```bash
git clone <your-repo-url>
cd devops-capstone-project
```

### 3. Set Up the Virtual Environment
```bash
python -m venv venv
```
- To activate the virtual environment:
  - **Git Bash:**  
    ```bash
    source venv/Scripts/activate
    ```
  - **PowerShell:**  
    ```powershell
    .\venv\Scripts\Activate.ps1
    ```
  - **Command Prompt:**  
    ```cmd
    venv\Scripts\activate.bat
    ```
- To deactivate:
  ```bash
  deactivate
  ```

### 4. Install Python Dependencies
```bash
pip install -r requirements.txt
```
- If you want to save your current environment:
  ```bash
  pip freeze > local-requirements.txt
  ```

### 5. Run the Flask Server Locally (with Waitress)
- Make sure you have the `waitress` package installed:
  ```bash
  pip install waitress
  ```
- Start the server:
  ```bash
  python -m waitress --host=127.0.0.1 --port=5000 service.routes:app
  ```
- Access the server in your browser:  
  [http://127.0.0.1:5000/](http://127.0.0.1:5000/)

### 6. Example API Usage with curl

**Create an Account**
```bash
curl -i -X POST http://127.0.0.1:5000/accounts \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe","email":"john@doe.com","address":"123 Main St.","phone_number":"555-1212"}'
```

**List All Accounts**
```bash
curl -i -X GET http://127.0.0.1:5000/accounts
```

**Read an Account**
```bash
curl -i -X GET http://127.0.0.1:5000/accounts/1
```

**Update an Account**
```bash
curl -i -X PUT http://127.0.0.1:5000/accounts/1 \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe","email":"john@doe.com","address":"123 Main St.","phone_number":"555-1111"}'
```

**Delete an Account**
```bash
curl -i -X DELETE http://127.0.0.1:5000/accounts/1
```

---

### Tips
- If you encounter issues with `make`, use Docker commands directly or install [make for Windows](https://chocolatey.org/packages/make).
- For database setup, ensure Docker is running and configured as needed.
- Always activate your virtual environment before running Python commands.

---

Feel free to adjust URLs, paths, or add more troubleshooting steps as needed for your team!