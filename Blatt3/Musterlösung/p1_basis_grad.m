% evaluate the i-th basis function at point x (vector)
function [basis] = p1_basis_grad(x, i)
    switch i 
        case 1
            basis = [ -1 -1];
        case 2
            basis = [1 0];
        case 3
            basis = [0 1];
        otherwise
            disp('only three local basis fuunctions exist');
    end

end