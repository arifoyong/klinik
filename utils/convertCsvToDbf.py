from typing import List, Any
import dbf
import csv

class Field:
    '''
        A wrapper class that defines Field
        Properties:
        name: name of field
        type: type of field. The following types are available:
                C(10)  --> character with length of 10
                N(5,2) --> numeric with length of 5 and 2 decimal places
    '''
    name: str
    type: str
    def __init__(self, _name, _type):
        self.name = _name
        self.type = _type

def csvToDbf(csvPath: str, fields: List[Field], dbfPath: str = 'output.dbf', hasHeader: bool = True ):
    '''
        Convert csv file into dbf file
        based on reference from: https://stackoverflow.com/questions/71232316/how-can-i-create-a-new-dbf-file-with-python-solution-with-ethanfurman-dbf-pack

        Parameters:
        - csvPath: file path of csv file
        - fields: a list of type Field, that define the field name & field type
        - dbfPath: file path of the resulting dbf file
        - hasHeader: if True, indicates that the csv file has header, thus it will be skipped during writing to dbf file
    '''  
    fieldString = '; '.join([f"{f.name} {f.type}"  for f in fields])
    newTable = dbf.Table(dbfPath, fieldString, codepage='cp1252')

    try:
        newTable.open(dbf.READ_WRITE)
        with open(csvPath, 'r') as f:
            csvReader = csv.reader(f)
            if hasHeader: next(csvReader)
            for row in csvReader:
                rowData: Any = tuple(row)
                newTable.append(rowData)
        newTable.close()
    except Exception as e:
        print(f"Error: {e}")
        newTable.close()


if __name__ == '__main__':
    fieldList:List[Field] = [   Field('Latd', 'N(5,0)'),
                                Field('LatM', 'N(5,0)'),
                                Field('LatS', 'N(5,0)'),
                                Field('NS', 'C(1)'),
                                Field('LonD', 'N(5,0)'),
                                Field('LonM', 'N(5,0)'),
                                Field('LonS', 'N(5,0)'),
                                Field('EW', 'C(1)'),
                                Field('City', 'C(30)'),
                                Field('State', 'C(2)')
                            ]
    
    csvToDbf('data/cities.csv', fieldList)