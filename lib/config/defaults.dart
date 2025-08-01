/*
General settings available at settings screen.
 */

/*
Default field size. Field should always be a square.
Maybe in future releases it will be possible to set a new size.
 */
const int fieldLength = 4;
const int defaultRows = fieldLength;
const int defaultColumns = fieldLength;

/*
Set if default value of 1 should be used.
Can be switched in settings via toggle.
Default value is set to 1.
 */
bool defaultValueActive = true;
const int defaultValue = 1;
int randomNumberLimit = 5;

/*
Light mode is default.
 */
bool lightMode = true;

/*
Language settings.
English is default.
 */
List<String> languages = ["german", "english"];

/*
Color settings.
It is possible to adjust colors with regards to color blindness.
 */
