
import pandas as pd
import numpy as np
from janitor import clean_names #consola : pip install pyjanitor
from unidecode  import unidecode #pip install unidecode



####################################
#   IMPORTO EL ARCHIVO DE DATOS   #
####################################


'''
importo el archivo separado por ; y selecciono las columnnas que estamos interesadas
'''

df = pd.read_csv(r'C:\Users\Jimenean\OneDrive - Edgewell Personal Care\Desktop\PERSONAL\0.CURSOS\0. PROGRAMACIÓN GLOVO\PROYECTO FINAL\airbnb-listings.csv', sep=';')

df_airbnb = pd.DataFrame(df , columns =['ID','Host ID','Host Since','Host Location','Host Response Time','Host Response Rate',
'Host Listings Count','Host Total Listings Count','Neighbourhood Cleansed', 'Neighbourhood Group Cleansed', 
'City','State', 'Zipcode', 'Market', 'Smart Location', 'Country Code','Country','Latitude', 'Longitude', 
'Property Type', 'Room Type','Accommodates', 'Bathrooms', 'Bedrooms', 'Beds', 'Bed Type','Amenities','Price',
'Weekly Price','Monthly Price','Security Deposit','Cleaning Fee', 'Guests Included', 'Extra People','Minimum Nights','Maximum Nights',
'Number of Reviews','Review Scores Rating', 'Review Scores Accuracy','Review Scores Cleanliness','Review Scores Checkin', 
'Review Scores Communication','Review Scores Location','Review Scores Value', 'Cancellation Policy','Calculated host listings count','Reviews per Month','Features'] )



####################################
#   FAMILIARIZACIÓN DE LOS DATOS   #
####################################


'''
Compruebo el número de columnas y filas que he importado. 
'''

print(df_airbnb.head())

print('filas:',len(df_airbnb.axes[0])," ",'columnas', len(df_airbnb.axes[1]))  #14780 filas & 48 columnas


'''
Compruebo los tipos de datos de las columnas y verifico si tienen sentido o hay que modificarlos. 
Cambio Host Since porque aparece como object, lo transformo en fecha 

'''

print(df_airbnb.dtypes) # las que son de tipo character o string en pandas me las marca como object que indica que pueden ser str o mixed. --> OK 

df_airbnb['Host Since'] = pd.to_datetime(df_airbnb['Host Since'], format='%Y-%m-%d') 

print(df_airbnb.dtypes) #Compruebo --> OK 



'''
Compruebo si ID es una PK 
'''

print(df_airbnb['ID'].is_unique) # True --> ID es una PK

print(df_airbnb['Host ID'].is_unique) # False , hay host que se repiten --> No sería PK 





#####################################
# NORMALIZACIÓN Y LIMPIEZA DE DATOS #
#####################################



'''
Limpio los nombres de las columnas: Elimino espacios por '_'  y elimino posibles filas vacías
'''

df_airbnb = df_airbnb.clean_names().remove_empty()


'''
Transformo los nombres de columnas a mayúsculas para más legilibilidad 
'''

df_airbnb.columns = map(str.upper, df_airbnb.columns)




#############################
# LIMPIEZA DE VALORES NULOS #
#############################


'''
Observamos que columnas son las que más valores nulos contienen y decidimos como tratarlos ya que necesitamos tener un DF sin NANs para que no interfiera luego en el analisis.
Hago esto antes de normalizar/limpiar/transformar los datos a ASCII & Uppercase porque si no pierdo los NaNs
'''

print(df_airbnb.isna().sum())

'''
Para los campos:

- BEDROOMS - 25 Nans
- BEDS - 49
- BATHROOMS -55

- SECURITY DEPOSIT - 8524
- CLEANING_FEE - 6093
- AMENITIES - 170
- FEATURES - 1 
- Todos los campos de REVIEWS  - + de 3000 Nans cada uno


transformaremos el NAN a 0 puesto que el no tener un valor NaN supone que no dispone de esas facilidades, que esa propiedad no tiene coste extra de limpieza o fianza
o que el usuario no ha querido dejar review.

'''

df_airbnb[['BEDROOMS','BEDS','BATHROOMS','SECURITY_DEPOSIT','CLEANING_FEE','AMENITIES', 'FEATURES','REVIEW_SCORES_RATING','REVIEW_SCORES_ACCURACY','REVIEW_SCORES_CLEANLINESS',
           'REVIEW_SCORES_CHECKIN','REVIEW_SCORES_COMMUNICATION','REVIEW_SCORES_LOCATION','REVIEW_SCORES_VALUE','REVIEWS_PER_MONTH']] = df_airbnb[['BEDROOMS','BEDS','BATHROOMS','SECURITY_DEPOSIT','CLEANING_FEE','AMENITIES','FEATURES','REVIEW_SCORES_RATING','REVIEW_SCORES_ACCURACY','REVIEW_SCORES_CLEANLINESS',
           'REVIEW_SCORES_CHECKIN','REVIEW_SCORES_COMMUNICATION','REVIEW_SCORES_LOCATION','REVIEW_SCORES_VALUE','REVIEWS_PER_MONTH']].fillna(0)


print('**comprobación de NAs en 0 aquí**')
print(df_airbnb.isna().sum())  #Compruebo que me los ha quitado correctamente.



'''
para los campos:

- WEEKLY PRICE - 11190 Nans
- MONTHLY PRICE - 11219  Nans 

Asumimos que el campo es nulo puesto que el propietario no ofrece de ninguna oferta/descuento de alquiler mensual o semanal. 
Por lo tanto, completaremos ambos campos asumiendo que el coste total sería el precio diario * los dias de alquiler (precio diario * 7 o precio diario * 30) y lo guardaremos en una nueva columna ya limpia 

'''

df_airbnb['WEEKLY_PRICE_CLEANSED'] = np.where(df_airbnb['WEEKLY_PRICE'].isnull(), df_airbnb['PRICE'] * 7, df_airbnb['WEEKLY_PRICE'])

df_airbnb['MONTHLY_PRICE_CLEANSED'] = np.where(df_airbnb['MONTHLY_PRICE'].isnull(), df_airbnb['PRICE'] * 30, df_airbnb['MONTHLY_PRICE'])


print(df_airbnb.columns) #comprobamos que nos ha creado la columna
print(df_airbnb.isna().sum())  #y que no tienen Nans.


'''
Miramos también el caso contrario, si PRICE es NaN y WEEKLY_PRICE o MONTHLY_PRICE tienen datos, calculamos la inversa. (Consigo 4 campos más de 17 NaN a 13)
Después de calcular los que faltan, quitamos del modelo los siguen faltando/NaN ya que esté campo es clave para nuestro analisis y no tenemos suficiente información para inferirlo 

'''

df_airbnb['PRICE_CLEANSED'] = np.where(df_airbnb['PRICE'].isnull(), df_airbnb['WEEKLY_PRICE_CLEANSED'] / 7, df_airbnb['PRICE'])
df_airbnb['PRICE_CLEANSED'] = np.where(df_airbnb['PRICE'].isnull(), df_airbnb['MONTHLY_PRICE_CLEANSED'] / 30, df_airbnb['PRICE'])

print(df_airbnb.columns) #comprobamos que nos ha creado la columna
print(df_airbnb.isna().sum())  #y que no tienen Nans.


'''
Quito entonces la columna Price, Weekly Price y Monthly Price de mi df puesto que ya no las necesito.
También elimino las filas cuyo PRICE_CLEANSED sea null
'''

df_airbnb = df_airbnb.drop(columns = ['WEEKLY_PRICE','MONTHLY_PRICE','PRICE'])
df_airbnb.dropna(subset=['PRICE_CLEANSED'],inplace = True) #elimino todas las fillas con NaN, el inplace es para que me lo haga sobre el df.


print(df_airbnb.columns) #compruebo
print(df_airbnb.isna().sum())


'''
otros campos a limpiar

HOST_RESPONSE_RATE - 1899 Nans (cambiar a 0 no tenemos suficientes datos)
HOST_RESPONSE_TIME - 1899 Nans (cambiar a 0 no tenemos suficientes datos)
HOST_LISTINGS_COUNT - 3 Nans (cambiar a 0 no tenemos suficientes datos)
HOST_TOTAL_LISTINGS_COUNT - 3 Nans (cambiar a 0 no tenemos suficientes datos)
CALCULATED_HOST_LISTINGS_COUNT -4 Nans (cambiar a 0 no tenemos suficientes datos)
HOST_SINCE - 3 (cambiar a 0 no tenemos suficientes datos)

No disponemos de suficiente información para inferir el campo por lo que lo transformamos en 0. Posiblemente lo excluiremos del analisis 
'''

df_airbnb['HOST_SINCE'] = df_airbnb['HOST_SINCE'].astype(str) 

df_airbnb[['HOST_SINCE','HOST_RESPONSE_RATE','HOST_RESPONSE_TIME','HOST_LISTINGS_COUNT','HOST_TOTAL_LISTINGS_COUNT','CALCULATED_HOST_LISTINGS_COUNT']] = df_airbnb[['HOST_SINCE','HOST_RESPONSE_RATE','HOST_RESPONSE_TIME','HOST_LISTINGS_COUNT','HOST_TOTAL_LISTINGS_COUNT','CALCULATED_HOST_LISTINGS_COUNT']].fillna(0)


df_airbnb['HOST_SINCE'] = pd.to_datetime(df_airbnb['HOST_SINCE'], format='%Y-%m-%d') #vuelvo a pasarlo a fecha porque al quitarle el NaN me lo ha pasado a object otra vez. Primero he tenido que pasarlo a string porque me daba error


print(df_airbnb.isna().sum())  #Compruebo que me los ha quitado correctamente.



#############################
#  LIMPIEZA DE LOCALIZACIÓN #
#############################

'''
Compruebo que columna de localización es más efectiva para filtrar nuestro df por Madrid. Mirando cual tiene menos NaNs y cual identifica mejor Madrid
'''
print(df_airbnb.isna().sum()) #Latitude no tiene ningún NaN, le seguiría City(6) y luego Market (57). NEIGHBOURHOOD_CLEANSED sería el campo para utilizar para Barrio puesto que no tiene NaNs


'''
elimino NEIGHBOURHOOD_GROUP_CLEANSED puesto que tiene muchos NaNs y ya tengo NEIGHBOURHOOD_CLEANSED para poder analizar sin NaNs.
'''

df_airbnb = df_airbnb.drop(columns = ['NEIGHBOURHOOD_GROUP_CLEANSED'])


'''
Transformo todos los NaNs en 0 de momento para poder analizar que campo me interesa más para filtrar mi df por Madrid.

'''

df_airbnb[['HOST_LOCATION','CITY','STATE','ZIPCODE','MARKET','COUNTRY']] = df_airbnb[['HOST_LOCATION','CITY','STATE','ZIPCODE','MARKET','COUNTRY']].fillna(0)


print('**RECUENTO DE COLUMNAS CON NANS**')
print(df_airbnb.isna().sum()) 




'''
Normalizo y transformo los datos en ASCII para aquellas columnas que son objects - asi podemos tratar mejor y unificar ciudades, barrios etc. 
Primero las transformo en strings ya que al intentar pasarlas a ASCII (unidecode) me da error porque alguna de ellas podrían contener números u otro tipo de datos.
Luego las transformo a ASCII para eliminar acentos, simbolos raros,etc
Luego lo transformo todo a mayúsculas también para que se visualice mejor en Tableau más tarde y para unificar y posiblemente unir campos iguales pero escritos en Mayus/Minus
'''



df_airbnb_string_cols = df_airbnb.select_dtypes(include=['object'], exclude=['datetime64[ns]'])  #Me seguía cogiendo Host Since incluso al haberle cambiado de tipo, lo excluyo a proposito para asegurarme

df_airbnb_string_cols = df_airbnb_string_cols.astype(str)
df_airbnb_string_cols = df_airbnb_string_cols.applymap(lambda x: unidecode(x))
df_airbnb_string_cols = df_airbnb_string_cols.applymap(lambda x: x.upper())
df_airbnb[df_airbnb_string_cols.columns] = df_airbnb_string_cols




print('**RECUENTO DE COLUMNAS AFECTADAS CON LA LIMPIA**') #me aseguro que Host Since no está aquí
print(df_airbnb_string_cols.columns)



'''State '''

filtered_state = df_airbnb[df_airbnb['STATE'].str.contains("MADR|MAD", case=False)]
count_state = filtered_state['STATE'].count()
print('Hay', count_state, 'resultados para State conteniendo Madr o Mad') #13211


'''City'''

filtered_city = df_airbnb[df_airbnb['CITY'].str.contains("MADR|MAD", case=False)]
count_city = filtered_city['CITY'].count()
print('Hay', count_city, 'resultados para City conteniendo Madr o Mad') #13247


'''Smart Location'''

filtered_smart_loc = df_airbnb[df_airbnb['SMART_LOCATION'].str.contains("MADR|MAD", case=False)]
count_smart_loc = filtered_smart_loc['SMART_LOCATION'].count()
print('Hay', count_smart_loc, 'resultados para Smart Location conteniendo Madr o Mad') #13249


'''Market'''

filtered_market = df_airbnb[df_airbnb['MARKET'].str.contains("MADR|MAD", case=False)]
count_market= filtered_market['MARKET'].count()
print('Hay', count_market, 'resultados para Market  conteniendo Madr o Mad') #13274


'''
Latitude

todas las latitudes de Madrid empiezan por 40. Esta sería la mejor opción porque aparte de dar más resultados (13405), 
recoge también las ciudades de Madrid que no contienen MADR como Aravaca que hemos visto que el resto de campos no lo recogen bien i.e. City '''

filtered_latitude = df_airbnb[(df_airbnb['LATITUDE'] >= 40.0) & (df_airbnb['LATITUDE'] <= 41.0) ]

count_latitude = filtered_latitude["LATITUDE"].count()

print('Hay', count_latitude, 'resultados para Latitud empezando por 40') #13405 --> la mejor forma de identificar Madrid
      

'''
Identificamos aquellos datos que en City o Market no ponía Madrid pero por Latitud si lo son para ver si es un dato que se puede cambiar a Madrid o si por lo contrario se puede descartar.
'''

print(df_airbnb[(df_airbnb['LATITUDE'] >= 40.0) & (df_airbnb['LATITUDE'] <= 41.0) & ~(df_airbnb['CITY'].str.contains("MADR|MAD", case=False))]) # He comprobado en Jupyter Notebook como queda no puedo :( )


'''
Conclusión: Los que no son City Madrid pero Latitud 40, son todos Madrid menos los de State NY , la Latitud está mal puesto que todos son de NY. Se puede filtrar por Country SPAIN para no considerarlos.
Creamos una nueva variable/columna = CITY_CLEANSED, que sea MADRID para todas las latitudes 40 con Country SPAIN, para tener un dato limpio. 
'''

df_airbnb['CITY_CLEANSED'] = np.where((df_airbnb['LATITUDE'] >= 40.0) & (df_airbnb['LATITUDE'] <= 41.0) & (df_airbnb['COUNTRY'] == 'SPAIN'), 'MADRID', df_airbnb['CITY'])



##########################
#  EXPORTAR EL DF FINAL  #
##########################


'''
Exportamos el df con CITY_CLEANSED = 'MADRID' en formato csv para poder tratarlo en Dveaber y posteriormente Tableau y R. Modifico el separador a comas para que no nos de problemas en el resto de programas
'''

df_airbnb_cleansed = df_airbnb[df_airbnb['CITY_CLEANSED' ] == 'MADRID']

df_airbnb_cleansed.to_csv(r'C:\Users\Jimenean\OneDrive - Edgewell Personal Care\Desktop\PERSONAL\0.CURSOS\0. PROGRAMACIÓN GLOVO\PROYECTO FINAL\df_cleansed_airbnb.csv', index=False, sep=',')