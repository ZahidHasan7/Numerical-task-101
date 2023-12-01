#include <bits/stdc++.h>
using namespace std;
int main() {
  double t[] = {5, 8, 12};
  double v[] = {106.8, 177.2, 279.2};
  double A[3][3] = {{25, 5, 1}, {64, 8, 1}, {144, 12, 1}};
  double b[3] = {106.8, 177.2, 279.2};
  for (int i = 0; i < 3; i++) {
    for (int j = i + 1; j < 3; j++) {
      double factor = A[j][i] / A[i][i];
      for (int k = 0; k < 3; k++) {
        A[j][k] -= factor * A[i][k];}
      b[j] -= factor * b[i];
    }}
  double x[3];
  for (int i = 2; i >= 0; i--) {
    x[i] = b[i];
    for (int j = i + 1; j < 3; j++) {
      x[i] -= A[i][j] * x[j];}
    x[i] /= A[i][i];
  }
  cout << "a1: " << x[0] << endl;
  cout << "a2: " << x[1] << endl;
  cout << "a3: " << x[2] << endl;
  double t1 = 6;
  double v1= x[0] * t1 * t1 + x[1] * t1 + x[2];
  cout << v1 << endl;
  return 0;
}

