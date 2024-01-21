import random
from faker import Faker
import pymysql

# Initialize Faker
fake = Faker()

# Database connection configuration
config = {
    'host': 'localhost',  # or your server's IP address
    'user': 'username',
    'password': 'password',
    'db': 'Martian_Database',
    'charset': 'utf8mb4',
    'cursorclass': pymysql.cursors.DictCursor
}

# Establishing the connection
conn = pymysql.connect(**config)
cursor = conn.cursor()

# Generate and insert data
for _ in range(1000):
    first_name = fake.first_name()
    middle_name = fake.first_name()
    last_name = fake.last_name()
    martian_id = fake.unique.bothify(text='###########')  # Generates a random 11 character string
    birth_date = fake.date_of_birth(minimum_age=18, maximum_age=60).isoformat()
    martian_address = fake.address().replace('\n', ', ')[:30]  # Truncated to fit 30 chars limit
    sex = random.choice(['M', 'F'])
    martian_salary = round(random.uniform(30000, 100000), 2)
    sector_commander_id = fake.bothify(text='#########')  # Generates a random 9 character string
    sector_number = random.randint(1, 100)  # Assuming sector numbers are integers between 1 and 100

    insert_query = """
    INSERT INTO Martian_Workers (FirstName, MiddleName, Lastname, MartianID, BirthDate, MartianAddress, Sex, MartianSalary, SectorCommanderID, SectorNumber)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """
    values = (first_name, middle_name, last_name, martian_id, birth_date, martian_address, sex, martian_salary, sector_commander_id, sector_number)

    cursor.execute(insert_query, values)

# Commit changes and close the connection
conn.commit()
cursor.close()
conn.close()

print("Data insertion complete.")
