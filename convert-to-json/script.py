import pandas as pd
import json
import csv

header = ["id",
          "date_created",
          "date_last_modified",
          "active_date",
          "name",
          "phone",
          "resign_date",
          "resign_reason",
          "status",
          "tipe",
          "area",
          "CONCAT('operator_',id)",
          "modified_by",
          "vehicle_type",
          "helmet_qty",
          "jacket_qty",
          "vehicle_brand",
          "vehicle_year",
          "bike_type",
          "first_ride_bonus_awarded",
          "is_doc_completed"
          ]

df = pd.read_csv('driver_registration.csv')
df.columns = header
df.to_csv('driver_registration_new.csv', index=False)

data_csv = pd.read_csv('driver_registration_new.csv')

data_dict = data_csv.to_dict(orient='records')

with open('driver_registration.json', 'w') as fp:
    fp.write(
        '\n'.join(json.dumps(i) for i in data_dict) +
        '\n')