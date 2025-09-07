

### Запускаем MongoDB контейнер

<img width="1008" height="597" alt="image" src="https://github.com/user-attachments/assets/aedfbf4b-72c0-439d-8891-3a8ac634b0a3" />

### Создаем пользователя

<img width="1011" height="602" alt="image" src="https://github.com/user-attachments/assets/592ca8cf-b149-47f7-8efb-722e297f81c6" />

### Создаем JS файл с данными и загружаем его

```
db = db.getSiblingDB('admin');
db.auth('root', 'root');

db = db.getSiblingDB('smartphones_db');

db.smartphones.insertMany([
  {
    brand: "Samsung",
    model: "Galaxy S23 Ultra",
    price: 99999,
    storage: 256,
    ram: 12,
    os: "Android",
    screen_size: 6.8,
    release_year: 2023,
    features: ["5G", "S-Pen", "120Hz display", "Quad camera"],
    in_stock: true,
    colors: ["black", "green", "cream"],
    created_at: new Date()
  },
  {
    brand: "Apple",
    model: "iPhone 15 Pro",
    price: 119999,
    storage: 128,
    ram: 8,
    os: "iOS",
    screen_size: 6.1,
    release_year: 2023,
    features: ["5G", "Titanium frame", "ProMotion", "Triple camera"],
    in_stock: true,
    colors: ["black", "white", "blue", "natural"],
    created_at: new Date()
  },
  {
    brand: "Xiaomi",
    model: "13 Pro",
    price: 69999,
    storage: 256,
    ram: 12,
    os: "Android",
    screen_size: 6.73,
    release_year: 2023,
    features: ["5G", "Leica camera", "120W charging", "AMOLED"],
    in_stock: false,
    colors: ["black", "white", "green"],
    created_at: new Date()
  }
]);

db.tablets.insertMany([
  {
    brand: "Apple",
    model: "iPad Pro 12.9",
    price: 129999,
    storage: 256,
    ram: 8,
    os: "iPadOS",
    screen_size: 12.9,
    release_year: 2022,
    features: ["M2 chip", "Liquid Retina XDR", "5G", "Apple Pencil support"],
    in_stock: true,
    has_keyboard: true,
    created_at: new Date()
  },
  {
    brand: "Samsung",
    model: "Galaxy Tab S9",
    price: 89999,
    storage: 128,
    ram: 8,
    os: "Android",
    screen_size: 11,
    release_year: 2023,
    features: ["S-Pen", "120Hz AMOLED", "5G", "DeX mode"],
    in_stock: true,
    has_keyboard: false,
    created_at: new Date()
  }
]);

print("data uploaded!");
```

<img width="846" height="288" alt="image" src="https://github.com/user-attachments/assets/5c35b8ad-f4f1-4db2-9d0e-c8dda0931a13" />


### Проверяем, что данные добавились

```
smartphones_db> db.smartphones.find()
... 
[
  {
    _id: ObjectId('68bdc7ec3e0badec4e2b925c'),
    brand: 'Samsung',
    model: 'Galaxy S23 Ultra',
    price: 99999,
    storage: 256,
    ram: 12,
    os: 'Android',
    screen_size: 6.8,
    release_year: 2023,
    features: [ '5G', 'S-Pen', '120Hz display', 'Quad camera' ],
    in_stock: true,
    colors: [ 'black', 'green', 'cream' ],
    created_at: ISODate('2025-09-07T17:59:08.633Z')
  },
  {
    _id: ObjectId('68bdc7ec3e0badec4e2b925d'),
    brand: 'Apple',
    model: 'iPhone 15 Pro',
    price: 119999,
    storage: 128,
    ram: 8,
    os: 'iOS',
    screen_size: 6.1,
    release_year: 2023,
    features: [ '5G', 'Titanium frame', 'ProMotion', 'Triple camera' ],
    in_stock: true,
    colors: [ 'black', 'white', 'blue', 'natural' ],
    created_at: ISODate('2025-09-07T17:59:08.633Z')
  },
  {
    _id: ObjectId('68bdc7ec3e0badec4e2b925e'),
    brand: 'Xiaomi',
    model: '13 Pro',
    price: 69999,
    storage: 256,
    ram: 12,
    os: 'Android',
    screen_size: 6.73,
    release_year: 2023,
    features: [ '5G', 'Leica camera', '120W charging', 'AMOLED' ],
    in_stock: false,
    colors: [ 'black', 'white', 'green' ],
    created_at: ISODate('2025-09-07T17:59:08.633Z')
  },
  {
    _id: ObjectId('68bdc7ec3e0badec4e2b925f'),
    brand: 'Google',
    model: 'Pixel 8 Pro',
    price: 89999,
    storage: 128,
    ram: 12,
    os: 'Android',
    screen_size: 6.7,
    release_year: 2023,
    features: [ '5G', 'Google Tensor', 'AI features', 'Great camera' ],
    in_stock: true,
    colors: [ 'black', 'blue', 'cream' ],
    created_at: ISODate('2025-09-07T17:59:08.633Z')
  },
  {
    _id: ObjectId('68bdc7ec3e0badec4e2b9260'),
    brand: 'Huawei',
    model: 'P60 Pro',
    price: 79999,
    storage: 512,
    ram: 12,
    os: 'HarmonyOS',
    screen_size: 6.67,
    release_year: 2023,
    features: [ '4G', 'Leica camera', 'OLED', 'Fast charging' ],
    in_stock: true,
    colors: [ 'black', 'purple', 'green' ],
    created_at: ISODate('2025-09-07T17:59:08.633Z')
  },
  {
    _id: ObjectId('68bdca15c80751cbca2b925c'),
    brand: 'Samsung',
    model: 'Galaxy S23 Ultra',
    price: 99999,
    storage: 256,
    ram: 12,
    os: 'Android',
    screen_size: 6.8,
    release_year: 2023,
    features: [ '5G', 'S-Pen', '120Hz display', 'Quad camera' ],
    in_stock: true,
    colors: [ 'black', 'green', 'cream' ],
    created_at: ISODate('2025-09-07T18:08:21.752Z')
  },
  {
    _id: ObjectId('68bdca15c80751cbca2b925d'),
    brand: 'Apple',
    model: 'iPhone 15 Pro',
    price: 119999,
    storage: 128,
    ram: 8,
    os: 'iOS',
    screen_size: 6.1,
    release_year: 2023,
    features: [ '5G', 'Titanium frame', 'ProMotion', 'Triple camera' ],
    in_stock: true,
    colors: [ 'black', 'white', 'blue', 'natural' ],
    created_at: ISODate('2025-09-07T18:08:21.752Z')
  },
  {
    _id: ObjectId('68bdca15c80751cbca2b925e'),
    brand: 'Xiaomi',
    model: '13 Pro',
    price: 69999,
    storage: 256,
    ram: 12,
    os: 'Android',
    screen_size: 6.73,
    release_year: 2023,
    features: [ '5G', 'Leica camera', '120W charging', 'AMOLED' ],
    in_stock: false,
    colors: [ 'black', 'white', 'green' ],
    created_at: ISODate('2025-09-07T18:08:21.752Z')
  },
  {
    _id: ObjectId('68bdcb34764690c4e72b925c'),
    brand: 'Samsung',
    model: 'Galaxy S23 Ultra',
    price: 99999,
    storage: 256,
    ram: 12,
    os: 'Android',
    screen_size: 6.8,
    release_year: 2023,
    features: [ '5G', 'S-Pen', '120Hz display', 'Quad camera' ],
    in_stock: true,
    colors: [ 'black', 'green', 'cream' ],
    created_at: ISODate('2025-09-07T18:13:08.641Z')
  },
  {
    _id: ObjectId('68bdcb34764690c4e72b925d'),
    brand: 'Apple',
    model: 'iPhone 15 Pro',
    price: 119999,
    storage: 128,
    ram: 8,
    os: 'iOS',
    screen_size: 6.1,
    release_year: 2023,
    features: [ '5G', 'Titanium frame', 'ProMotion', 'Triple camera' ],
    in_stock: true,
    colors: [ 'black', 'white', 'blue', 'natural' ],
    created_at: ISODate('2025-09-07T18:13:08.641Z')
  },
  {
    _id: ObjectId('68bdcb34764690c4e72b925e'),
    brand: 'Xiaomi',
    model: '13 Pro',
    price: 69999,
    storage: 256,
    ram: 12,
    os: 'Android',
    screen_size: 6.73,
    release_year: 2023,
    features: [ '5G', 'Leica camera', '120W charging', 'AMOLED' ],
    in_stock: false,
    colors: [ 'black', 'white', 'green' ],
    created_at: ISODate('2025-09-07T18:13:08.641Z')
  },
  {
    _id: ObjectId('68bdcb34764690c4e72b925f'),
    brand: 'Google',
    model: 'Pixel 8 Pro',
    price: 89999,
    storage: 128,
    ram: 12,
    os: 'Android',
    screen_size: 6.7,
    release_year: 2023,
    features: [ '5G', 'Google Tensor', 'AI features', 'Great camera' ],
    in_stock: true,
    colors: [ 'black', 'blue', 'cream' ],
    created_at: ISODate('2025-09-07T18:13:08.641Z')
  }
]
smartphones_db> 
```
### Найдем смартфоны конкретного вендора

```
smartphones_db> db.smartphones.findOne({ brand: "Samsung" })
... 
{
  _id: ObjectId('68bdc7ec3e0badec4e2b925c'),
  brand: 'Samsung',
  model: 'Galaxy S23 Ultra',
  price: 99999,
  storage: 256,
  ram: 12,
  os: 'Android',
  screen_size: 6.8,
  release_year: 2023,
  features: [ '5G', 'S-Pen', '120Hz display', 'Quad camera' ],
  in_stock: true,
  colors: [ 'black', 'green', 'cream' ],
  created_at: ISODate('2025-09-07T17:59:08.633Z')
}
smartphones_db> 
```
### Обновим цену для устройства

```
smartphones_db> db.smartphones.updateOne(
...   { model: "iPhone 15 Pro" },
...   { $set: { price: 125000 } }
... )
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
```
