
---


### Configuration ###

You must specify your Nsis instalation path. In order to do that, go to "Paths" in the "Configuration" menu item and select the path to your "makensisw.exe" file. The default location of this file is "C:\Program Files\NSIS\makensisw.exe"


---


### How To Use ###

Let's begin explaining the Graphic Interface of py2nsis
<br />

The "General" Panel contains Options that describes basic information about your project
, such as name, version, copyright, Company. It also have the name of the Dist Folder wich is where the output files of py2exe are allocated. The bundle level combo box have 3 values:
  * 1 is to generate a singleFile .exe that contains all the aplication, including the Python interpreter.
  * 2 is to generate a singleFile .exe that contains all the aplication except the Python interpreter which is isolated in the dist dir.
  * 3 is to generate a .exe and all the dlls and .pyd files around the executable.
The checkBox in the bottom of the panel indicates if the Nsis installer is generated or Not. When is checked, only the setup.py (for py2exe) is generated. This implies that just the .exe of your application is builded, not the installer.
<br />

The "Main Script" File Selector is where you must tell to py2nsis where is the root file of you application.
This field is the most important and is obligatory to complete!
<br />

The Logo Icon File Selector is where you can select a .ico image for the .exe and is the icon that will appear in the desktop and in the programs bar when you install your application.
<br />

In the Additional Python Modules list you can type the python modules of wich your application depends and there is not an explicit import in your code.
<br />

Finally the Static files are the files like images, icons, config files, text files, templates and more wich are referenced by the uri in your application.
<br />

You can also add raw python code that you need (in some cases this is necesary) going to "code" in the menu bar and selecting the "add custom code" option.


---
