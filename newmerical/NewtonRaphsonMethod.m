clc;
pkg load symbolic;
eq = input('Enter an equation( x): ', 's');
f = inline(eq, 'x');
syms x;
ff = diff(f(x), x);
k = matlabFunction(ff);
t= input('Enter tolerance: ');
 a = input('Enter first interval: ');
 b = input('Enter second interval: ');
itr = 30;
 ans = [];
for i = 1:5
  if f(a)*f(b) < 0
    break;
  else
    fprintf('Root doesnot exist.\n')
  end
end
c = (a+b)/2;
 while(abs(d-c)>= t)
  f_c = f(c);
  k_c = k(c);
  ans = [c, ans];
  d = c - (f_c/k_c);
  if abs(d-c) <= t
    break;
  endif
  c = d;
end

fprintf('Root is %0.3f\n', c);
disp(ans);
x = 0:0.1:10;
hold on
plot(x, f(x));
plot(c, f(c), 'or');
title([eq, ' = 0']);
titleFontSize = 16;
set(get(gca, 'title'), 'FontSize', titleFontSize);
axisLabelFontSize = 12;
set(gca, 'FontSize', axisLabelFontSize);
set(gca, 'xAxisLocation', 'origin');
fprintf('Root is %0.3f\n', c);
disp(results');
