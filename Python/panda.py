import pandas as pd

l1 = [14, 52, 57, 17]

ps1 =pd.Series(l1)  #convert list to panda series 

print(ps1)
print(type(ps1))


data = {
    'name':['amol','rahul','sham','ram'],
    'age':[24,30,25,32],
    'city':['mumbai','delhi','surat','nagpur']

}

df = pd.DataFrame(data) #convert dict to dataframe 

print(f'type of df is : {type(df)}')

print(df)


print(df.head)   #give first five value from dataframe
print(df.tail)   #give last five value from dataframe

