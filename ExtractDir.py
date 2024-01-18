import os
import sys
import subprocess
import time as t

class ModuleInstaller:
    def __init__(self):
        pass

    def get_package_path(self, package_name):
        result = subprocess.run(['pip', 'show', package_name], capture_output=True, text=True)
        output = result.stdout.strip()

        if result.returncode == 0:
            lines = output.split('\n')
            location_line = next((line for line in lines if line.startswith('Location:')), None)

            if location_line:
                file_path = location_line.split(':', 1)[1].strip()
                return file_path

        return None
    def install_modules(self, required_modules):
        for module in required_modules:
            try:
                __import__(module)
            except ImportError:
                print(f"The module '{module}' is not installed.")
                print(f"Trying to install the required module: {module}\n")
                os.system(f'python -m pip install {module}')

        file_path = ""

        for module in required_modules:
            file_path = self.get_package_path(module)
            if file_path:
                break

        if file_path:
            sys.path.insert(0, file_path)
            print(f"Installation path: {file_path}")
        else:
            print("Could not find installation path.")
