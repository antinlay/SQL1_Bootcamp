DROP table JanuaryCalendar CASCADE; /*удаление старой версии таблицы и связанных с ней снимков с помощью CASCADE*/
CREATE table JanuaryCalendar
( generated_date date );
insert into JanuaryCalendar values ('2022-01-01');
insert into JanuaryCalendar values ('2022-01-02');
insert into JanuaryCalendar values ('2022-01-03');
insert into JanuaryCalendar values ('2022-01-04');
insert into JanuaryCalendar values ('2022-01-05');
insert into JanuaryCalendar values ('2022-01-06');
insert into JanuaryCalendar values ('2022-01-07');
insert into JanuaryCalendar values ('2022-01-08');
insert into JanuaryCalendar values ('2022-01-09');
insert into JanuaryCalendar values ('2022-01-10');
insert into JanuaryCalendar values ('2022-01-11');
insert into JanuaryCalendar values ('2022-01-12');
insert into JanuaryCalendar values ('2022-01-13');
insert into JanuaryCalendar values ('2022-01-14');
insert into JanuaryCalendar values ('2022-01-15');
insert into JanuaryCalendar values ('2022-01-16');
insert into JanuaryCalendar values ('2022-01-17');
insert into JanuaryCalendar values ('2022-01-18');
insert into JanuaryCalendar values ('2022-01-19');
insert into JanuaryCalendar values ('2022-01-20');
insert into JanuaryCalendar values ('2022-01-21');
insert into JanuaryCalendar values ('2022-01-22');
insert into JanuaryCalendar values ('2022-01-23');
insert into JanuaryCalendar values ('2022-01-24');
insert into JanuaryCalendar values ('2022-01-25');
insert into JanuaryCalendar values ('2022-01-26');
insert into JanuaryCalendar values ('2022-01-27');
insert into JanuaryCalendar values ('2022-01-28');
insert into JanuaryCalendar values ('2022-01-29');
insert into JanuaryCalendar values ('2022-01-30');
insert into JanuaryCalendar values ('2022-01-31');

CREATE VIEW v_generated_dates as SELECT * FROM JanuaryCalendar;

SELECT * FROM v_generated_dates /*просмотр не является обязательным*/