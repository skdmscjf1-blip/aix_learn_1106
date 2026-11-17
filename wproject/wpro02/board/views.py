from django.shortcuts import render
from django.shortcuts import render
from django.http import JsonResponse
from scipy.special import softmax
from pathlib import Path
import os
import joblib
import numpy as np

BASE_DIR = Path(__file__).resolve().parent.parent
model = joblib.load(BASE_DIR / 'model_ex.joblib')

def ajax_data(request):
    global model
    data = request.POST.get('data','40,10,10,10,10')
    #변환
    in_data1 = data.split(',')
    in_data1 = list(map(float,in_data1))
    #예측
    result = model.predict([in_data1])
    decisions = model.decision_function([in_data1])
    soft1 = softmax(decisions,axis=1)
    result3 = np.round(soft1,decimals=3)[0]
    print(model[-1].classes_)
    
    if result[0] == 'Bream':
        result4 = result3[0]
    elif result[0] == 'Parkki':
        result4 = result3[1]
    elif result[0] == 'Perch':
        result4 = result3[2]
    elif result[0] == 'Pike':
        result4 = result3[3]
    elif result[0] == 'Roach':
        result4 = result3[4]
    elif result[0] == 'Smelt':
        result4 = result3[5]
    elif result[0] == 'Whitefish':
        result4 = result3[6]
    print(result3)
    print(result4)
    context = {'result':result[0], #분류예측생선
            'result2':result4,      #예측 확률
            'result3':result3.tolist()} #생선전체확률


    return JsonResponse(context)