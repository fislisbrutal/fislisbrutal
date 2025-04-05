
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
DROP SCHEMA public;
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
ALTER TABLE clinic_operations."invoice" ADD FOREIGN KEY ("status_id") REFERENCES clinic_operations."status" ("id");
```
#### Создание структуры базы данных `vetclinic` в pgAdmin

<img width="1022" alt="image" src="https://github.com/user-attachments/assets/c838e70b-af0b-4bf2-bce3-d45728962410" />

#### Роли для базы данных `vetclinic`

1. `vetclinic_admin` - Администратор базы данных

Описание: Полный доступ ко всем схемам и таблицам, может создавать/изменять/удалять любые объекты.
Ответственность: Управление структурой БД, настройка прав доступа, резервное копирование.

2. `vetclinic_manager` - Менеджер клиники

Описание: Доступ к данным клиентов, записям и финансовой информации.
Ответственность: Управление клиентами, просмотр финансовых отчетов, общая аналитика.

3. `vetclinic_vet` - Ветеринар

Описание: Доступ к медицинским данным и записям, но без доступа к финансовой информации.
Ответственность: Ведение медицинских карт, назначение лечения, просмотр истории болезней.

4. `vetclinic_reception` - Ресепшен

Описание: Доступ к записям клиентов и расписанию, ограниченный доступ к медицинским данным.
Ответственность: Запись на прием, управление расписанием, первичный ввод данных клиентов.

5. `vetclinic_accountant` - Бухгалтер

Описание: Доступ только к финансовым данным и информации о клиентах (без медицинских данных).
Ответственность: Выставление счетов, финансовый учет, отчетность.

#### Скрипт создания ролей для базы данных `vetclinic`

```
-- Создание ролей
CREATE ROLE vetclinic_admin;
CREATE ROLE vetclinic_manager;
CREATE ROLE vetclinic_vet;
CREATE ROLE vetclinic_reception;
CREATE ROLE vetclinic_accountant;

-- Назначение прав vetclinic_admin
GRANT ALL PRIVILEGES ON DATABASE vetclinic TO vetclinic_admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA clinic_core, clinic_staff, clinic_services, clinic_operations TO vetclinic_admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA clinic_core, clinic_staff, clinic_services, clinic_operations TO vetclinic_admin;

-- Назначение прав vetclinic_manager
GRANT CONNECT ON DATABASE vetclinic TO vetclinic_manager;
GRANT USAGE ON SCHEMA clinic_core, clinic_operations TO vetclinic_manager;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA clinic_core TO vetclinic_manager;
GRANT SELECT ON ALL TABLES IN SCHEMA clinic_operations TO vetclinic_manager;
GRANT SELECT, INSERT, UPDATE ON clinic_operations.appointment, clinic_operations.invoice TO vetclinic_manager;

-- Назначение прав vetclinic_vet
GRANT CONNECT ON DATABASE vetclinic TO vetclinic_vet;
GRANT USAGE ON SCHEMA clinic_core, clinic_operations TO vetclinic_vet;
GRANT SELECT ON clinic_core.pet_owner, clinic_core.pet TO vetclinic_vet;
GRANT SELECT, INSERT, UPDATE ON clinic_operations.appointment, clinic_operations.treatment, clinic_operations.medical_record TO vetclinic_vet;
GRANT SELECT ON clinic_services.service TO vetclinic_vet;

-- Назначение прав vetclinic_reception
GRANT CONNECT ON DATABASE vetclinic TO vetclinic_reception;
GRANT USAGE ON SCHEMA clinic_core, clinic_operations TO vetclinic_reception;
GRANT SELECT, INSERT, UPDATE ON clinic_core.pet_owner, clinic_core.pet TO vetclinic_reception;
GRANT SELECT, INSERT, UPDATE ON clinic_operations.appointment TO vetclinic_reception;
GRANT SELECT ON clinic_staff.veterinarian TO vetclinic_reception;

-- Назначение прав vetclinic_accountant
GRANT CONNECT ON DATABASE vetclinic TO vetclinic_accountant;
GRANT USAGE ON SCHEMA clinic_core, clinic_operations TO vetclinic_accountant;
GRANT SELECT ON clinic_core.pet_owner TO vetclinic_accountant;
GRANT SELECT, INSERT, UPDATE ON clinic_operations.invoice TO vetclinic_accountant;
```
#### Создание ролей в базе данных `vetclinic` в pgAdmin

<img width="1020" alt="image" src="https://github.com/user-attachments/assets/017a3abf-e306-49f2-a5d5-a0a0016ba19c" />




