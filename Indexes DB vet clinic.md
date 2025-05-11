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
| `medical_record`        | `diagnosis`             | B-tree            | ``` CREATE EXTENSION pg_trgm; ``` CREATE INDEX idx_medical_record_diagnosis_gin ON medical_record USING gin(diagnosis gin_trgm_ops); ```| Текстовый поиск по диагнозам                                             |
