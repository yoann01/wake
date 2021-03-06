from setuptools import setup, find_packages

import os

def package_data():

    data = [] 
    top = os.path.join(os.getcwd(), "pipeline", "core", "etc")
    remove = os.path.join(os.getcwd(), "pipeline", "")

    for root, dirs, files in os.walk(top, topdown=True):
        for dir in dirs:
            dir_path = os.path.join(root, dir)
            dir_path = dir_path.replace(remove, "")
            # print dir_path
            # data.append(dir_path)

        for name in files:
            if not name.endswith("~"):
                path = os.path.join(root, name)
                path = path.replace(remove, "")
                data.append(path)

    return data


setup(
    name = "wake",
    version = "0.0.2",
    packages = find_packages(),
    install_requires = ['SQLAlchemy>=0.4', 'Mako>=0.1.10', 'Werkzeug>=0.2', 'PyYAML>=3.05'],

    entry_points = {
    'console_scripts': [
        'wake = pipeline.cmdline:main',
        'wake_web = pipeline.dispatch.web:local',
        ],
    },

    package_data = {
        '' : package_data() 
    },

    # metadata for upload to PyPI
    author = "Michael Jones",
    author_email = "m.pricejones@gmail.com",
    description = "A pipeline",
    keywords = "animation pipeline workflow project",
    url = "http://www.michaelpjones.co.uk/pipeline/trac",   # project home page, if any

)



