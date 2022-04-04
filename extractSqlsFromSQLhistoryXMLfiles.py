# import modules
from pathlib import Path
from xml.dom import minidom
import datetime


# Input directory
# I am using WSL2 on windows OS. Please change it accordingly
inputDir = Path.home().parent.parent.joinpath(
    '/mnt/c/Users/pc/AppData/Roaming/SQL Developer/SqlHistory')

# Output file name and its location.
# Change it as per your reequirements. Right now, it will generate the file in current working dir
outputfile = str(Path.cwd().joinpath('allSqls.sql'))

# time for extraction
timeNow = datetime.datetime.today().strftime('%d-%b-%Y-%H:%M:%S')

# Traverse all xml files and extract text SQL tag
with open(outputfile,'w') as f:
    f.write(f'--====================================\n-- Extracted at {timeNow} =\n--====================================\n\n')        
    for num, file in enumerate(list(inputDir.glob('*xml'))[::-1]):
        doc = minidom.parse(str(file))
        f.write(f'\n\n--=================================  {num}  ================================================\n\n')
        f.write(doc.getElementsByTagName("sql")[0].firstChild.data)             