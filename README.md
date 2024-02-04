![./.drawio/app-icon.svg](./.drawio/app-icon.svg)

## PILA - Idea
In this Flutter game you have to stack different tetris forms to match a given pattern of numbers. 


## Development
This game is developed using [Flutter](https://flutter.dev/). 

- First step, will be the `Menu screen`
- Second, the `About` screen shows text and basic information
- Third, the `Settings` screen offers some parameters to change or switch by the user
- Next, the `Tutorial` should provide the first playable levels
- Finally, the `Play` screen loads the first level for th users to play

Mehanics to implement:
- Define the square game field
- Implement the seven element forms to keep also their shape after rotation
- Implement the summation of each number stack
- Implement the algorithm to setup the stacked level to play
- Implement the boundary limitations of the forms to not overlap with the boundary of the game field
- Implement the level screen with the game field and the different element forms and buttons at the bottom of the screen

### Concept
The following diagram shows the first basic concept for designing the app and different screens. 

Notes to `Play`:
- `Continue`: The player can continue with the game / level.

Notes to `Tutorial`:
- `How to play`: The player can learn the basics with 1 to 3 levels which explain the mechanics and rules and how to play the game.

Notes to `Settings`:
- `Dark Mode / Colours`: The player can select between dark mode and light mode, as well as color settings for color blindness.
- `Difficulty`: 
  - `easy`: Single fields of each element do have different values (not just 1), this simplifies the game due to easier identifiable positions.
  - `classic`: All single fiels of each element do have the value 1.
- `Field Size`:
  - The player can choose between 4x4, 5x5 or 6x6 field size.

Notes to `About`:
- `Version`: Version of the game (e.g. `MAJOR.MINOR.PATCH` version)
- `Impressum and Contact`: Contact information about the game developer.
- `Support`: The player can make a voluntary financial contribution to the development of the game 

![./.drawio/app-concept.svg](./.drawio/app-concept.svg)

