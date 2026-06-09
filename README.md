# Hogwarts Directory ⚡

Hogwarts Directory to mobilna aplikacja stworzona w frameworku Flutter, która służy jako interaktywne kompendium wiedzy o postaciach z uniwersum Harry'ego Pottera. Projekt został stworzony w celach edukacyjnych jako zadanie zaliczeniowe.

## Główne funkcjonalności aplikacji

* **Przeglądanie postaci:** Użytkownik ma dostęp do pełnej listy czarodziejów i magicznych stworzeń, pobieranej z zewnętrznego serwera.
* **Szczegóły bohatera:** Po kliknięciu w wybraną osobę, aplikacja płynnie przechodzi do osobnego ekranu wyświetlającego bardziej szczegółowe informacje na jej temat.
* **Wsparcie dla trybu offline:** Aplikacja inteligentnie buforuje pobrane dane. W przypadku braku połączenia z internetem, użytkownik nadal może przeglądać listę postaci oraz szczegóły tych bohaterów, których odwiedził wcześniej.
* **Obsługa błędów sieciowych:** W przypadku braku internetu lub braku zasobów graficznych na serwerze, aplikacja dba o płynność działania wyświetlając odpowiednie komunikaty tekstowe lub awaryjne ikony.

## Wykorzystane technologie

* **Flutter / Dart** - główny framework i język programowania.
* **http** - pakiet do obsługi asynchronicznych zapytań REST API.
* **Hive** - lekka i szybka lokalna baza danych NoSQL, odpowiedzialna za tryb offline.
* **HP-API** - darmowe REST API (https://hp-api.onrender.com) dostarczające dane o postaciach.
