## DML Vetclinic

### Наполнение таблиц
```
INSERT INTO clinic_core.pet_owner (id, first_name, last_name, phone, secondary_phone, email, address)
VALUES 
(1, 'Иван', 'Иванов', '79999999990', '79999999991', 'ivanov@testmail.com', 'г. Москва, Красная площадь 1'),
(2, 'Пётр', 'Петров', '79999999992', '79999999993', 'petrov@testmail.com', 'г. Москва, ул. Арбат, д. 25'),
(3, 'Алексей', 'Сидоров', '79999999994', '79999999995', 'sidorov@testmail.com', 'г. Москва, пр. Ленинградский, д. 30'),
(4, 'Мария', 'Кузнецова', '79999999996', '79999999997', 'kuznetsova@testmail.com', 'г. Москва, ул. Новый Арбат, д. 15'),
(5, 'Дмитрий', 'Смирнов', '79999999998', '79999999999', 'smirnov@testmail.com', 'г. Москва, ул. Пушкинская, д. 5'),
(6, 'Анна', 'Фёдорова', '79998888880', '79998888881', 'fedorova@testmail.com', 'г. Москва, ул. Кутузовский проспект, д. 12'),
(7, 'Сергей', 'Васильев', '79998888882', '79998888883', 'vasiliev@testmail.com', 'г. Москва, ул. Садовая-Кудринская, д. 8'),
(8, 'Ольга', 'Николаева', '79998888884', '79998888885', 'nikolaeva@testmail.com', 'г. Москва, ул. Большая Дмитровка, д. 7'),
(9, 'Андрей', 'Павлов', '79998888886', '79998888887', 'pavlov@testmail.com', 'г. Москва, ул. Маросейка, д. 9'),
(10, 'Елена', 'Козлова', '79998888888', '79998888889', 'kozlova@testmail.com', 'г. Москва, ул. Пречистенка, д. 20'),
(11, 'Михаил', 'Лебедев', '79997777770', '79997777771', 'lebedev@testmail.com', 'г. Москва, ул. Остоженка, д. 18'),
(12, 'Наталья', 'Соколова', '79997777772', '79997777773', 'sokolova@testmail.com', 'г. Москва, ул. Пятницкая, д. 14'),
(13, 'Игорь', 'Морозов', '79997777774', '79997777775', 'morozov@testmail.com', 'г. Москва, ул. Большая Полянка, д. 22'),
(14, 'Виктория', 'Орлова', '79997777776', '79997777777', 'orlova@testmail.com', 'г. Москва, ул. Баррикадная, д. 6'),
(15, 'Александр', 'Григорьев', '79997777778', '79997777779', 'grigoriev@testmail.com', 'г. Москва, ул. Спиридоновка, д. 11');

```
```
INSERT INTO clinic_core.pet (id, pet_owner_id, name, species, breed, birth_date, gender, color, description)
VALUES 
(1, 2, 'Робби', 'Кролик', 'Бельгийский фландр', '2018.01.03', 'Кобель', 'Белый', 'Редкая порода кроликов'),
(2, 3, 'Рекс', 'Собака', 'Немецкая овчарка', '2019.05.12', 'Кобель', 'Черно-подпалый', 'Служебная порода'),
(3, 1, 'Кеша', 'Попугай', 'Ара', '2018.11.20', 'Кобель', 'Красный', 'Говорит несколько слов'),
(4, 10, 'Белка', 'Белка', 'Обыкновенная', '2021.04.03', 'Самка', 'Рыжая', 'Живет в вольере'),
(5, 5, 'Гоша', 'Хомяк', 'Джунгарский', '2022.01.10', 'Кобель', 'Серый', 'Ночной образ жизни'),
(6, 12, 'Рыжик', 'Собака', 'Метис', '2020.07.25', 'Кобель', 'Рыжий', 'Живет в будке'),
(7, 8, 'Зевс', 'Собака', 'Алабай', '2017.09.14', 'Кобель', 'Белый', 'Очень крупный'),
(8, 4, 'Васька', 'Кошка', 'Британский', '2019.03.30', 'Кобель', 'Голубой', 'Ленивый и важный'),
(9, 15, 'Чижик', 'Канарейка', 'Желтая', '2021.08.05', 'Кобель', 'Желтый', 'Красиво поет'),
(10, 2, 'Пушок', 'Кролик', 'Карликовый', '2020.12.01', 'Кобель', 'Белый', 'Очень пушистый'),
(11, 6, 'Жужа', 'Морская свинка', 'Абиссинская', '2022.02.18', 'Самка', 'Трехцветная', 'Любит овощи'),
(12, 9, 'Гектор', 'Собака', 'Доберман', '2018.06.22', 'Кобель', 'Черный', 'Охранная собака'),
(13, 11, 'Маркиз', 'Кошка', 'Сиамский', '2021.05.14', 'Кобель', 'Кремовый', 'Голубые глаза'),
(14, 13, 'Гоша', 'Черепаха', 'Красноухая', '2015.10.10', 'Кобель', 'Зеленый', 'Медлительный'),
(15, 14, 'Кузя', 'Крыса', 'Декоративная', '2022.03.08', 'Кобель', 'Белый', 'Умная и общительная'),
(16, 3, 'Лора', 'Собака', 'Лабрадор', '2019.07.19', 'Самка', 'Шоколадный', 'Очень добрая'),
(17, 7, 'Соня', 'Ежик', 'Африканский', '2021.09.25', 'Самка', 'Серый', 'Любит фрукты'),
(18, 1, 'Арчи', 'Попугай', 'Волнистый', '2020.04.12', 'Кобель', 'Зеленый', 'Щебечет весь день'),
(19, 10, 'Барсик', 'Кот', 'Мейн-кун', '2018.12.05', 'Кобель', 'Рыжий', 'Огромный и ласковый'),
(20, 5, 'Феня', 'Лисица', 'Песец', '2021.11.30', 'Самка', 'Белая', 'Живет в заповеднике'),
(21, 12, 'Зорро', 'Хорек', 'Домашний', '2020.08.15', 'Кобель', 'Черный', 'Очень активный'),
(22, 6, 'Тиша', 'Черепаха', 'Среднеазиатская', '2017.05.20', 'Самка', 'Песочный', 'Любит капусту'),
(23, 9, 'Лекс', 'Собака', 'Хаски', '2019.01.25', 'Кобель', 'Серо-белый', 'Голубые глаза'),
(24, 2, 'Муся', 'Кошка', 'Сфинкс', '2022.06.10', 'Самка', 'Розовый', 'Без шерсти'),
(25, 15, 'Пират', 'Попугай', 'Какаду', '2016.04.18', 'Кобель', 'Белый', 'Громко кричит');
```

```
INSERT INTO clinic_staff.specialization (id, name)
VALUES 
(1, 'Терапевт'),
(2, 'Хирург'),
(3, 'Врач лабораторной диагностики'),
(4, 'Орнитолог'),
(5, 'Кардиолог'),
(6, 'Специалист УЗИ диагностики'),
(7, 'Герпетолог'),
(8, 'Онколог'),
(9, 'Офтальмолог'),
(10, 'Стоматолог'),
(11, 'Ратолог'),
(12, 'Дерматолог'),
(13, 'Цитолог'),
(14, 'Травматолог');
```

```
INSERT INTO clinic_staff.veterinarian (id, specialization_id, first_name, last_name, external_phone, internal_phone, email) VALUES
(1, 1, 'Александр', 'Кузнецов', '79101234567', '74951234567', 'kuznetsov@vetclinic.ru'),
(2, 1, 'Екатерина', 'Смирнова', '79111234567', '74952234567', 'smirnova@vetclinic.ru'),
(3, 1, 'Марк', 'Шнайдер', '79121234567', '74953234567', 'shnayder@vetclinic.ru'),
(4, 2, 'Дмитрий', 'Лебедев', '79131234567', '74954234567', 'lebedev@vetclinic.ru'),
(5, 2, 'София', 'Мюллер', '79141234567', '74955234567', 'myuller@vetclinic.ru'),
(6, 3, 'Анастасия', 'Васнецова', '79151234567', '74956234567', 'vasnetsova@vetclinic.ru'),
(7, 4, 'Артур', 'Соколов', '79161234567', '74957234567', 'sokolov@vetclinic.ru'),
(8, 4, 'Жанна', 'Дюбуа', '79171234567', '74958234567', 'dyubua@vetclinic.ru'),
(9, 5, 'Григорий', 'Петросян', '79181234567', '74959234567', 'petrosyan@vetclinic.ru'),
(10, 6, 'Виктория', 'Зайцева', '79191234567', '74950234567', 'zaytseva@vetclinic.ru'),
(11, 7, 'Роман', 'Щукин', '79201234567', '74951234568', 'shchukin@vetclinic.ru'),
(12, 8, 'Эмиль', 'Гаспарян', '79211234567', '74952234568', 'gasparian@vetclinic.ru'),
(13, 9, 'Алиса', 'Вандер', '79221234567', '74953234568', 'vander@vetclinic.ru'),
(14, 10, 'Станислав', 'Белый', '79231234567', '74954234568', 'belyi@vetclinic.ru'),
(15, 11, 'Юлия', 'Новикова', '79241234567', '74955234568', 'novikova@vetclinic.ru'),
(16, 12, 'Тимофей', 'Рихтер', '79251234567', '74956234568', 'rikhter@vetclinic.ru'),
(17, 13, 'Оксана', 'Меладзе', '79261234567', '74957234568', 'meladze@vetclinic.ru'),
(18, 14, 'Давид', 'Гомес', '79271234567', '74958234568', 'gomes@vetclinic.ru');
```

```
INSERT INTO clinic_services.service (id, name, description, cost, valid_to, is_active) VALUES
(1, 'Хирургия', 'Плановые и экстренные хирургические операции любой сложности', 8500.00, '2999-12-31', true),
(2, 'Неврология и нейрохирургия', 'Диагностика и лечение заболеваний нервной системы', 6500.00, '2999-12-31', true),
(3, 'Онкология', 'Комплексная диагностика и лечение онкологических заболеваний', 7200.00, '2999-12-31', true),
(4, 'Травматология и ортопедия', 'Лечение травм и заболеваний опорно-двигательного аппарата', 5800.00, '2999-12-31', true),
(5, 'Стерилизация', 'Хирургическая стерилизация животных с последующим наблюдением', 4500.00, '2999-12-31', true),
(6, 'Терапия', 'Комплексное обследование и лечение внутренних болезней', 3500.00, '2999-12-31', true),
(7, 'Кардиология', 'Диагностика и лечение заболеваний сердечно-сосудистой системы', 5500.00, '2999-12-31', true),
(8, 'Прием специалистов', 'Консультация узкопрофильного специалиста по направлению', 2500.00, '2999-12-31', true),
(9, 'Интенсивная терапия и Реанимация', 'Круглосуточное наблюдение и лечение в критических состояниях', 12000.00, '2999-12-31', true),
(10, 'Офтальмология', 'Диагностика и лечение заболеваний глаз', 4200.00, '2999-12-31', true),
(11, 'Стоматология', 'Лечение заболеваний зубов и полости рта, чистка, удаление', 3800.00, '2999-12-31', true),
(12, 'Дерматология', 'Диагностика и лечение кожных заболеваний', 3200.00, '2999-12-31', true),
(13, 'Паразитология', 'Диагностика и лечение паразитарных заболеваний', 2800.00, '2999-12-31', true),
(14, 'Физиотерапия и реабилитация', 'Восстановительные процедуры после травм и операций', 1800.00, '2999-12-31', true),
(15, 'Процедурные услуги', 'Инъекции, капельницы, перевязки и другие медицинские процедуры', 1500.00, '2999-12-31', true),
(16, 'УЗИ', 'Ультразвуковая диагностика органов и систем', 2900.00, '2999-12-31', true),
(17, 'Рентгенография', 'Рентгенологическое исследование с описанием', 3200.00, '2999-12-31', true),
(18, 'Лабораторные исследования', 'Комплексные анализы крови, мочи, биохимия и др.', 2100.00, '2999-12-31', true),
(19, 'Вакцинация', 'Плановые и экстренные прививки', 1200.00, '2999-12-31', true),
(20, 'Диспансеризация', 'Комплексное профилактическое обследование животного', 5000.00, '2999-12-31', true),
(21, 'Чипирование животных', 'Имплантация микрочипа для идентификации', 2500.00, '2999-12-31', true),
(22, 'Бесплатная консультация по телефону', 'Первичная консультация по телефону', 0.00, '2999-12-31', true),
(23, 'Лечение птиц', 'Специализированная помощь орнитолога', 4000.00, '2999-12-31', true),
(24, 'Лечение рептилий', 'Специализированная помощь герпетолога', 4500.00, '2999-12-31', true),
(25, 'Лечение грызунов', 'Специализированная помощь ратолога', 3800.00, '2999-12-31', true),
(26, 'Криохирургия и криодеструкция', 'Удаление новообразований с помощью жидкого азота', 5200.00, '2999-12-31', true);
```
```
INSERT INTO clinic_operations.status (id, name, type) VALUES
(1, 'Запланирован', 'appointment'),
(2, 'Завершен', 'appointment'),
(3, 'Недействителен', 'appointment'),
(4, 'Перенесен', 'appointment'),
(5, 'Ожидает оплаты', 'invoice'),
(6, 'Оплачен', 'invoice'),
(7, 'Отменен', 'invoice');
```
```
INSERT INTO clinic_operations.appointment (id, pet_id, vet_id, date, reason, status_id, notes) VALUES
(1, 1, 4, '2023-01-10 10:00:00', 'Плановый осмотр перед вакцинацией', 2, 'Животное активно, аппетит хороший'),
(2, 2, 1, '2023-01-11 11:30:00', 'Кашель и вялость', 2, 'Подозрение на бронхит, назначены анализы'),
(3, 3, 7, '2023-01-12 09:15:00', 'Выпадение перьев', 2, 'Рекомендованы витамины и изменение рациона'),
(4, 4, 11, '2023-01-13 14:00:00', 'Плановый осмотр рептилии', 2, 'Состояние удовлетворительное'),
(5, 5, 15, '2023-01-14 16:45:00', 'Кожный зуд', 2, 'Назначены антигистаминные препараты'),
(6, 6, 18, '2023-01-15 13:20:00', 'Травма лапы', 2, 'Наложена повязка, рекомендован покой'),
(7, 7, 4, '2023-01-16 10:30:00', 'Стерилизация', 2, 'Операция прошла успешно'),
(8, 8, 14, '2023-01-17 12:00:00', 'Зубной камень', 2, 'Проведена чистка зубов'),
(9, 9, 7, '2023-01-18 15:15:00', 'Потеря голоса', 2, 'Воспаление гортани, назначено лечение'),
(10, 10, 15, '2023-01-19 11:00:00', 'Плановый осмотр', 2, 'Животное здорово'),
(11, 11, 15, '2023-01-20 14:30:00', 'Отказ от пищи', 1, 'Запланирован на завтра'),
(12, 12, 4, '2023-01-21 09:00:00', 'Плановый осмотр перед вакцинацией', 1, NULL),
(13, 13, 2, '2023-01-22 10:45:00', 'Рвота', 1, 'Подозрение на отравление'),
(14, 14, 11, '2023-01-23 16:00:00', 'Повреждение панциря', 1, NULL),
(15, 15, 15, '2023-01-24 13:10:00', 'Кожные новообразования', 1, 'Требуется биопсия'),
(16, 16, 1, '2023-01-25 11:20:00', 'Диарея', 3, 'Прием отменен, симптомы прошли'),
(17, 17, 11, '2023-01-26 14:50:00', 'Плановый осмотр', 4, 'Перенесен на следующую неделю'),
(18, 18, 7, '2023-01-27 10:15:00', 'Изменение поведения', 1, NULL),
(19, 19, 14, '2023-01-28 12:30:00', 'Зубная боль', 1, NULL),
(20, 20, 11, '2023-01-29 15:40:00', 'Плановый осмотр', 1, NULL),
(21, 21, 15, '2023-01-30 09:50:00', 'Кожный зуд', 1, NULL),
(22, 22, 11, '2023-01-31 11:25:00', 'Плановый осмотр', 1, NULL),
(23, 23, 4, '2023-02-01 14:15:00', 'Хромота', 1, NULL),
(24, 24, 2, '2023-02-02 10:05:00', 'Кашель', 1, NULL),
(25, 25, 7, '2023-02-03 16:30:00', 'Потеря аппетита', 1, NULL),
(26, 1, 9, '2023-02-04 13:45:00', 'Кардиологическое обследование', 1, NULL),
(27, 2, 10, '2023-02-05 09:20:00', 'УЗИ брюшной полости', 1, NULL),
(28, 3, 7, '2023-02-06 12:10:00', 'Плановый осмотр', 1, NULL),
(29, 4, 11, '2023-02-07 15:00:00', 'Коррекция рациона', 1, NULL),
(30, 5, 16, '2023-02-08 11:35:00', 'Дерматологический осмотр', 1, NULL);
```
```
INSERT INTO clinic_operations.treatment (id, appointment_id, service_id, date, description) VALUES
(1, 1, 19, '2023-01-10', 'Вакцинация от бешенства'),
(2, 1, 6, '2023-01-10', 'Общий осмотр терапевта'),
(3, 2, 6, '2023-01-11', 'Первичный осмотр терапевта'),
(4, 2, 18, '2023-01-11', 'Общий анализ крови'),
(5, 3, 23, '2023-01-12', 'Консультация орнитолога'),
(6, 3, 18, '2023-01-12', 'Анализ на паразитов'),
(7, 4, 24, '2023-01-13', 'Плановый осмотр рептилии'),
(8, 5, 12, '2023-01-14', 'Осмотр дерматолога'),
(9, 5, 18, '2023-01-14', 'Соскоб кожи'),
(10, 6, 4, '2023-01-15', 'Осмотр травматолога'),
(11, 6, 17, '2023-01-15', 'Рентген лапы'),
(12, 7, 5, '2023-01-16', 'Стерилизация кошки'),
(13, 7, 1, '2023-01-16', 'Хирургическая операция'),
(14, 8, 11, '2023-01-17', 'Чистка зубов'),
(15, 9, 23, '2023-01-18', 'Осмотр орнитолога'),
(16, 10, 6, '2023-01-19', 'Плановый осмотр терапевта'),
(17, 11, 25, '2023-01-20', 'Консультация ратолога'),
(18, 12, 19, '2023-01-21', 'Вакцинация комплексная'),
(19, 13, 6, '2023-01-22', 'Осмотр терапевта'),
(20, 13, 15, '2023-01-22', 'Капельница'),
(21, 14, 24, '2023-01-23', 'Обработка панциря'),
(22, 15, 12, '2023-01-24', 'Осмотр дерматолога'),
(23, 15, 26, '2023-01-24', 'Криодеструкция новообразований'),
(24, 16, 6, '2023-01-25', 'Консультация терапевта'),
(25, 17, 24, '2023-01-26', 'Плановый осмотр рептилии'),
(26, 18, 23, '2023-01-27', 'Консультация орнитолога'),
(27, 19, 11, '2023-01-28', 'Удаление зуба'),
(28, 20, 24, '2023-01-29', 'Плановый осмотр рептилии'),
(29, 21, 12, '2023-01-30', 'Осмотр дерматолога'),
(30, 22, 24, '2023-01-31', 'Плановый осмотр черепахи'),
(31, 23, 4, '2023-02-01', 'Осмотр травматолога'),
(32, 24, 6, '2023-02-02', 'Осмотр терапевта'),
(33, 25, 23, '2023-02-03', 'Консультация орнитолога'),
(34, 26, 7, '2023-02-04', 'Кардиологическое обследование'),
(35, 26, 16, '2023-02-04', 'УЗИ сердца'),
(36, 27, 16, '2023-02-05', 'УЗИ брюшной полости'),
(37, 28, 23, '2023-02-06', 'Плановый осмотр птицы'),
(38, 29, 24, '2023-02-07', 'Коррекция рациона рептилии'),
(39, 30, 12, '2023-02-08', 'Осмотр дерматолога'),
(40, 30, 18, '2023-02-08', 'Анализ кожи');
```
```
INSERT INTO clinic_operations.medical_record (id, appointment_id, service_id, diagnosis, prescription, notes, created_at) VALUES
(1, 1, 19, 'Здоров', 'Повторная вакцинация через год', 'Реакция на вакцину в норме', '2023-01-10 10:30:00'),
(2, 2, 6, 'Бронхит', 'Антибиотики 2 раза в день, витамины', 'Контрольный осмотр через неделю', '2023-01-11 12:00:00'),
(3, 3, 23, 'Авитаминоз', 'Витаминный комплекс, изменение рациона', 'Рекомендовано добавить свежие фрукты', '2023-01-12 10:00:00'),
(4, 4, 24, 'Здоров', 'Коррекция рациона', 'Рекомендовано увеличить количество кальция', '2023-01-13 14:30:00'),
(5, 5, 12, 'Аллергический дерматит', 'Антигистаминные препараты, специальный шампунь', 'Исключить возможные аллергены', '2023-01-14 17:15:00'),
(6, 6, 4, 'Растяжение связок', 'Покой, ограничение движения на 2 недели', 'Повторный осмотр при ухудшении', '2023-01-15 14:00:00'),
(7, 7, 1, 'Послеоперационный период', 'Обработка швов, антибиотики', 'Снять швы через 10 дней', '2023-01-16 12:30:00'),
(8, 8, 11, 'Зубной камень', 'Чистка зубов проведена', 'Рекомендована ежегодная чистка', '2023-01-17 12:45:00'),
(9, 9, 23, 'Ларингит', 'Противовоспалительные препараты', 'Обеспечить покой голосовым связкам', '2023-01-18 16:00:00'),
(10, 10, 6, 'Здоров', 'Рекомендован плановый осмотр через год', NULL, '2023-01-19 11:30:00'),
(11, 11, 25, 'Нарушение пищеварения', 'Коррекция рациона, пробиотики', 'Контроль состояния в течение 3 дней', '2023-01-20 15:15:00'),
(12, 12, 19, 'Здоров', 'Повторная вакцинация через год', NULL, '2023-01-21 09:30:00'),
(13, 13, 6, 'Отравление', 'Капельница, сорбенты, диета', 'Обеспечить обильное питье', '2023-01-22 11:30:00'),
(14, 14, 24, 'Травма панциря', 'Обработка антисептиком, изоляция', 'Контроль заживления', '2023-01-23 16:30:00'),
(15, 15, 12, 'Доброкачественные новообразования', 'Криодеструкция проведена', 'Контрольный осмотр через месяц', '2023-01-24 14:00:00'),
(16, 16, 6, 'Здоров', 'Симптомы прошли, лечение не требуется', NULL, '2023-01-25 11:50:00'),
(17, 17, 24, 'Здоров', 'Плановый осмотр', NULL, '2023-01-26 15:20:00'),
(18, 18, 23, 'Стресс', 'Рекомендовано уменьшить раздражители', 'Наблюдать за поведением', '2023-01-27 11:00:00'),
(19, 19, 11, 'Пульпит', 'Удаление зуба проведено', 'Антибиотики 5 дней', '2023-01-28 13:15:00'),
(20, 20, 24, 'Здоров', 'Плановый осмотр', NULL, '2023-01-29 16:10:00'),
(21, 21, 12, 'Контактный дерматит', 'Антигистаминные, местная обработка', 'Исключить контакт с аллергеном', '2023-01-30 10:30:00'),
(22, 22, 24, 'Здоров', 'Плановый осмотр', NULL, '2023-01-31 12:00:00'),
(23, 23, 4, 'Ушиб мягких тканей', 'Покой, холодные компрессы', 'Ограничить активность на 5 дней', '2023-02-01 15:00:00'),
(24, 24, 6, 'Респираторная инфекция', 'Антибиотики, противовоспалительные', 'Контроль температуры', '2023-02-02 11:00:00'),
(25, 25, 23, 'Нарушение пищеварения', 'Коррекция рациона, пробиотики', 'Наблюдать за аппетитом', '2023-02-03 17:00:00'),
(26, 26, 7, 'Начальная стадия сердечной недостаточности', 'Специальная диета, кардиопрепараты', 'Контрольный осмотр через месяц', '2023-02-04 14:30:00'),
(27, 27, 16, 'Незначительное увеличение печени', 'Диета, гепатопротекторы', 'Повторное УЗИ через 3 месяца', '2023-02-05 10:15:00'),
(28, 28, 23, 'Здоров', 'Плановый осмотр', NULL, '2023-02-06 12:45:00'),
(29, 29, 24, 'Здоров', 'Коррекция рациона проведена', NULL, '2023-02-07 15:30:00'),
(30, 30, 12, 'Грибковая инфекция', 'Противогрибковые препараты', 'Обработка кожи 2 раза в день', '2023-02-08 12:20:00');
```
```
INSERT INTO clinic_operations.invoice (id, pet_owner_id, record_id, date, amount, status_id) VALUES
(1, 2, 1, '2023-01-10', 1200.00, 6),
(2, 3, 2, '2023-01-11', 4700.00, 6),
(3, 1, 3, '2023-01-12', 6800.00, 6),
(4, 10, 4, '2023-01-13', 4500.00, 6),
(5, 5, 5, '2023-01-14', 5000.00, 6),
(6, 12, 6, '2023-01-15', 9000.00, 6),
(7, 8, 7, '2023-01-16', 13000.00, 6),
(8, 4, 8, '2023-01-17', 3800.00, 6),
(9, 15, 9, '2023-01-18', 4000.00, 6),
(10, 2, 10, '2023-01-19', 3500.00, 6),
(11, 6, 11, '2023-01-20', 3800.00, 5),
(12, 9, 12, '2023-01-21', 1200.00, 6),
(13, 11, 13, '2023-01-22', 4000.00, 6),
(14, 13, 14, '2023-01-23', 4500.00, 6),
(15, 14, 15, '2023-01-24', 8400.00, 6),
(16, 3, 16, '2023-01-25', 3500.00, 7),
(17, 7, 17, '2023-01-26', 4500.00, 6),
(18, 1, 18, '2023-01-27', 4000.00, 6),
(19, 10, 19, '2023-01-28', 3800.00, 6),
(20, 5, 20, '2023-01-29', 4500.00, 6),
(21, 12, 21, '2023-01-30', 3200.00, 6),
(22, 6, 22, '2023-01-31', 4500.00, 6),
(23, 9, 23, '2023-02-01', 5800.00, 6),
(24, 2, 24, '2023-02-02', 3500.00, 6),
(25, 15, 25, '2023-02-03', 4000.00, 5),
(26, 1, 26, '2023-02-04', 10700.00, 6),
(27, 3, 27, '2023-02-05', 2900.00, 6),
(28, 1, 28, '2023-02-06', 4000.00, 6),
(29, 10, 29, '2023-02-07', 4500.00, 6),
(30, 12, 30, '2023-02-08', 5300.00, 6);
```
### Выборка данных

#### 1. Выборка с использованием регулярного выражения

Пояснения: поиск диагнозов содержащих определенные термины
```
SELECT medical_record.id, appointment.date, pet.name AS pet_name, medical_record.diagnosis
FROM clinic_operations.medical_record
JOIN clinic_operations.appointment ON medical_record.appointment_id = appointment.id
JOIN clinic_core.pet ON appointment.pet_id = pet.id
WHERE medical_record.diagnosis ~* '\y(дерматит|инфекция)\y';
```
<img width="584" alt="image" src="https://github.com/user-attachments/assets/3b7a5afc-367a-4960-afbe-86dcd7f6e09a" />

#### 2. Выборка с использованием LEFT JOIN

```
SELECT pet.name as petName, pet_owner.first_name as ownerName, pet_owner.last_name as ownerSurname from clinic_core.pet LEFT JOIN clinic_core.pet_owner on pet.pet_owner_id = pet_owner.id
```
<img width="587" alt="image" src="https://github.com/user-attachments/assets/24cc701a-e573-45f0-b562-e9b0879078ec" />

#### 3. Выборка с использованием INNER JOIN

```
SELECT veterinarian.first_name as doctorName, veterinarian.last_name as doctorSurname, specialization.name as specialization from clinic_staff.veterinarian INNER JOIN clinic_staff.specialization on veterinarian.specialization_id = specialization.id  
```
<img width="581" alt="image" src="https://github.com/user-attachments/assets/6ec993ae-e4da-40ee-95af-dc2f9277bfc9" />

Итого:
- LEFT позволяет выбирать данные только из левой таблицы и соответствующие записи из правой таблицы. Результат - 0 записей с правой стороны, если нет совпадения.
- INNER выбирает данные, которые совпадают в обоих таблицах (и в левой, и в правой)

#### 4. Выборка с выводом информации о добавленных строках

```
INSERT INTO clinic_staff.specialization (id, name)
VALUES 
(15, 'Анестезиолог')
RETURNING *;
```
<img width="585" alt="image" src="https://github.com/user-attachments/assets/e1cc7f16-44a0-4968-9d08-d848d1a503c3" />

#### 5. Обновление данных, используя UPDATE FROM

Пояснение - обновление цен на услуги на 15%

```
UPDATE clinic_services.service
SET cost = cost * 1.15,
    valid_to = '2999-12-31'
FROM clinic_operations.treatment
WHERE clinic_services.service.id = clinic_operations.treatment.service_id
AND clinic_services.service.is_active = true;
```

<img width="589" alt="image" src="https://github.com/user-attachments/assets/c6b44119-eafa-4ac6-a109-99212ba1348c" />

#### 6. Удаление данных, используя join с другой таблицей с помощью using

Пояснение - удаление счетов, связанных с медицинскими записями черепах

```
DELETE FROM clinic_operations.invoice
USING clinic_operations.medical_record, clinic_operations.appointment, clinic_core.pet
WHERE invoice.record_id = medical_record.id
AND medical_record.appointment_id = appointment.id
AND appointment.pet_id = pet.id
AND pet.species = 'Черепаха';
```
<img width="587" alt="image" src="https://github.com/user-attachments/assets/e6c9269f-db96-46a5-b08c-1f6b49b855f5" />

#### 7. Использование утилиты COPY

Пояснение - экспорт данных о питомцах в CSV файл

```

COPY (SELECT pet.id, pet.name, pet.species, pet.breed, pet_owner.first_name || ' ' || pet_owner.last_name AS ownerName
      FROM clinic_core.pet
      JOIN clinic_core.pet_owner ON pet.pet_owner_id = pet_owner.id)
TO '/tmp/pets_export.csv'
WITH CSV HEADER;
```
<img width="588" alt="image" src="https://github.com/user-attachments/assets/3877cedd-de4d-4b4e-bc75-2bd8bb3315e2" />





