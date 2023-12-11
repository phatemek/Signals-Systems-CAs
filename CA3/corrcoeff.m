function result = corrcoeff(x, y)
    sorat = x .* y;
    sorat = sum(sorat(:));
    sumx2 = x .* x;
    sumx2 = sum(sumx2(:));
    sumy2 = y .* y;
    sumy2 = sum(sumy2(:));
    makhraj = sqrt(sumx2 * sumy2);
    result = sorat / makhraj;
end