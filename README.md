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
Функционал избранных маршрутов можно реализовать локально на устройстве без привязки к учётной записи, что я и и буду делать, используя локальное хранилище. Это решение упростило приложение и сделало его более доступным: пользователь может сразу начать пользоваться приложением, открыв главный экран.
На данный момент для работы приложения я подключил бэкенд, который предоставляет данные о расписании и изменениях. Бэкенд реализован через REST API, который возвращает данные в формате JSON. Я настроил запросы для получения:
Списка маршрутов и расписания.
Информации об остановках.
Информация ближайшего автобуса.

### Итоговое видео: Текущая версия приложения v0.2
[![Итоговое видео: Текущая версия приложения](https://img.youtube.com/vi/Ci5NtzkHEME/0.jpg)](https://www.youtube.com/watch?v=Ci5NtzkHEME)

### Экран Регистрации и входа, интеграция Firebase FireStore в приложение Версия приложения v0.01
[![Видео: Экраны регистрации и входа](https://img.youtube.com/vi/2WZKiYzL9ic/0.jpg)](https://www.youtube.com/watch?v=2WZKiYzL9ic)
### Итоговое видео:  Версия приложения v0.1
[![Демонстрация экрана входа и регистрации](https://img.youtube.com/vi/CqOgqNgTT30/0.jpg)](https://www.youtube.com/watch?v=CqOgqNgTT30)
### [Дополнительные материалы (Яндекс.Диск)](https://disk.yandex.ru/d/SM3CKLH5KRYWNA)
## Дизайн приложения
Перед началом разработки я самостоятельно создал прототип дизайна в Figma, чтобы визуализировать интерфейс приложения и продумать пользовательский опыт. Самостоятельное создание логотипа и придумывания названия.


### Итоговый дизайн 
https://www.youtube.com/watch?v=Ci5NtzkHEME&ab_channel=EgorKineshMobi
https://youtu.be/Ci5NtzkHEME
[![Видео: Прототип дизайна в Figma](ttps://img.youtube.com/vi/Ci5NtzkHEME/0.jpg)](https://www.youtube.com/watch?v=Ci5NtzkHEME)
[![Видео: Прототип дизайна в Figma](https://img.youtube.com/vi/Scc7TpWkRD0/0.jpg)](https://www.youtube.com/watch?v=Scc7TpWkRD0)
### Figma
[[Figma Design KineshMobi](https://www.figma.com/design/BnfHzwWtoBNlHtyQs0cod4/KineshmaMobi?node-id=0-1&t=NCSJkJbsAseOPV4I-1)
#### [Яндекс диск ](https://disk.yandex.ru/d/SM3CKLH5KRYWNA)
### Планы
В дальнейшем я планирую:
Добавление взаимодействия с геолокациий, чтобы приложение считывало у пользователя геолокацию и находила ближайшую остановку. 
Добавить карту с отображением маршрутов и остановок (например, с помощью Google Maps API).
Реализовать push-уведомления для более оперативного информирования о задержках.
Провести тестирование с реальными пользователями, чтобы собрать обратную связь и улучшить интерфейс.
Добавить поддержку английского языка, чтобы приложение могли использовать туристы.
Добавить экрана с более подробным расписанием маршрута.

## Архитектура проекта
```
assets/                                 Ассеты: иконки, шрифты и другие ресурсы**
lib/
├── routes/                             # Файлы маршрутизации
├── main_widget/                        # Общие виджеты, используемые на разных экранах
├── screens/                            # Экраны приложения
│   ├── screen_register_phone_number/   # Экран регистрации по номеру, никнейм/пароль
│   │                                   # ⚠️ Удалён на момент версии v0.2
│   ├── screen_home/                    # Главный экран
│   │   ├── screen_home.dart            # Основной файл главного экрана
│   │   └── widgets_home/               # Виджеты главного экрана
│   │       ├── route_card.dart         # Карточка маршрутов
│   │       ├── route_color.dart        # Цвета маршрутов
│   │       ├── stop_dropdown.dart      # Выпадающий список (логика)
│   │       ├── text_home_page.dart     # Текстовые виджеты для главного экрана
│   │       └── textfield_stopinput.dart# Текстовое поле ввода остановки (логика)
│   └── screen_route_detail/           # Папка с Экранлом с деталями маршрута
│       └── widgets_route_detail/       # Виджеты для экрана деталей маршрута
        └── screen_route_detail.dart/   # Экран деталей маршрута + Логика  + Виджеты

```


   ```lib/screens/screen_home/widgets_home/route_card.dart - карточка маршрутов
   ```lib/screens/screen_home/widgets_home/route_color.dart - цвета кругов для маршуртов
   - ``lib/screens/screen_home/widgets_home/stop_dropdown.dart`` - выпдающий список ( логика) 
   - ``lib/screens/screen_home/widgets_home/text_home_page.dart`` - текстовые виджеты для экрана
   - ``lib/screens/screen_home/widgets_home/textfield_stopinput.dart`` - текстовое поле, логика
     - ``lib/screens/screen_route_detail/`` - папка с экраном
        - ``lib/screens/screen_route_detail/widgets_route_detail`` - папка с виджетами этого экрана
                  - ``lib/screens/screen_route_detail/widgets_route_detail`` - папка с виджетами этого экрана
      
        - ``lib/screens/screen_route_detail/screen_route_detail.dart`` - экран более подробного маршрута

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

