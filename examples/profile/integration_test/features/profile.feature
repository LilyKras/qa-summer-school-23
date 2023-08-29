#language: ru
#noinspection NonAsciiCharacters

Функциональность: Профиль

  Сценарий: Успешное заполнение профиля
    Когда Я перехожу к редактированию профиля
    И Я указываю фамилию "Semenikhina"
    И Я указываю дату рождения "1998-11-14"
    И Я указываю имя "Daria"
    И Я указываю отчество "Evgenevna"
    И Я перехожу далее
    И Я выбираю город "Voronezh"
    И Я перехожу далее
    И Я выбираю "Design" из интересов
    И Я перехожу далее
    И Я заполняю заметку о себе "Тестовая заметка о себе"
    И Я сохраняю данные
    И Я перехожу к редактированию профиля
    Тогда Я вижу заполненные поля ФИО
    И Я вижу заполненное поле даты рождения
    Когда Я перехожу далее
    Тогда Я вижу заполненное поле города
    Когда Я перехожу далее
    Тогда Я вижу выбранные интересы
    Когда Я перехожу далее
    Тогда Я вижу заполненное поле заметки о себе
    И Я сохраняю данные

  Сценарий: Сохранение полей при валидации
    Когда Я перехожу к редактированию профиля
    И Я указываю фамилию "Semenikhina"
    И Я указываю дату рождения "1998-11-14"
    И Я указываю имя "Daria"
    И Я указываю отчество "Evgenevna"
    И Я перехожу далее
    И Я выбираю город "Voronezh"
    И Я перехожу далее
    И Я выбираю "Design" из интересов
    И Я перехожу далее
    И Я заполняю заметку о себе "Тестовая заметка о себе"
    И Я перехожу назад
    Тогда Я вижу выбранные интересы
    Когда Я перехожу назад
    Тогда Я вижу заполненное поле города
    Когда Я перехожу назад
    Тогда Я вижу заполненные поля ФИО
    И Я вижу заполненное поле даты рождения
    Когда Я перехожу далее
    Тогда Я вижу заполненное поле города
    Когда Я перехожу далее
    Тогда Я вижу выбранные интересы
    Когда Я перехожу далее
    Тогда Я вижу заполненное поле заметки о себе
    И Я сохраняю данные

  Сценарий: Отмена редактирования
    Когда Я перехожу к редактированию профиля
    И Я указываю фамилию "Semenikhina"
    И Я указываю дату рождения "1998-11-14"
    И Я указываю имя "Daria"
    И Я указываю отчество "Evgenevna"
    И Я перехожу далее
    И Я выбираю город "Voronezh"
    И Я перехожу далее
    И Я выбираю "Design" из интересов
    И Я перехожу далее
    И Я заполняю заметку о себе "Тестовая заметка о себе"
    И Я сохраняю данные
    И Я перехожу к редактированию профиля
    И Я переуказываю фамилию "Semen"
    И Я переуказываю дату рождения "1998-11-15"
    И Я переуказываю имя "Da"
    И Я переуказываю отчество "Ev"
    И Я перехожу далее
    И Я перевыбираю город "Moscow"
    И Я перехожу далее
    И Я перехожу далее
    И Я перезаполняю заметку о себе "Тестовая заметка"
    И Я отменяю редактирование
    И Я перехожу к редактированию профиля
    Тогда Я вижу заполненные поля ФИО
    И Я вижу заполненное поле даты рождения
    Когда Я перехожу далее
    Тогда Я вижу заполненное поле города
    Когда Я перехожу далее
    Тогда Я вижу выбранные интересы
    Когда Я перехожу далее
    Тогда Я вижу заполненное поле заметки о себе
    И Я сохраняю данные

  Сценарий: Валидация полей
    Когда Я перехожу к редактированию профиля
    И Я указываю фамилию ""
    И Я указываю дату рождения "1998-11"
    И Я указываю имя ""
    И Я указываю отчество ""
    И Я перехожу далее



