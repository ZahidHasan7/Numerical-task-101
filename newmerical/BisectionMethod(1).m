clc;
eq = input('Enter an equation( x): ', 's');
f = str2func(['@(x) ', eq]);
t  = input('Enter tolerance: ');
a = input('Enter first interval: ');
  b = input('Enter second interval: ');
ans = [];
for i = 1:5
  if f(a)*f(b) < 0
    break;
  else
    fprintf('Root doesnot exist.\n')
  end
end
 while(abs(c - b) > t || abs(c - a) > t)
  c = (a+b)/2;
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
xlabel('X');
ylabel('Y');
axisLabelFontSize = 12;
set(gca, 'FontSize', axisLabelFontSize);
set(gca, 'xAxisLocation', 'origin');
fprintf('Root is %f\n', c);
disp('Calculated roots in each iteration:');
disp(ans');

