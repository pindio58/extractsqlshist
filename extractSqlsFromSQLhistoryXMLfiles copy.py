# import modules
from pathlib import Path
from time import sleep
from xml.dom import minidom
import datetime

FILENAME = 'allSqls.sql'
# Input directory
inputDir = Path.home().parent.parent.joinpath(
    '/mnt/c/Users/pc/AppData/Roaming/SQL Developer/SqlHistory')  # I am using WSL2 on windows OS. Please change it accordingly
# Output file name and its location.
# Change it as per your reequirements. Right now, it will generate the file in current working dir
outputfile = str(Path.cwd().joinpath(FILENAME))

# Final code


class extract():

    def __init__(self, inputDir, outputfile) -> None:
        self.inputDir = inputDir
        self.outputfile = outputfile

    @property
    def timeNow(self):
        return datetime.datetime.today().strftime('%d-%b-%Y-%H:%M:%S')

    def final(self):
        with open(self.outputfile, 'w') as f:
            f.write(
                f'--====================================\n-- Started at {self.timeNow} =\n--====================================\n\n')
            for num, file in enumerate(list(self.inputDir.glob('*xml'))[::-1]):
                doc = minidom.parse(str(file))
                f.write(
                    f'\n\n--=================================  {num}  ================================================\n\n')
                f.write(doc.getElementsByTagName("sql")[0].firstChild.data)
            f.write(
                f'--====================================\n-- End at {self.timeNow} =\n--====================================\n\n')


if __name__ == '__main__':
    inst = extract(inputDir, outputfile)
    inst.final()
