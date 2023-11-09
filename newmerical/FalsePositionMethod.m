clc;
eq = input('Enter an equation ( x): ', 's');
f = str2func(['@(x) ', eq]);
t = input('Enter tolerance: ');
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
 c = (a*f(b) - b*f(a))/(f(b) - f(a));
 while(abs(c - b) > t || abs(c - a) > t)
  c = (a*f(b) - b*f(a))/(f(b) - f(a));
  ans = [c, ans];
  if abs(c - b) < t || abs(c - a) < t
    break;
  endif
  if f(a)*f(c) < 0
    b = c;
  elseif f(b)*f(c) < 0
    a = c;
  end
end
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
fprintf('Root is %0.4f\n', c);
disp(ans');

