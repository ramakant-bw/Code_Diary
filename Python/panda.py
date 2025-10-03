import pandas as pd

l1 = [14, 52, 57, 17]

ps1 =pd.Series(l1)

print(ps1)
print(type(ps1))


data = {
    'name':['amol','rahul','sham','ram'],
    'age':[24,30,25,32],
    'city':['mumbai','delhi','surat','nagpur']
}

df = pd.DataFrame(data)

print(f'type of df is : {type(df)}')

print(df)