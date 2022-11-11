import pandas as pd
from numpy import NaN
from sklearn.feature_extraction.text import CountVectorizer
df = pd.read_csv('materials_k_import.csv')


def change_picture(s: str):
    s = s.replace('\\', '/')
    if s.startswith('/'):
        s = s[1:]
    else:
        s = NaN
    return s


df['Изображение'] = df['Изображение'].apply(change_picture)
df['Цена'] = df['Цена'].apply(lambda x: x.split()[0])
df['Количество на складе'] = df['Количество на складе'].apply(lambda x: x.split()[-1] if x.startswith('На') else x.split()[0])

df.to_csv('materials_k_import2.csv', index=True)
