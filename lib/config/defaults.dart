/// General settings available at settings screen.
library;

/// Default grid size. Grid should always be a square. 
const int gridLength = 4;
const int defaultRows = gridLength;
const int defaultColumns = gridLength;

/// Range to choose the total number of tetromino tiles in the level
const int lowerTileCounter = 4;
const int upperTileCounter = 9;

/// Range to choose the number of applied operations for each tile
const int lowerTileOperation = 0;
const int upperTileOperation = 8;

/// Resolution or sensitivity of shift operation of tetromino tile
/// The smaller, the more sensitive
final double threshold = 30.0;

/// [Not yet implemented features]
/// 
/// Light mode is default.
// bool lightMode = true;

/// Language settings. English is default.
// List<String> languages = ["german", "english"];
