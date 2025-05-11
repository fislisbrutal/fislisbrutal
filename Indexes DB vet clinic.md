> Примечание:
> B-tree - стандартный выбор для большинства случаев
> Hash - только для точных совпадений (=)
> BRIN - для больших таблиц с коррелированными данными
> GIN - для полнотекстового поиска

| Таблица          | Поля индекса                     | Тип индекса       | SQL скрипт создания                          | Обоснование                                                                 |
|------------------|----------------------------------|-------------------|----------------------------------------------|-----------------------------------------------------------------------------|
| `pet_owner`      | `last_name`, `first_name`        | B-tree            | ``` CREATE INDEX idx_owner_name ON pet_owner(last_name, first_name); ``` | Ускоряет поиск владельцев по ФИО                                           |
| `pet_owner`      | `phone`                          | Hash              | ``` CREATE INDEX idx_owner_phone ON pet_owner USING hash(phone); ```     | Быстрый поиск по телефону (UNIQUE уже есть)                                |                                                  |
| `appointment`    | `date`                           | BRIN              | ``` CREATE INDEX idx_appointment_date_brin ON appointment USING brin(date); ```| Оптимально для диапазонов дат (если много записей)                        |
| `medical_record`        | `diagnosis`             | GIN            | ``` CREATE EXTENSION pg_trgm; ``` ``` CREATE INDEX idx_medical_record_diagnosis_gin ON medical_record USING gin(diagnosis gin_trgm_ops); ```| Текстовый поиск по диагнозам                                             |
