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

## Документация
[![Как на данный момент выглядит приложение](https://youtu.be/CqOgqNgTT30)





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

