/*
Helper functions to simplify code.
 */

/*
Check if row at index i contains only null.
[
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [1, 1, 1, 0],
  [0, 0, 0, 0]
]
 */

bool hasEmptyRowAtIndex(List<List<int>> l, int index) {
  for (var i = 0; i < l[index].length; i++) {
    if (l[index][i] != 0) {
      return false;
    }
  }
  return true;
}

/*
Check if column at index i contains only null.
[
  [0, 0, 1, 0],
  [0, 1, 1, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0]
]
 */
bool hasEmptyColumnAtIndex(List<List<int>> l, int index) {
  for (var i = 0; i < l.length; i++) {
    if (l[i][index] != 0) {
      return false;
    }
  }
  return true;
}
