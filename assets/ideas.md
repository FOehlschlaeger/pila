# Collection of loose Ideas

## Dateistruktur
- In Readme eine grafische Darstellung des Hauptmenüs und des Spielebildschirms.
- Dateien in `/lib/`
  - main.dart
  - config/Default Settings
  - config/Colors
  - home.dart
  - screens/settings
  - screens/play
  - screens/about
  - screens/help
  - elements/tetrominos
  - elements/field
  - functions/rotation
  - functions/apply
  - functions/generator
  - functions/save
- Assets mit Grafiken als svg-Dateien / Vektorgrafiken
  - Tetrominos
  - Feld
  - Offizielle Buttons
  - Tetromino Buttons
  - Logo

## Optik und Farbgebung
- Hintergrund mit Farbverlauf von unten nach oben, Orange über weiß bis Blau? Oder nur in blau-türkis-Farbtönen?
- Menü-Leiste oben blau mit Home Button, App Logo, Help-Button oder nur Burger-Menü und Help-Button?
- Menü-Leiste unten (orange?) mit Revert Button, Rotate Button, Apply Button.
- Im Startbildschirm untere Leiste mit Version und Build Tag oder Stable Commit. Ohne obere Leiste
  **Oder**
  - Kein Home Screen, sondern direkt in Spiel Screen.
- Farben der Zahlen im Feld von Dunkelgrau (hohe Zahl) bis Hellgrau (Null).

## UI
- Revert Button gedrückt halten für Level Reset. Hold for reset.
- Rotate Button für 90 Grad Rotation des Tertrominos.
- Apply Button zum Setzen des Tetrominos.
- Positionieren des Tetrominos im Feld über Wisch-Gesten in entsprechende Richtung auf Bildschirm oder Greifen des Tetrominos und platzieren.
- In unterer Hälfte des Bildschirm Tetrominos in zwei Reihen, vier oben, drei unten.
- Mit Feld als Hintergrund und Tetromino Symbol in kleiner Version darauf und links davon die verfügbare Anzahl des Tetrominos.
- Mit Auswahl eines Tetrominos erscheint dieser halbtransparent im Feld mit leuchtenden Rahmen.
