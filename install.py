import subprocess

def install_package(package_name):

        subprocess.run(["apt-get", "install", "-yq", package_name], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

def main():

        pk_list = input("Enter your value: ")

        packages = pk_list.split()

        for package in packages:
                install_package(package)

        print('Packages', packages, 'installed successfully')

if __name__ == "__main__":

        main()
