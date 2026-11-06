from sklearn import svm, metrics

# 1.데이터 준비 - 학습데이터 , 테스트데이터 분리 8:2
# 학습데이터 : 2차원배열형태
data = [ [0,0],[0,1],[1,0],[1,1] ]
label = [0,1,1,0]

#테스트 데이터
test_data = [[0,0],[1,0]]
test_label = [0,1]

# 2.데이터 학습
clf = svm.SVC()         #알고리즘 선택
clf.fit(data, label)    #학습

# 3.데이터 예측
result = clf.predict(test_data) #테스트데이터를 가지고 예측실행
print('예측결과 : ',result) #0,1

# 4.정답율
# score = metrics.accuracy_score(test_label, result)
score = clf.score(test_data, test_label) #정답률ㅇ르 계산할수 있음

print("정답율 : ",score) #1.0