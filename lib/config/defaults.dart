// General settings available at settings screen.
library;

// Default grid size. Grid should always be a square. 
const int gridLength = 4;
const int defaultRows = gridLength;
const int defaultColumns = gridLength;

// Range to choose the total number of tetromino tiles in the level
const int lowerTileCounter = 3;
const int upperTileCounter = 8;

// Range to choose the number of applied operations for each tile
const int lowerTileOperation = 0;
const int upperTileOperation = 6;

// Light mode is default.
bool lightMode = true;

// Language settings. English is default.
List<String> languages = ["german", "english"];

// Color settings. It is possible to adjust colors with regards to color blindness.
