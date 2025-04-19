# KineshMobi



<p align="center">
      <img src="https://i.ibb.co/JFMJzxhY/logo1.png" alt= "Project Logo" width="726">
</p>

<p align="center">
   <img src="https://img.shields.io/badge/Dart%20%20-green" alt="dart">
   <img src="https://img.shields.io/badge/version%20-%203.5.4%20(stable)-blue" alt="dart Version">
</p>

## О проекте

Мобильное приложение для просмотра расписание в городе Кинешма.
Основная цель — улучшение транспортной доступности для жителей Кинешмы через удобный интерфейс, позволяющий быстро узнать актуальное расписание автобусов, планировать поездки, сохранять избранные маршруты  и следить за актуальными изменениями.

## Демострация приложения
Изначально я планировал добавить экраны регистрации и входа, чтобы пользователи могли создавать учётные записи и синхронизировать избранные маршруты между устройствами. Однако после анализа я решил отказаться от этой функции по нескольким причинам:
Основная аудитория приложения — жители Кинешмы, включая пожилых людей, которые могут не захотеть проходить регистрацию из-за её сложности.
Регистрация требует дополнительного времени на разработку и поддержку (например, хранение паролей, восстановление доступа), что увеличило бы сроки проекта.
Функционал избранных маршрутов можно реализовать локально на устройстве без привязки к учётной записи, что я и сделал, используя локальное хранилище. Это решение упростило приложение и сделало его более доступным: пользователь может сразу начать пользоваться приложением, открыв главный экран.
На данный момент для работы приложения я подключил бэкенд, который предоставляет данные о расписании и изменениях. Бэкенд реализован через REST API, который возвращает данные в формате JSON. Я настроил запросы для получения:
Списка маршрутов и расписания.
Информации об остановках.
Информация ближайшего автобуса.
Yanedx Disk = (https://disk.yandex.ru/d/SM3CKLH5KRYWNA)
### Итоговое видео: Текущая версия приложения
[![Итоговое видео: Текущая версия приложения](https://img.youtube.com/vi/CqOgqNgTT30/0.jpg)](https://www.youtube.com/watch?v=CqOgqNgTT30)

### Экран Регистрации и входа, интеграция Firebase FireStore в приложение
[![Видео: Экраны регистрации и входа](https://img.youtube.com/vi/2WZKiYzL9ic/0.jpg)](https://www.youtube.com/watch?v=2WZKiYzL9ic)

[![Демонстрация экрана входа и регистрации](https://img.youtube.com/vi/CqOgqNgTT30/0.jpg)](https://www.youtube.com/watch?v=CqOgqNgTT30)
## Дизайн приложения





## Архитектура проекта
- **lib/routes** — папка с маршрутизацией проекта 
- **lib/mainWidget** — папка с виджетами которые часто используются на экранах
- **lib/screens** — папка с экранами приложения
- **lib/screens/screen_registerphonenumber** - папка с экраном и виджетами экрана регистрации
     - **lib/screens/screen_registerphonenumber/screen_widget** - папка с виджетами для экрана регистрации 
        - lib/screens/screen_registerphonenumber/screen_widget/continuebutton.dart - кнопка регистрации
        - lib/screens/screen_registerphonenumber/screen_widget/phonenumberform.dart - Поле для ввода номера телефона
        - lib/screens/screen_registerphonenumber/screen_widget/textphone.dart - Текстовые виджеты
- **lib/screens/screen_InputVerificationCode** - папка с экраном  подтверждение SMS - кода
   - **lib/screens/screen_InputVerificationCode/widget_inputverificationcode** - папка с виджетмами экрана потверждение SMS - Кода
       - lib/screens/screen_InputVerificationCode/widget_inputverificationcode/buttonsic.dart - кнопка "Продолжить"
       - lib/screens/screen_InputVerificationCode/widget_inputverificationcode/otptextfield.dart - Поле для ввода SMS - Кода
       - lib/screens/screen_InputVerificationCode/widget_inputverificationcode/text_inputverificationcode.dart - Текстовые виджеты экрана Потверждения SMS - Кода
- **lib/screens/screen_RegisterProfile** - папка с экраном  Регистрации нового пользователя
  - **lib/screens/screen_RegisterProfile/screen_RegisterInfoWidget** - папка с Виджетмами для экрана Регистрации нового пользователя
    - lib/screens/screen_RegisterProfile/screen_RegisterInfoWidget/emailform.dart - поле для ввода своего Email
    - lib/screens/screen_RegisterProfile/screen_RegisterInfoWidget/emailtext.dart - текстовый виджет
    - lib/screens/screen_RegisterProfile/screen_RegisterInfoWidget/firstnameform.dart - поле для ввода своего имени
    - lib/screens/screen_RegisterProfile/screen_RegisterInfoWidget/isreadybutton.dart - Кнопка продолжить
    - lib/screens/screen_RegisterProfile/screen_RegisterInfoWidget/lastnameForm.dart - Поле для ввода своей фамилии
    - lib/screens/screen_RegisterProfile/screen_RegisterInfoWidget/TextFill.dart - Текстовый виджет О себе
    - lib/screens/screen_RegisterProfile/screen_RegisterInfoWidget/textfirstname.dart - Текстовый виджет Имени
    - lib/screens/screen_RegisterProfile/screen_RegisterInfoWidget/textlastname.dart - Текстовый виджет Фамилии
## Developers

- [pojalustayuidi](https://github.com/pojalustayuidi)

