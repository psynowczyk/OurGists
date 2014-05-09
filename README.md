## My Gists - kontynuacja projektu.

[![Build Status](https://travis-ci.org/kaka2991/my_gists.svg)](https://travis-ci.org/kaka2991/my_gists)

Nazwa zespołu: *None*

Członkowie:
- Damian Labuda,
- Jacek Sikora,
- Piotr Synowczyk.

Link do działającej aplikacji na Heroku: http://damlab.herokuapp.com

Projekt ten jest kontynuacją projektu z zaliczenia laboratoriów (tym razem pracujemy w grupie).

Aby rozróżnić rzeczy, które były zrobione przed projektem na egzamin, pozostawiam w tym README.md poprzednie zapisy.

Udział poszczególnych osób można śledzić na remote branchach. Poniżej skrócony opis dzieła każdego z nas.


### Damian Labuda

#### Logowanie
* dodałem logowanie użytkowników za pomocą zewnętrznych serwisów:
 - Facebook,
 - GitHub,
 - Google,
* logowanie zrealizowane jest za pomocą OAuth,
* użyte gemy do obsługi logowania:
 - omniauth,
 - omniauth-facebook,
 - omniauth-github,
 - omniauth-google-oauth2,
* dodałem static_pages controller z dwoma widokami (login_required i login_failed),
* dodałem restrykcje dla niezalogowanych użytkowników (na poziomie controllerów oraz widoków):
 - nie mogą edytować gistów,
 - nie mogą usuwać gistów.

#### reCAPTCHA
* dodałem obsługę reCAPTCHA,
* użyte gemy do obsługi recaptcha:
 - recaptcha,
 - bcrypt-ruby,
* user musi wprowadzić reCAPTCHA aby dodać nowy gist (jeśli nie jest zalogowany).

#### Statystyki
* dodałem widok statystyk dla gistów,
* statystyki są zrealizowane za pomocą dwóch gemów:
 - chartkick,
 - groupdate,
* widok statystyk nie wymaga logowania.


### Jacek Sikora
-


### Piotr Synowczyk
-


## Poprzednie README.md (zaliczenie laboratoriów)

* Dodałem select z językami do wyboru podczas tworzenia nowego gist'a,
* poprawiłem wszystkie widoki (bootstrap + kilka własnych, drobnych modyfikacji),
* kolorowanie kodu na stronie głównej + ucinanie długich linijek,
* powiększyłem textarea dla odpowiednich widoków,
* w widoku wszystkich gistów, po najechaniu na jakiś gist zmienia się hover oraz można na niego kliknąć, po czym zostaniemy przeniesieni na odpowiednią stronę (~~rozwiązane za pomocą: jquery + css~~ css + onclick due to problems with turbolinks),
* dodałem limit znaków dla description (80) + word wrapping dla niego (css),
* dodałem obsługę paginacji (gem will_paginate),
* dodałem obsługę wyszukiwania:
 - form wyszukiwania standardowo jest ukryty - jest rozwijany po kliknięciu na przycisk (css),
 - wyszukiwanie działa na stronie głównej, razem z paginacją i infinity scrolling,
 - można wyszukiwać na podstawie treści snippeta, description i języka wrzutki,
 - wyszukiwanie jest zrobione dość 'cwanie' (mam ten sam widok dla wszystkich gistów i dla wyszukiwanych),
* dodałem sporo przykładowych rekordów do bazy danych via db/seeds.rb (większość rekordów to przykłady 'Hello World' w danych językach, nawet w kilku wersjach),
* naprawiłem błąd "ArgumentError: invalid byte sequence in UTF-8" (gem utf8-cleaner),
* zmieniłem order wyświetlania gistów (wyświetlam teraz na podstawie updated_at - czyli na górze strony mam zawsze najnowsze gisty),
* wdrożenie na heroku,
* kilka innych, drobnych zmian i bug fixów (wszystko w commitach).

### Infinite Scrolling

* Infinite Scrolling jest zrealizowane za pomocą gemów:
 - will_paginate,
 - will_paginate-bootstrap,
* oraz za pomocą dwóch skryptów JavaScript:
 - index.js.erb,
 - pagination.js.coffee,
* bazowałem na poradniku http://www.sitepoint.com/infinite-scrolling-rails-basics/, z własnymi modyfikacjami, m.in.:
 - naprawiłem problem z kilkukrotnym ładowaniem się tych samych gistów w przypadku szybkiego scrollowania,
 - usunąłem wyłączanie paginacji po wyświetleniu wszystkich gistów,
 - usunąłem pokazywanie obrazka "loading" podczas pobierania nowych danych,
 - zmieniłem sposób renderowania will_paginate (BootstrapPagination::Rails).

### Użyte niestandardowe Gemy

* pygments.rb,
* bootstrap-sass,
* pg (produkcja - Heroku),
* rails_12factor (produkcja - Heroku),
* will_paginate,
* will_paginate-bootstrap,
* utf8-cleaner.
