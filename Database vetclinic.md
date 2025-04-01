# База данных Ветеринарная клиника (Vetclinic)

> ***Дисклеймер*** - является учебным проектом по проектированию БД 

Оглавление:
1. [ER-диаграмма](#1)
2. [Связи между таблицами](#2)
3. [Описание параметров по таблицам](#3)
4. [Примеры бизнес-задач](#4)
5. [Рекомендации к репликации и резервному копированию](#5)
6. [Оптимизация базы данных: индексы для поиска](#6)

<h2 id="1">ER-диаграмма</h2>

> Database Vetclinic - schema public

![Vetclinic-2](https://github.com/user-attachments/assets/1c32da6b-a129-4915-a1a0-e0a52fad9016)

https://dbdiagram.io/d/Vetclinic-67e2eb4175d75cc8446e8015

<h2 id="2">Связи между таблицами</h2>

0. **Vetclinic**:
   - База данных ветеринарной клиники.

1. **pet_owner - pet**:  
   - Один владелец может иметь несколько питомцев. `(1->N)` 
   - Связь: `pet_owner.id` → `pet.pet_owner_id`.

2. **pet - appointment**:  
   - Одно Питомец может иметь несколько записей на прием. `(1->N)`  
   - Связь: `pet.id` → `appointment.pet_id`.

3. **veterinarian - appointment**:  
   - Один ветеринар может иметь несколько записей на прием. `(1->N)`  
   - Связь: `veterinarian.id` → `appointment.vet_id`.

4. **appointment - treatment**:  
   - Одна запись на прием может включать несколько процедур лечения. `(1->N)`  
   - Связь: `appointment.id` → `treatment.appointment_id`.

5. **service - treatment**:  
   - Одна услуга может быть использована в нескольких процедурах лечения. `(1->N)`  
   - Связь: `service.id` → `treatment.service_id`.

6. **appointment - medical_record**:  
   - Одна запись на прием может иметь одну медицинскую карту. `(1->1)`  
   - Связь: `appointment.id` → `medical_record.appointment_id`.

7. **pet_owner - invoice**:  
   - Один владелец может иметь несколько счетов. `(1->N)`  
   - Связь: `pet_owner.id` → `invoice.pet_owner_id`.

8. **medical_record - invoice**:  
   - Одна медицинская карта может быть связана с одним счетом. `(1->1)`  
   - Связь: `medical_record.id` → `invoice.record_id`.

9. **specialization - veterinarian**:  
   - Одна специализация может быть у нескольких ветеринаров. `(1->N)`  
   - Связь: `specialization.id` → `veterinarian.specialization_id`.

10. **status - appointment**:  
    - Один статус может быть назначен нескольким записям на прием. `(1->N)`  
    - Связь: `status.id` → `appointment.status_id`.

11. **status - invoice**:  
    - Один статус может быть назначен нескольким счетам. `(1->N)`  
    - Связь: `status.id` → `invoice.status_id`.

<h2 id="3">Описание параметров по таблицам</h2>

> Primary key - первичный ключ (PK), Foreign key - внешний ключ (FK)

## Таблица **pet_owner** (Владелец питомца)
Содержит информацию о владельцах питомцев.

| Поле              | Тип            | Описание                                      | Ограничения |
|-------------------|----------------|-----------------------------------------------|-------------|
| `id`              | `integer`      | Уникальный идентификатор (PK)                 | PRIMARY KEY |
| `first_name`      | `varchar(150)` | Имя (обязательное)                            | NOT NULL    |
| `last_name`       | `varchar(150)` | Фамилия (обязательное)                        | NOT NULL    |
| `phone`           | `varchar(15)`  | Основной телефон                              | NOT NULL, UNIQUE      |
| `secondary_phone` | `varchar(15)`  | Дополнительный телефон                        | UNIQUE      |
| `email`           | `varchar(100)` | Email                                         | UNIQUE      |
| `address`         | `varchar(255)` | Адрес                                         |             |

## Таблица **pet** (Питомец)
Содержит информацию о питомцев.

| Поле            | Тип            | Описание                                      | Ограничения |
|-----------------|----------------|-----------------------------------------------|-------------|
| `id`            | `integer`      | Уникальный идентификатор (PK)                 | PRIMARY KEY |
| `pet_owner_id`  | `integer`      | ID владельца (FK)                             | NOT NULL, FOREIGN KEY|
| `name`          | `varchar(50)`  | Имя питомца (обязательное)                    | NOT NULL    |
| `species`       | `varchar(50)`  | Вид питомца                                   | NOT NULL    |
| `breed`         | `varchar(50)`  | Порода                                        | NOT NULL    |
| `birth_date`    | `date`         | Дата рождения                                 | NOT NULL    |
| `gender`        | `varchar(10)`  | Пол                                           | NOT NULL    |
| `color`         | `varchar(50)`  | Окрас                                         | NOT NULL    |
| `description`   | `text`         | Описание                                      |             |

## Таблица **specialization** (Специализация)
Специализации ветеринаров.

| Поле          | Тип            | Описание                                      | Ограничения |
|---------------|----------------|-----------------------------------------------|-------------|
| `id`          | `integer`      | Уникальный идентификатор (PK)                 | PRIMARY KEY |
| `name`        | `varchar(50)`  | Название (обязательное)                       | NOT NULL, UNIQUE|
| `description` | `text`         | Описание                                      |             |

## Таблица **veterinarian** (Ветеринар)
Информация о ветеринарах.

| Поле               | Тип            | Описание                                      | Ограничения |
|--------------------|----------------|-----------------------------------------------|-------------|
| `id`               | `integer`      | Уникальный идентификатор (PK)                 | PRIMARY KEY |
| `specialization_id`| `integer`      | ID специализации (FK, обязательное)           | NOT NULL, FOREIGN KEY|
| `first_name`       | `varchar(150)` | Имя (обязательное)                            | NOT NULL    | 
| `last_name`        | `varchar(150)` | Фамилия (обязательное)                        | NOT NULL    |
| `external_phone`   | `varchar(15)`  | Внешний телефон                               | UNIQUE      |
| `internal_phone`   | `varchar(15)`  | Внутренний телефон                            | NOT NULL, UNIQUE      |
| `email`            | `varchar(100)` | Email                                         | NOT NULL, UNIQUE      |

## Таблица **service** (Услуга)
Прайс-лист услуг клиники.

| Поле          | Тип             | Описание                                      | Ограничения |
|---------------|-----------------|-----------------------------------------------|-------------|
| `id`          | `integer`       | Уникальный идентификатор (PK)                 | PRIMARY KEY |
| `name`        | `varchar(100)`  | Название услуги (обязательное)                | NOT NULL, UNIQUE|
| `description` | `text`          | Подробное описание                            |             |
| `cost`        | `decimal(10,2)` | Стоимость (обязательное)                      | NOT NULL    |
| `valid_to`    | `date`          | Дата окончания действия цены (обязательное)   | NOT NULL    |
| `is_active`   | `boolean`       | Флаг активности услуги (обязательное)         | NOT NULL    |

## Таблица **status** (Статус)
Статусы для записей и счетов.

| Поле      | Тип            | Описание                                      | Ограничения |
|-----------|----------------|-----------------------------------------------|-------------|
| `id`      | `integer`      | Уникальный идентификатор (PK)                 | PRIMARY KEY |
| `name`    | `varchar(50)`  | Название статуса (обязательное)               | NOT NULL, UNIQUE|
| `type`    | `varchar(20)`  | Тип: 'appointment' или 'invoice' (обязательное) | NOT NULL  |

## Таблица **appointment** (Запись на прием)
Записи на прием к ветеринару.

| Поле          | Тип            | Описание                                      | Ограничения |
|---------------|----------------|-----------------------------------------------|-------------|
| `id`          | `integer`      | Уникальный идентификатор (PK)                 | PRIMARY KEY |
| `pet_id`      | `integer`      | ID питомца (FK, обязательное)                 | NOT NULL, FOREIGN KEY |
| `vet_id`      | `integer`      | ID ветеринара (FK, обязательное)              | NOT NULL, FOREIGN KEY |
| `date`        | `timestamp`    | Дата и время приема (обязательное)            | NOT NULL |
| `reason`      | `varchar(255)` | Причина визита (обязательное)                 | NOT NULL |
| `status_id`   | `integer`      | ID статуса (FK, обязательное)                 | NOT NULL, FOREIGN KEY |
| `notes`       | `text`         | Дополнительные заметки                        |             |

## Таблица **treatment** (Лечение)
Проведенные процедуры лечения.

| Поле            | Тип            | Описание                                      | Ограничения |
|-----------------|----------------|-----------------------------------------------|-------------|
| `id`            | `integer`      | Уникальный идентификатор (PK)                 | PRIMARY KEY |
| `appointment_id`| `integer`      | ID записи на прием (FK, обязательное)         | NOT NULL, FOREIGN KEY |
| `service_id`    | `integer`      | ID услуги (FK, обязательное)                  | NOT NULL, FOREIGN KEY |
| `date`          | `date`         | Дата проведения процедуры                     | NOT NULL |
| `description`   | `text`         | Описание проведенного лечения                 |             |

## Таблица **medical_record** (Медицинская карта)
Медицинские записи о питомцев.

| Поле            | Тип            | Описание                                      | Ограничения |
|-----------------|----------------|-----------------------------------------------|-------------|
| `id`            | `integer`      | Уникальный идентификатор (PK)                 | PRIMARY KEY |
| `appointment_id`| `integer`      | ID записи на прием (FK, обязательное)         | NOT NULL, FOREIGN KEY |
| `diagnosis`     | `text`         | Поставленный диагноз                          | NOT NULL    |
| `prescription`  | `text`         | Назначенное лечение                           | NOT NULL    |
| `notes`         | `text`         | Дополнительные заметки                        |             |
| `created_at`    | `timestamp`    | Дата создания записи (обязательное)           | NOT NULL    |

## Таблица **invoice** (Счет)
Выставленные счета.

| Поле          | Тип             | Описание                                      | Ограничения |
|---------------|-----------------|-----------------------------------------------|-------------|
| `id`          | `integer`       | Уникальный идентификатор (PK)                 | PRIMARY KEY |
| `pet_owner_id`| `integer`       | ID владельца (FK, обязательное)               | NOT NULL, FOREIGN KEY |
| `record_id`   | `integer`       | ID мед.карты (FK, обязательное)               | NOT NULL, FOREIGN KEY |
| `date`        | `date`          | Дата выставления счета                        | NOT NULL    |
| `amount`      | `decimal(10,2)` | Сумма к оплате (обязательное)                 | NOT NULL    |
| `status_id`   | `integer`       | ID статуса (FK, обязательное)                 | NOT NULL, FOREIGN KEY |


<h2 id="4">Примеры бизнес-задач</h2>

### 1. Управление записями на прием

Таблица Запись на прием (`Appointment`) позволяет отслеживать все записи на прием, включая дату, время, ветеринара и причину посещения.

###  2. Выставление счетов

Таблица Счет (`invoice`) позволяет:
- Создавать счета на основе проведенных процедур и услуг.
- Отследить статус платежа за процедуры и услуги.
- Расчитать доход за определенный период.

### 3. Управление ценами на услуги

Таблица Прайс-лист услуг (`service`) предоставляет централизованный перечень услуг и их стоимость. При помощи неё возможно:

- Обеспечить согласованность цен на все виды лечения.
- Легко обновить стоимость услуг.
- Проанализировать какие услуги являются наиболее выгодными или наиболее дорогими.

### 4. Ведение историй болезней питомцев

Таблица Медицинская карта (`medical_record`) позволяет:

- Хранить и извлекать историю болезни каждого питомца.
- Отслеживать диагнозы, рецепты и заметки с течением времени.
- Предоставляет ветеринарам быстрый доступ к полной истории болезни питомца.

<h2 id="5">Рекомендации к репликации и резервному копированию</h2>

В рамках рассматриваемой базы данных мы используем классический PostgreSQL

### Репликация
- Настроить `Master-Slave` репликацию. `Master` - основная база данных для операций записи (добавление новых записей о питомцев, владельцах, лечениях).`Slave` - реплика для операций чтения (поиск информации о питомцев, генерация отчетов).
- В случае если у нас несколько филиалов нам необходимо предусмотреть реплики в каждом филиале для ускорения доступа к данным.
- Использовать инструмент `pg_stat_replication` для мониторинга репликации

### Резервное копирование

- Физическое резервное копирование: Ежедневное создание полных бэкапов с помощью `pg_basebackup`.
- Логическое резервное копирование: Еженедельный экспорт данных с помощью `pg_dump` для дополнительной защиты.
- Включить архивирование WAL-файлов для возможности восстановления на любой момент времени. Хранить WAL-файлы в облачном хранилище AWS S3.

<h2 id="6">Оптимизация базы данных: индексы для поиска</h2>

> Примечание:
> B-tree - стандартный выбор для большинства случаев
> Hash - только для точных совпадений (=)
> BRIN - для больших таблиц с коррелированными данными
> GIN - для полнотекстового поиска

| Таблица          | Поля индекса                     | Тип индекса       | SQL скрипт создания                          | Обоснование                                                                 |
|------------------|----------------------------------|-------------------|----------------------------------------------|-----------------------------------------------------------------------------|
| `pet_owner`      | `last_name`, `first_name`        | B-tree            | ``` CREATE INDEX idx_owner_name ON pet_owner(last_name, first_name); ``` | Ускоряет поиск владельцев по ФИО                                           |
| `pet_owner`      | `phone`                          | Hash              | ``` CREATE INDEX idx_owner_phone ON pet_owner USING hash(phone); ```     | Быстрый поиск по телефону (UNIQUE уже есть)                                |
| `pet`            | `name`, `pet_owner_id`           | B-tree            | ``` CREATE INDEX idx_pet_name_owner ON pet(name, pet_owner_id); ```      | Поиск питомцев по имени в рамках владельца                                |
| `pet`            | `species`, `breed`               | B-tree            | ``` CREATE INDEX idx_pet_species_breed ON pet(species, breed); ```       | Фильтрация по виду и породе                                               |
| `veterinarian`   | `last_name`, `first_name`        | B-tree            | ``` CREATE INDEX idx_vet_name ON veterinarian(last_name, first_name); ```| Поиск ветеринаров по ФИО                                                  |
| `appointment`    | `pet_id`, `date`                 | B-tree            | ``` CREATE INDEX idx_appointment_pet_date ON appointment(pet_id, date); ```| История посещений животного                                              |
| `appointment`    | `vet_id`, `date`                 | B-tree            | ``` CREATE INDEX idx_appointment_vet_date ON appointment(vet_id, date); ```| Расписание ветеринара                                                     |
| `appointment`    | `date`                           | BRIN              | ``` CREATE INDEX idx_appointment_date_brin ON appointment USING brin(date); ```| Оптимально для диапазонов дат (если много записей)                        |
| `treatment`      | `appointment_id`, `service_id`   | B-tree            | ``` CREATE INDEX idx_treatment_app_service ON treatment(appointment_id, service_id); ```| Поиск услуг в рамках приема                                              |
| `invoice`        | `pet_owner_id`, `date`           | B-tree            | ``` CREATE INDEX idx_invoice_owner_date ON invoice(pet_owner_id, date); ```| История платежей владельца                                               |
| `invoice`        | `status_id`, `date`              | B-tree            | ``` CREATE INDEX idx_invoice_status_date ON invoice(status_id, date); ``` | Поиск счетов по статусу и дате                                           |

| `service`        | `name`, `is_active`              | B-tree            | ``` CREATE INDEX idx_service_active_name ON service(name) WHERE is_active = true; ```| Поиск только активных услуг                                              |

 **Для текстовых поисков**
```
CREATE EXTENSION pg_trgm;
CREATE INDEX idx_medical_record_diagnosis_gin ON medical_record USING gin(diagnosis gin_trgm_ops);
