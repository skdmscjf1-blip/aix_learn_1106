import pandas as pd

# 파일읽어오기
df = pd.read_json('db/galleryList1.json',encoding='utf-8-sig')
print(df.head(2))


# 파일저장
df.to_csv('db/galleryList1.csv',encoding='utf-8-sig')
print('완료')