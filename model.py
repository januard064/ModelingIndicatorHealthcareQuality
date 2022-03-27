# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import pickle

df = pd.read_csv('AnalysisdatasetPemeriksaanFisikPasien.csv')

df = df.drop(['No','No. RM'], axis=1)

Kelompok_usia_string_index = {'28-<1 th': 1, '1-4 th': 2, '5-14 th': 3, '15-24 th': 4, '25-44 th': 5, '45-64 th': 6, '65> th': 7}

df['Kelompok Usia'] = df['Kelompok Usia'].apply(lambda x: Kelompok_usia_string_index[x])

categ_vars = ['Diagnosis','Gender']

for var in categ_vars:
    categ_list = pd.get_dummies(df[var], prefix=var) # implementing One Hot Encoder
    df_temp = df.join(categ_list)
    df = df_temp

data_vars = df.columns.values.tolist()
type(data_vars)

to_keep = [i for i in data_vars if i not in categ_vars]

encoded_df = df[to_keep]



encoded_df['LoS'] = encoded_df['LoS'].replace([1,2,3],'Dibawah Empat Hari')


encoded_df['LoS'] = encoded_df['LoS'].replace([4,5,6,7,9,10,11],'Empat Hari Lebih')






#Splitting Training and Test Set
from sklearn.model_selection import train_test_split

X = encoded_df.drop(['LoS'], axis=1) #remove data leakage features
y = encoded_df[['LoS']]
y=y.astype('str')
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1)


#decision tree optimal parameters
#best model 90:10
#decision tree optimal parameters
from sklearn.tree import DecisionTreeClassifier
dtree_best=DecisionTreeClassifier(max_depth= 4, class_weight='balanced')
dtree_best.fit(X_train,y_train)

from sklearn import metrics
train_predictions_md3 = dtree_best.predict(X_train)
test_predictions_md3 = dtree_best.predict(X_test)




# Saving model to disk
pickle.dump(dtree_best, open('model.pkl','wb'))

# Loading model to compare the results
model = pickle.load(open('model.pkl','rb'))
print(model.predict([[3,90,100,20,38.2,4,0,1,0,1]]))