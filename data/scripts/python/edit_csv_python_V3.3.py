import allel
import sys
import pandas as pd
import numpy as np
def dftocsv(filename, prefix=''):
    df = allel.vcf_to_dataframe(filename, fields='*', alt_number=3)

    if df is None : 
        open(filename + '.export.csv', "w")
    else:
        df.INDEL = df.INDEL.astype(str)
        df_select = df[df['INDEL'].str.contains('True')]
        pos_list = df_select["POS"].tolist()
        df['INDEL'] = df['POS'].isin(pos_list)
        df.IMF = df.IMF.astype(str)
        df_select.to_csv(filename + '.indels.csv', index = False, errors='replace')
        df2= df.drop(labels=df_select.index, axis=0)
        df2.to_csv(filename + '.export.csv', index = False, errors='replace')
dftocsv(sys.argv[1],'') 