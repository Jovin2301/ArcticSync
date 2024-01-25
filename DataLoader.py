from ExtractDir import ModuleInstaller
required_modules = ["snowflake-connector-python", "requests", "time", "os"]
installer = ModuleInstaller()
installer.install_modules(required_modules)
import os
import snowflake.connector
import requests
import time as t
start = int(t.time())  # start on console bootup
print(f"Console start is successful {start}.\nProgressing on to next phase.")



WAREHOUSE = input("Enter Warehouse Name (NWT_WAREHOUSE) : ")
ACCOUNT = input("Enter Account Name (qd77687.ap-southeast-1) : ")
USER =  input("Enter User Name (groupaccount1 / YOUR USER): ")
PASSWORD = input("Enter Account Password: ")
DATABASE = input("Enter Database Name (ASSIGNMENT2): ")
SCHEMA = input("Enter Schema (shared schema is NWT): ")

"""
PASSWORD = "Groupaccount1"
WAREHOUSE = "NWT_WAREHOUSE"
ACCOUNT = "qd77687.ap-southeast-1"
USER = "groupaccount1"
DATABASE = "ASSIGNMENT2"
SCHEMA = "NWT_FARIS"
"""

print("\nConnecting to Snowflake...")
try:
    con = snowflake.connector.connect(
        user=USER,
        password=PASSWORD,
        account=ACCOUNT,
        warehouse=WAREHOUSE,
        database=DATABASE,
        schema=SCHEMA
    )

except Exception as e:
    print(e)
    print(int(t.time()) - start)  # start on console bootup vs current
    t.sleep(5) # allow reading
    exit()

else:
    print("\nConnecting to Snowflake successful!\nProceeding on to next phase.")
    print(int(t.time()) - start)
    pass


github_url = input("Paste the github url here [RAW]: ")
# github_url = 'https://raw.githubusercontent.com/just4jc/Northwind-Traders-Dataset/main/order_detail_fresh.csv'
file_name = input("Enter file name to save as (include .csv behind): ")
response = requests.get(github_url)
with open(file_name, 'w') as file:
    file.write(response.text)

absolute_path = os.path.abspath(file_name).replace("\\", "/")
print(f"The file is saved at: {absolute_path}")    
cc = response.text
cc2 = [line.strip() for line in cc.split('\n') if line.strip()]
cc = '\n'.join(cc2)


insert = input("Enter the name of the Snowflake Table to insert the .csv file into (aka for order_detail_fresh, enter FRESH_ORDERS_DETAILS): ")

try: 
    con.cursor().execute(f"""
    PUT 'file://{absolute_path}' @%{insert}
    """)

    con.cursor().execute(f"""
    COPY INTO {insert}
        FROM @%{insert}
        FILE_FORMAT=(SKIP_HEADER=1, FIELD_DELIMITER=',')
    """)

    csvins = con.cursor().execute(f"SELECT * FROM {insert}").fetchall()
    print(csvins)

    print("Process Successful!")
    t.sleep(5)
except Exception as e:
    print(e)
    print(int(t.time()) - start)
    t.sleep(5)    
