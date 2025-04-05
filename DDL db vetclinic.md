# Описание схем данных

> Дефолтная `public` не используется

1. `clinic_core` содержит фундаментальные данные:
- Информация о клиентах (владельцах) и их питомцах
- Статусы, которые используются в других таблицах
2. `clinic_staff` включает всё, что связано с сотрудниками:
- Специализации врачей
- Данные ветеринаров
3. `clinic_services` содержит каталог услуг:
- Отдельная схема, так как услуги могут изменяться независимо
4. `clinic_operations` включает все операционные процессы:
- Записи на приём
- Лечения
- Медицинские записи
- Финансовые документы

#### Скрипт создания структуры базы данных `vetclinic`

``` -- Создание схем
CREATE SCHEMA clinic_core;
CREATE SCHEMA clinic_staff;
CREATE SCHEMA clinic_services;
CREATE SCHEMA clinic_operations;

-- Таблицы в схеме clinic_core
CREATE TABLE clinic_core."pet_owner" (
  "id" integer PRIMARY KEY,
  "first_name" varchar(150) NOT NULL,
  "last_name" varchar(150) NOT NULL,
  "phone" varchar(15) UNIQUE NOT NULL,
  "secondary_phone" varchar(15),
  "email" varchar(100) UNIQUE,
  "address" varchar(255) UNIQUE
);

CREATE TABLE clinic_core."pet" (
  "id" integer PRIMARY KEY,
  "pet_owner_id" integer NOT NULL,
  "name" varchar(50) NOT NULL,
  "species" varchar(50) NOT NULL,
  "breed" varchar(50) NOT NULL,
  "birth_date" date NOT NULL,
  "gender" varchar(10) NOT NULL,
  "color" varchar(50) NOT NULL,
  "description" text
);

CREATE TABLE clinic_operations."status" (
  "id" integer PRIMARY KEY,
  "name" varchar(50) UNIQUE NOT NULL,
  "type" varchar(20) NOT NULL
);

-- Таблицы в схеме clinic_staff
CREATE TABLE clinic_staff."specialization" (
  "id" integer PRIMARY KEY,
  "name" varchar(50) UNIQUE NOT NULL,
  "description" text
);

CREATE TABLE clinic_staff."veterinarian" (
  "id" integer PRIMARY KEY,
  "specialization_id" integer NOT NULL,
  "first_name" varchar(150) NOT NULL,
  "last_name" varchar(150) NOT NULL,
  "external_phone" varchar(15) UNIQUE,
  "internal_phone" varchar(15) UNIQUE NOT NULL,
  "email" varchar(100) UNIQUE NOT NULL
);

-- Таблицы в схеме clinic_services
CREATE TABLE clinic_services."service" (
  "id" integer PRIMARY KEY,
  "name" varchar(100) UNIQUE NOT NULL,
  "description" text,
  "cost" decimal(10,2) NOT NULL,
  "valid_to" date NOT NULL,
  "is_active" boolean NOT NULL
);

-- Таблицы в схеме clinic_operations
CREATE TABLE clinic_operations."appointment" (
  "id" integer PRIMARY KEY,
  "pet_id" integer NOT NULL,
  "vet_id" integer NOT NULL,
  "date" timestamp NOT NULL,
  "reason" varchar(255) NOT NULL,
  "status_id" integer NOT NULL,
  "notes" text
);

CREATE TABLE clinic_operations."treatment" (
  "id" integer PRIMARY KEY,
  "appointment_id" integer NOT NULL,
  "service_id" integer NOT NULL,
  "date" date NOT NULL,
  "description" text
);

CREATE TABLE clinic_operations."medical_record" (
  "id" integer PRIMARY KEY,
  "appointment_id" integer NOT NULL,
  "service_id" integer NOT NULL,
  "diagnosis" text NOT NULL,
  "prescription" text NOT NULL,
  "notes" text,
  "created_at" timestamp NOT NULL
);

CREATE TABLE clinic_operations."invoice" (
  "id" integer PRIMARY KEY,
  "pet_owner_id" integer NOT NULL,
  "record_id" integer NOT NULL,
  "date" date NOT NULL,
  "amount" decimal(10,2) NOT NULL,
  "status_id" integer NOT NULL
);

-- Внешние ключи с указанием схем
ALTER TABLE clinic_core."pet" ADD FOREIGN KEY ("pet_owner_id") REFERENCES clinic_core."pet_owner" ("id");

ALTER TABLE clinic_staff."veterinarian" ADD FOREIGN KEY ("specialization_id") REFERENCES clinic_staff."specialization" ("id");

ALTER TABLE clinic_operations."appointment" ADD FOREIGN KEY ("pet_id") REFERENCES clinic_core."pet" ("id");
ALTER TABLE clinic_operations."appointment" ADD FOREIGN KEY ("vet_id") REFERENCES clinic_staff."veterinarian" ("id");
ALTER TABLE clinic_operations."appointment" ADD FOREIGN KEY ("status_id") REFERENCES clinic_operations."status" ("id");

ALTER TABLE clinic_operations."treatment" ADD FOREIGN KEY ("appointment_id") REFERENCES clinic_operations."appointment" ("id");
ALTER TABLE clinic_operations."treatment" ADD FOREIGN KEY ("service_id") REFERENCES clinic_services."service" ("id");

ALTER TABLE clinic_operations."medical_record" ADD FOREIGN KEY ("appointment_id") REFERENCES clinic_operations."appointment" ("id");

ALTER TABLE clinic_operations."invoice" ADD FOREIGN KEY ("pet_owner_id") REFERENCES clinic_core."pet_owner" ("id");
ALTER TABLE clinic_operations."invoice" ADD FOREIGN KEY ("record_id") REFERENCES clinic_operations."medical_record" ("id");
ALTER TABLE clinic_operations."invoice" ADD FOREIGN KEY ("status_id") REFERENCES clinic_operations."status" ("id"); ```

#### Создание структуры базы данных `vetclinic` в pgAdmin

<img width="1022" alt="image" src="https://github.com/user-attachments/assets/c838e70b-af0b-4bf2-bce3-d45728962410" />



