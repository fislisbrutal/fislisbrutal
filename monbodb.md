

### Запускаем MongoDB контейнер

<img width="1008" height="597" alt="image" src="https://github.com/user-attachments/assets/aedfbf4b-72c0-439d-8891-3a8ac634b0a3" />

### Подготовим js файл с данными

```
db = db.getSiblingDB('smartphones_db');

db.createUser({
  user: "user",
  pwd: "user",
  roles: [{
    role: "readWrite",
    db: "smartphones_db"
  }]
});

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
  },
  {
    brand: "Google",
    model: "Pixel 8 Pro",
    price: 89999,
    storage: 128,
    ram: 12,
    os: "Android",
    screen_size: 6.7,
    release_year: 2023,
    features: ["5G", "Google Tensor", "AI features", "Great camera"],
    in_stock: true,
    colors: ["black", "blue", "cream"],
    created_at: new Date()
  },
  {
    brand: "Huawei",
    model: "P60 Pro",
    price: 79999,
    storage: 512,
    ram: 12,
    os: "HarmonyOS",
    screen_size: 6.67,
    release_year: 2023,
    features: ["4G", "Leica camera", "OLED", "Fast charging"],
    in_stock: true,
    colors: ["black", "purple", "green"],
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
  },
  {
    brand: "Lenovo",
    model: "Tab P12 Pro",
    price: 59999,
    storage: 256,
    ram: 6,
    os: "Android",
    screen_size: 12.6,
    release_year: 2022,
    features: ["OLED display", "Quad speakers", "Stylus support"],
    in_stock: false,
    has_keyboard: true,
    created_at: new Date()
  },
  {
    brand: "Xiaomi",
    model: "Pad 6",
    price: 39999,
    storage: 128,
    ram: 6,
    os: "Android",
    screen_size: 11,
    release_year: 2023,
    features: ["144Hz display", "Snapdragon 870", "Quad speakers"],
    in_stock: true,
    has_keyboard: false,
    created_at: new Date()
  }
]);

print("data uploaded");
```
### Копируем и загружаем данные

<img width="1003" height="596" alt="image" src="https://github.com/user-attachments/assets/fbb677ed-8ff0-44bc-9586-748dbb94f958" />

