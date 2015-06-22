function basis_div = p1_basis_div( x,i, trafo)
%Divergenz der i-ten Basisfunktion am Punkt x
if(i<4)
    basis_div = trafo(:,1)'*p1_basis_grad(x,i)';
elseif(i>3 && i < 7)
    basis_div = trafo(:,2)'*p1_basis_grad(x,i-3)';
else
    disp('only six twodimensional local basis functions exist');
end

% switch i
%     case 1
%         basis_div = 1;
%     case 2
%         basis_div = 0;
%     case 3
%         basis_div = -1;
%     case 4
%         basis_div = 0;
%     case 5
%         basis_div = 1;
%     case 6
%         basis_div = -1;
%     otherwise
%         disp('only six twodimensional local basis functions exist');


end

