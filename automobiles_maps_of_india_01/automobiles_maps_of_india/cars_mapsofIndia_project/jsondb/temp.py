## json cars data

# import json

# main_db = json.load(open('cars.json'))
# print(len(main_db))


# img_db = json.load(open('cars_image.json'))
# print(len(img_db))

# for i in range(len(main_db)):
#     print(main_db[i]['id'])
#     main_db[i]['image'] = img_db[i]['image']

# with open('final.json','w') as f:
#     json.dump(main_db,f,indent=4)


## json petrol pump
# import json
#
# data = json.load(open('patrolPump.json'))
#
# initial_data = []
#
# for i in range(len(data)):
#     d = {
#         "model" : "cars.petrolpump",
#         "pk" : i+1,
#         "fields" : data[i]
#     }
#     initial_data.append(d)
#
# with open('initial_data_petrolpump.json','w') as f:
#     json.dump(initial_data,f,indent=4)

##json service centre

import json

# Load the original JSON data



data = json.load(open('service_centers.json'))

initial_data = []

# Iterate through the data and format it for Django fixtures



for i, item in enumerate(data):
    d = {
        "model": "carshanders.ServiceCenter",  # Replace 'your_app' with your actual app name
        "pk": i + 1,
        "fields": {
            "name": item.get('name'),
            "description": item.get('description', ''),
            "phone": item.get('phone'),
            "address": item.get('address'),
            "state": item.get('state'),
            "city": item.get('city'),
            "brand": item.get('brand'),  # Make sure brand matches CarBrand name in the database
            "is_active": True
        }
    }
    initial_data.append(d)

# Save the formatted data to a new JSON file
with open('initial_data_service_centers.json', 'w') as f:
    json.dump(initial_data, f, indent=4)

print("Data has been formatted and saved as 'initial_data_service_centers.json'")

