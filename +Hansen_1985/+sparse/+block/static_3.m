function [y, T] = static_3(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(9)=y(4)/y(5);
  y(2)=(1-params(3))*y(4)/y(5);
end
