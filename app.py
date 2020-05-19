import numpy as np
from flask import Flask, request, jsonify, render_template
import joblib





app = Flask(__name__)
model = joblib.load(open('crop_prediction.pkl', 'rb'))
tenure = joblib.load(open('tenure.pkl', 'rb'))
cost = joblib.load(open('cost.pkl', 'rb'))
loans = joblib.load(open('loans.pkl', 'rb'))

pesticides=joblib.load(open('pesticides.pkl', 'rb'))
@app.route('/')
def home():
    return render_template('index.html')

@app.route('/predict',methods=['POST'])
def predict():
    '''
    For rendering results on HTML GUI
    '''
    int_features = [float(x) for x in request.form.values()]
    final_features = [np.array(int_features)]
    prediction = model.predict(final_features)

    output1 = prediction[0]
    
    
    
    
    
    
    tenure_filtered=tenure[tenure['Crops'] == output1]
    a=tenure_filtered['min.time']
    b=tenure_filtered['max.time']

    l = str(a)
    l=l.split("\n")
    l=l[0]
    l=l.split()
    output2=l[1]

    m = str(b)
    m=m.split("\n")
    m=m[0]
    m=m.split()
    output3=m[1]
    
    
    
    cost_filtered=cost[cost['Crop'] == output1]
    
    a1=cost_filtered['Field Preparation']
    a2=cost_filtered['Nursery and planting sowing']
    a3=cost_filtered['Weeding']
    a4=cost_filtered['Protection']
    a5=cost_filtered['Fertilizers']
    a6=cost_filtered['Wages']
    a7=cost_filtered['Staking, transport and other expenses']
    a8=cost_filtered['Total']
    
    x1 = str(a1)
    x1=x1.split("\n")
    x1=x1[0]
    x1=x1.split()
    output4=x1[1]
    
    x2 = str(a2)
    x2=x2.split("\n")
    x2=x2[0]
    x2=x2.split()
    output5=x2[1]
    
    x3 = str(a3)
    x3=x3.split("\n")
    x3=x3[0]
    x3=x3.split()
    output6=x3[1]
    
    x4 = str(a4)
    x4=x4.split("\n")
    x4=x4[0]
    x4=x4.split()
    output7=x4[1]
    
    x5 = str(a5)
    x5=x5.split("\n")
    x5=x5[0]
    x5=x5.split()
    output8=x5[1]
    
    x6 = str(a6)
    x6=x6.split("\n")
    x6=x6[0]
    x6=x6.split()
    output9=x6[1]
    
    x7 = str(a7)
    x7=x7.split("\n")
    x7=x7[0]
    x7=x7.split()
    output10=x7[1]
    
    x8 = str(a8)
    x8=x8.split("\n")
    x8=x8[0]
    x8=x8.split()
    output11=x8[1]


    
    pesticides_filtered=pesticides[pesticides['Crop'] == output1]
   
    output12 = pesticides_filtered['Diseases']
    
    output13 = pesticides_filtered['Pesticide']

    return render_template('index.html', prediction_text="Best Predicted crop is {} \n Minimum tenure for the crop is {} months and Maximum tenure for the crop is {} months \n \n Costing of of crop is going to be as follows:\n\n Field Preparation  :  {} Rs\n Nursery and planting sowing  :  {} Rs\n Weeding  :  {} Rs\n Protection  :  {} Rs\n Fertilizers  :  {} Rs\n Wages  :  {} Rs\n Staking, transport and other expenses  :  {} Rs\n\n Total costing  :  {} Rs\n\n Possible Diseases for the crop are as follows: \n\n{}\n\n Respective pesticide for the respective disease is as follows\n\n{}".format(output1,output2,output3,output4,output5,output6,output7,output8,output9,output10,output11,output12,output13).replace('\n', '<br>'))



@app.route('/banks',methods=['POST'])
def banks():    

    return render_template('/banks.html', table0=loans.to_html (header = 'true'))



if __name__ == "__main__":
    app.run(debug=True)
