### Описание индексов для базы данных Vetclinic

| Таблица          | Поля индекса                     | Тип индекса       | SQL скрипт создания                          | Обоснование                                                                 |
|------------------|----------------------------------|-------------------|----------------------------------------------|-----------------------------------------------------------------------------|
| `pet_owner`      | `last_name`, `first_name`        | B-tree            | ``` CREATE INDEX idx_owner_name ON clinic_core.pet_owner(last_name, first_name); ``` | Ускоряет поиск владельцев по ФИО                                           |
| `pet_owner`      | `phone`                          | Hash              | ``` CREATE INDEX idx_owner_phone ON clinic_core.pet_owner USING hash(phone); ```     | Быстрый поиск по телефону                              |                                                  |
| `appointment`    | `date`                           | BRIN              | ``` CREATE INDEX idx_appointment_date_brin ON clinic_operations.appointment USING brin(date); ```| Оптимально для диапазонов дат                     |
| `medical_record`        | `diagnosis`             | GIN            | ``` CREATE EXTENSION IF NOT EXISTS pg_trgm WITH schema clinic_operations; ``` ``` CREATE INDEX idx_medical_record_diagnosis_gin ON clinic_operations.medical_record USING gin(diagnosis clinic_operations.gin_trgm_ops); ```| Текстовый поиск по диагнозам                                             |
| `pet_owner`        | `address`             | GIST            | ``` CREATE EXTENSION IF NOT EXISTS pg_trgm WITH schema clinic_core ``` ```CREATE INDEX idx_owners_address_gist  ON clinic_core.pet_owner  USING gist (address clinic_core.gist_trgm_ops); ```| Текстовый поиск по адресам с опечатками                                             |

### Результат по индексам с EXPLAIN

<img width="855" alt="image" src="https://github.com/user-attachments/assets/8cebf4b4-bf34-4e54-b330-9fbc8eaf7f95" />

<img width="856" alt="image" src="https://github.com/user-attachments/assets/2a0d477a-6cea-4272-97da-838e45168963" />

<img width="857" alt="image" src="https://github.com/user-attachments/assets/9e775e7d-83ed-46cb-aeab-cf861b569e38" />

<img width="686" alt="image" src="https://github.com/user-attachments/assets/ae358d40-0229-43a0-ba45-30b3823ab36a" />

<img width="860" alt="image" src="https://github.com/user-attachments/assets/80b3c681-09b3-4f4e-868d-32d45f1c9fc1" />






