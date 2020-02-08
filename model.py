
# coding: utf-8

# In[1]:




import pandas as pd 

# reading csv file 
data = pd.read_csv('/home/spchandgude/Downloads/Crop-prediction/cpdata.csv') 

# shape of dataset 
print("Shape:", data.shape) 

# column names 
print("\nFeatures:", data.columns) 

# storing the feature matrix (X) and response vector (y) 
X = data[data.columns[:-1]] 
y = data[data.columns[-1]] 

# printing first 5 rows of feature matrix 
print("\nFeature matrix:\n", X.head()) 

# printing first 5 values of response vector 
print("\nResponse vector:\n", y.head())



# In[2]:



from sklearn.model_selection import train_test_split 
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.4, random_state=1) 
  
# printing the shapes of the new X objects 
print(X_train.shape) 
print(X_test.shape) 
  
# printing the shapes of the new y objects 
print(y_train.shape) 
print(y_test.shape)


# In[3]:


from sklearn.model_selection import train_test_split 
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.4, random_state=1) 
  
# training the model on training set 
from sklearn.neighbors import KNeighborsClassifier 
knn = KNeighborsClassifier(n_neighbors=3) 
knn.fit(X_train, y_train) 
  
# making predictions on the testing set 
y_pred = knn.predict(X_test) 
from sklearn import metrics 
print("kNN model accuracy:", metrics.accuracy_score(y_test, y_pred)) 

# making prediction for out of sample data 
sample = [[25, 91, 5, 212],[5, 8, 6, 200]]
preds = knn.predict(sample) 
 
print("Predictions:", preds) 



# In[7]:


from sklearn.externals import joblib 
joblib.dump(knn, 'crop_prediction.pkl')


# In[6]:


#!pip install joblib

