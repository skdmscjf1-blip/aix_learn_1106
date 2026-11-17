from django.shortcuts import render
from django.http import JsonResponse
from pathlib import Path
import os
import joblib

#머신러닝 모델
BASE_DIR = Path(__file__).resolve().parent.parent
model =joblib.load(BASE_DIR / 'model.joblib')

def ajax_data(request): 

    data = request.POST.get('data','40,11.73,7.22')


    #파일변환
    input1 = data.split(',')
    input2 = list(map(float,input1))

    #예측
    result = model.predict([input2])
    print(f'예측무게 : {result[0]:.2f}g')
    # 파일전달
    context = {
        'result_data':f'{result[0]:.2f}','result':'success'
    }
    return JsonResponse(context)

def ajax_data1(request):
    data = request.POST.get('data','40,11.73,7.22')
    
    context = {'result':data,'result2':876.54}

    return JsonResponse(context)

def index(request):
    # BASE_DIR = Path(__file__).resolve().parent.parent
    # model =joblib.load(BASE_DIR / 'model.joblib')
    # #입력
    # # input1 = input('길이,높이,넓이를 입력하세요. 예)40.0,11.73,7.22').split(',')
    # input1 = '40.0,11.73,7.22'.split(',')
    # input2 = list(map(float,input1))
    # #예측
    # result = model.predict([input2])
    # print(f'예측무게 : {result[0]:.2f}g')

    
    # print("주소 : ",BASE_DIR)

    # html로 데이터 전달
    return render(request,'index.html')