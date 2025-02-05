function T = time(x, i)

    c = [54.13, 21.56, 34.08, 49.19, 33.03, 21.84, ...
    29.96, 24.87, 47.24, 33.97, 26.89, 32.76, ...
    39.98, 37.12, 53.83, 61.65, 59.73];

    if i > 17 || i < 0
        print('Error: i must be between 0 and 17');
        return;
    end

    if x >= 17
        T = Inf;
        return
    elseif x < 0
        print('Error: x must be greater than 0');
        return
    end

    T = 10 + a(i) * x / (1 - x / c(i));

function a = a(i)
    if i >=1 && i <= 5
        a = 1.25;
    elseif i >= 6 && i <= 10
        a = 1.5;
    else
        a = 1;
    end
    