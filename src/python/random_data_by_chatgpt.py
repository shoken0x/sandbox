import csv
import datetime
import random
from faker import Faker

fake = Faker('ja_JP')

start_date = datetime.date(2020, 1, 1)
end_date = datetime.date(2022, 12, 31)

events = [fake.word() for _ in range(1500)]
event_dates = [fake.date_between(start_date=start_date, end_date=end_date).strftime('%Y/%m/%-d') for _ in events]

with open('data.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['日付', 'イベント名', '氏名', 'メールアドレス', '電話番号', '住所'])
    for _ in range(2000):
        event_index = random.randint(0, len(events) - 1)
        event = events[event_index]
        date = event_dates[event_index]
        name = fake.name()
        email = fake.email(domain='example.com')
        phone_number = fake.phone_number()
        address = fake.address()

        writer.writerow([date, f'{event}のお手伝い', name, email, phone_number, address])
