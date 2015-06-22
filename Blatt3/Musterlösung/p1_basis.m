% evaluate the i-th basis function at point x (vector)
function basis = p1_basis(x, i)
    switch i 
        case 2
            basis = 1 - x(1) - x(2);
        case 1
            basis = x(1);
        case 3
            basis = x(2);
        otherwise
            disp('only three local basis fuunctions exist');
    end

end