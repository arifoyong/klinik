from typing import List, Any
import dbf
import csv
import pandas as pd

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
        df = pd.read_csv(csvPath)
        df['TOTAL'] = df['TOTAL'].apply(lambda x: x.strip() if isinstance(x, str) else x)
        df[['TOTAL', 'STOK']] = df[['TOTAL', 'STOK']].apply(pd.to_numeric)
        df.fillna(0, inplace=True)
        for _, row in df.iterrows():
            obat, stok, hargaBeli, total = row['NAMA OBAT'], row['STOK'], row['HARGA BELI'], row['TOTAL']

            rowData: Any = (obat, stok, hargaBeli, total)
            print(f"rowData {rowData}")
            newTable.append(rowData)

        newTable.close()
    except Exception as e:
        print(f"Error: {e}")
        newTable.close()


def main():
    # fieldList:List[Field] = [   Field('NamaObat', 'C(50)'),
    #                             Field('Stok', 'N(5,0)'),
    #                             Field('HargaBeli', 'N(12,2)'),
    #                             Field('Total', 'N(12,2)')
    #                         ]
    # csvToDbf('data/reguler2023.csv', fieldList, 'reguler2023.dbf')

    fieldList:List[Field] = [   Field('NamaObat', 'C(50)'),
                                Field('Stok', 'N(5,0)'),
                                Field('HargaBeli', 'N(12,2)'),
                                Field('Total', 'N(12,2)')
                            ]
    
    csvToDbf('data/jkn2023.csv', fieldList, 'jkn2023.dbf')


if __name__ == '__main__':
    main()