﻿#language: ru

@tree

Функционал: Создание и заполнение элемента справочника номенклатуры

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения

Сценарий: Создание номенклатуры
* создаем элемент справочника "Номенклатура"
	И В командном интерфейсе я выбираю "Справочники" "Номенклатура"
	Тогда открылось окно "Номенклатура"
	Когда открылось окно "Номенклатура"
	И в таблице 'Список' я перехожу к строке:
		| "Код"        | "Наименование" |
		| "0000000020" | "Прочие"       |
	И в таблице 'Список' я выбираю текущую строку
	И в таблице 'ТаблицаОстатки' я разворачиваю текущую строку
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Номенклатура (создание)"
	И в поле с именем 'Наименование' я ввожу текст "Картофель весовой"
	И я перехожу к следующему реквизиту
	И я запоминаю в переменную "НоменклатураУжеПрисутствует" значение 0
	Когда в сообщениях пользователю есть строка "Номенклатура, с введенным наименованием, уже присутствует в справочнике!" Тогда
		И я запоминаю в переменную "НоменклатураУжеПрисутствует" значение 1
	Если переменная "НоменклатураУжеПрисутствует" имеет значение 0 Тогда
		И из выпадающего списка с именем 'ТипТовара' я выбираю точное значение "Весовой"
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Тогда открылось окно "Картофель весовой (Номенклатура)"
		И Я закрываю окно "Картофель весовой (Номенклатура)"
	Если переменная "НоменклатураУжеПрисутствует" имеет значение 1 Тогда
		И Я закрываю окно "Номенклатура (создание) *"
		И я активизирую поле 'Нет'
		Когда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button1'
		Тогда открылось окно "Номенклатура"
				
Сценарий: Заполнение дополнительных свойств
* заполняем дополнительные свойства
	И В командном интерфейсе я выбираю "Справочники" "Номенклатура"
	Тогда открылось окно "Номенклатура"
	Когда открылось окно "Номенклатура"
	И в таблице 'Список' я перехожу к строке:
		| "Код"        | "Наименование" |
		| "0000000020" | "Прочие"       |
	И в таблице 'Список' я выбираю текущую строку
	И в таблице 'Список' я перехожу к строке:
		| "ЕИ" | "Код"        | "Наименование"      |
		| "кг" | "1-00000337" | "Картофель весовой" |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Картофель весовой (Номенклатура)"
	И в таблице 'ТаблицаСвойств' я разворачиваю строку:
		| "Конец таблицы" | "О"   | "Свойство"         |
		| "Нет"           | "Нет" | "Интернет магазин" |
	И я перехожу к закладке с именем 'ГруппаСвойстваИКатегории'
	И в таблице 'ТаблицаСвойств' я перехожу к строке:
		| "Конец таблицы" | "О"  | "Свойство"   |
		| "Нет"           | "Да" | "Хит продаж" |
	И в таблице 'ТаблицаСвойств' я активизирую поле с именем 'ТаблицаСвойствЗначение'
	И в таблице 'ТаблицаСвойств' я выбираю текущую строку
	И в таблице 'ТаблицаСвойств' из выпадающего списка с именем 'ТаблицаСвойствЗначение' я выбираю точное значение "Да"
	И в таблице 'ТаблицаСвойств' я завершаю редактирование строки
	И в таблице 'ТаблицаСвойств' я перехожу к строке:
		| "Конец таблицы" | "О"  | "Свойство"            |
		| "Нет"           | "Да" | "Температурный режим" |
	И в таблице 'ТаблицаСвойств' я выбираю текущую строку
	И в таблице 'ТаблицаСвойств' я нажимаю кнопку выбора у реквизита с именем 'ТаблицаСвойствЗначение'
	И в таблице 'ТаблицаСвойств' я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "Картофель весовой (Номенклатура) *" в течение 20 секунд
	Тогда открылось окно "Номенклатура"
		
