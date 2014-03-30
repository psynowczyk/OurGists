### My Gists - Lista zmian

* Dodałem select z językami do wyboru podczas tworzenia nowego gist'a,
* poprawiłem wszystkie widoki (bootstrap + kilka własnych, drobnych modyfikacji),
* kolorowanie kodu na stronie głównej + ucinanie długich linijek,
* powiększyłem textarea dla odpowiednich widoków,
* w widoku wszystkich gistów, po najechaniu na jakiś gist zmienia się hover oraz można na niego kliknąć, po czym zostaniemy przeniesieni na odpowiednią stronę (~~rozwiązane za pomocą: jquery + css~~ css + onclick due to problems with turbolinks),
* dodałem limit znaków dla description (80) + word wrapping dla niego (css),
* dodałem obsługę paginacji (gem will_paginate),
* dodałem obsługę infinity scrolling z dużą ilością własnych modyfikacji w kodzie (podany poradnik na zajęciach jest niekompletny),
* dodałem obsługę wyszukiwania:
 - form wyszukiwania standardowo jest ukryty - jest rozwijany po kliknięciu na przycisk (css),
 - wyszukiwanie działa na stronie głównej, razem z paginacją i infinity scrolling,
 - można wyszukiwać na podstawie treści snippeta, description i języka wrzutki,
 - wyszukiwanie jest zrobione dość 'cwanie' (mam ten sam widok dla wszystkich gistów i dla wyszukiwanych),
* dodałem sporo przykładowych rekordów do bazy danych via db/seeds.rb (większość rekordów to przykłady 'Hello World' w danych językach, nawet w kilku wersjach),
* naprawiłem problem z kilkukrotnym ładowaniem się tych samych gistów w przypadku szybkiego scrollowania (infinity scrolling),
* naprawiłem błąd "ArgumentError: invalid byte sequence in UTF-8" (gem utf8-cleaner),
* zmieniłem order wyświetlania gistów (wyświetlam teraz na podstawie updated_at - czyli na górze strony mam zawsze najnowsze gisty),
* wdrożenie na heroku,
* kilka innych, drobnych zmian i bug fixów (wszystko w commitach).

Link do działającej aplikacji na Heroku: http://damlab.herokuapp.com
