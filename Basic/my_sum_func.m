function s = my_sum_func(N)
    s = 0;
    for n=1:N
        s = s + n;
    end
    str = ['The sum is ', num2str(s)];
    disp(str);
    if s > 100
        disp('that is a huge number!')
    else
        disp('that is a small number')
    end
end