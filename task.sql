CREATE TABLE airport
(
    code    VARCHAR PRIMARY KEY,
    country VARCHAR,
    city    VARCHAR
);


CREATE TABLE aircraft
(
    id    SERIAL PRIMARY KEY,
    model VARCHAR UNIQUE
);

CREATE TABLE seat
(
    aircraft_id INT REFERENCES aircraft (id),
    seat_no     VARCHAR
);

CREATE TABLE flight
(
    id                     SERIAL PRIMARY KEY,
    flight_no              VARCHAR,
    departure_date         TIMESTAMP,
    departure_airport_code VARCHAR REFERENCES airport (code),
    arrival_date           TIMESTAMP,
    arrival_airport_code   VARCHAR REFERENCES airport (code),
    aircraft_id            INT REFERENCES aircraft (id),
    status                 VARCHAR
);

CREATE TABLE ticket
(
    id             SERIAL PRIMARY KEY,
    passenger_no   VARCHAR,
    passenger_name VARCHAR,
    flight_id      INT REFERENCES flight,
    seat_no        VARCHAR,
    cost           INT
);

INSERT INTO airport (code, country, city)
VALUES ('MNK', 'Беларусь', 'Минск'),
       ('LDN', 'Англия', 'Лондон'),
       ('MSK', 'Россия', 'Москва'),
       ('BSL', 'ИСпания', 'Барселона');

INSERT INTO aircraft (model)
VALUES ('Боинг 777-300'),
       ('Боинг 737-300'),
       ('Аэробус А320-200'),
       ('Суперджет-100');

INSERT INTO seat (aircraft_id, seat_no)
SELECT id, s.column1
FROM aircraft
         CROSS JOIN (VALUES ('A1'), ('A2'), ('B1'), ('B2'), ('C1'), ('C2'), ('D1'), ('D2') ORDER BY 1) s;

INSERT INTO flight(flight_no, departure_date, departure_airport_code, arrival_date, arrival_airport_code, aircraft_id,
                   status)
VALUES ('MN3002', '2020-06-14T14:30', 'MNK', '2020-06-14T18:07', 'LDN', 1, 'ARRIVED'),
       ('MN3002', '2020-06-16T09:15', 'LDN', '2020-06-16T13:00', 'MNK', 1, 'ARRIVED'),
       ('BC2801', '2020-07-28T23:55', 'MNK', '2020-07-29T02:43', 'LDN', 2, 'ARRIVED'),
       ('BC2801', '2020-08-01T11:00', 'LDN', '2020-08-01T14:15', 'MNK', 2, 'DEPARTED'),
       ('TR3103', '2020-05-03T13:10', 'MSK', '2020-05-03T18:38', 'BSL', 3, 'ARRIVED'),
       ('TR3103', '2020-05-10T07:10', 'BSL', '2020-05-10T12:44', 'MSK', 3, 'CANCELLED'),
       ('CV9827', '2020-09-09T18:00', 'MNK', '2020-09-09T19:15', 'MSK', 4, 'SCHEDULED'),
       ('CV9827', '2020-09-09T08:00', 'MSK', '2020-09-09T10:05', 'MNK', 4, 'SCHEDULED'),
       ('QS8712', '2020-12-18T03:00', 'MNK', '2020-12-18T06:46', 'LDN', 2, 'ARRIVED');

INSERT INTO ticket (passenger_no, passenger_name, flight_id, seat_no, cost)
VALUES ('112233', 'Иван Иванов', 1, 'A1', 200),
       ('23234A', 'Петр Петров', 1, 'B1', 180),
       ('SS988D', 'Светлана Светикова', 1, 'B2', 175),
       ('QYASDE', 'Андрей Андреев', 1, 'C2', 175),
       ('POQ234', 'Иван Кожемякин', 1, 'D1', 160),
       ('898123', 'Олег Рубцов', 1, 'A2', 198),
       ('555321', 'Екатерина Петренко', 2, 'A1', 250),
       ('QO23OO', 'Иван Розмаринов', 2, 'B2', 225),
       ('9883IO', 'Иван Кожемякин', 2, 'C1', 217),
       ('123UI2', 'Андрей Буйнов', 2, 'C2', 227),
       ('SS988D', 'Светлана Светикова', 2, 'D2', 277),
       ('EE2344', 'Дмитрий Трусцов', 3, 'А1', 300),
       ('AS23PP', 'Максим Комсомольцев', 3, 'А2', 285),
       ('322349', 'Эдуард Щеглов', 3, 'B1', 99),
       ('DL123S', 'Игорь Беркутов', 3, 'B2', 199),
       ('MVM111', 'Алексей Щербин', 3, 'C1', 299),
       ('ZZZ111', 'Денис Колобков', 3, 'C2', 230),
       ('234444', 'Иван Старовойтов', 3, 'D1', 180),
       ('LLLL12', 'Людмила Старовойтова', 3, 'D2', 224),
       ('RT34TR', 'Степан Дор', 4, 'A1', 129),
       ('999666', 'Анастасия Шепелева', 4, 'A2', 152),
       ('234444', 'Иван Старовойтов', 4, 'B1', 140),
       ('LLLL12', 'Людмила Старовойтова', 4, 'B2', 140),
       ('LLLL12', 'Роман Дронов', 4, 'D2', 109),
       ('112233', 'Иван Иванов', 5, 'С2', 170),
       ('NMNBV2', 'Лариса Тельникова', 5, 'С1', 185),
       ('DSA586', 'Лариса Привольная', 5, 'A1', 204),
       ('DSA583', 'Артур Мирный', 5, 'B1', 189),
       ('DSA581', 'Евгений Кудрявцев', 6, 'A1', 204),
       ('EE2344', 'Дмитрий Трусцов', 6, 'A2', 214),
       ('AS23PP', 'Максим Комсомольцев', 6, 'B2', 176),
       ('112233', 'Иван Иванов', 6, 'B1', 135),
       ('309623', 'Татьяна Крот', 6, 'С1', 155),
       ('319623', 'Юрий Дувинков', 6, 'D1', 125),
       ('322349', 'Эдуард Щеглов', 7, 'A1', 69),
       ('DIOPSL', 'Евгений Безфамильная', 7, 'A2', 58),
       ('DIOPS1', 'Константин Швец', 7, 'D1', 65),
       ('DIOPS2', 'Юлия Швец', 7, 'D2', 65),
       ('1IOPS2', 'Ник Говриленко', 7, 'C2', 73),
       ('999666', 'Анастасия Шепелева', 7, 'B1', 66),
       ('23234A', 'Петр Петров', 7, 'C1', 80),
       ('QYASDE', 'Андрей Андреев', 8, 'A1', 100),
       ('1QAZD2', 'Лариса Потемнкина', 8, 'A2', 89),
       ('5QAZD2', 'Карл Хмелев', 8, 'B2', 79),
       ('2QAZD2', 'Жанна Хмелева', 8, 'С2', 77),
       ('BMXND1', 'Светлана Хмурая', 8, 'В2', 94),
       ('BMXND2', 'Кирилл Сарычев', 8, 'D1', 81),
       ('SS988D', 'Светлана Светикова', 9, 'A2', 222),
       ('SS978D', 'Андрей Желудь', 9, 'A1', 198),
       ('SS968D', 'Дмитрий Воснецов', 9, 'B1', 243),
       ('SS958D', 'Максим Гребцов', 9, 'С1', 251),
       ('112233', 'Иван Иванов', 9, 'С2', 135),
       ('NMNBV2', 'Лариса Тельникова', 9, 'B2', 217),
       ('23234A', 'Петр Петров', 9, 'D1', 189),
       ('123951', 'Полина Зверева', 9, 'D2', 234);

SELECT *
FROM ticket
         JOIN flight f
              on ticket.flight_id = f.id
WHERE seat_no = 'B1'
  AND f.departure_airport_code = 'MNK'
  AND f.arrival_airport_code = 'LDN';

SELECT
        t2.count - t1.count free
FROM (SELECT f.aircraft_id , count(flight_no)
      FROM ticket
               JOIN flight f
                    ON ticket.flight_id = f.id
                        AND f.flight_no = 'MN3002'
                        AND f.departure_date::date = '2020-06-14'
      GROUP BY f.aircraft_id) t1
         JOIN (SELECT
                   aircraft_id, count(*)
               FROM seat
               GROUP BY aircraft_id) t2
              ON t1.aircraft_id = t2.aircraft_id;

SELECT
    flight.id,
    flight.arrival_date,
    flight.departure_date,
    flight.arrival_date - flight.departure_date different
FROM flight
ORDER BY different DESC
    LIMIT 2;

SELECT
    first_value(f.arrival_date - f.departure_date) OVER (ORDER BY (f.arrival_date - f.departure_date) desc) max_value,
        first_value(f.arrival_date - f.departure_date) OVER (ORDER BY (f.arrival_date - f.departure_date)) min_value,
        count(*) OVER()
FROM flight f
         JOIN airport a
              ON a.code = f.arrival_airport_code
         JOIN airport d
              ON d.code = f.departure_airport_code
WHERE a.city = 'Лондон'
  AND d.city = 'Минск'
    LIMIT 1;