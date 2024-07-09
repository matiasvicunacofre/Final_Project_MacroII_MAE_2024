function [y, T] = static_4(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(15)=(1-params(7))*y(5)/y(11);
  y(14)=(1-params(3))*y(4)/y(10);
  y(1)=y(8)+y(9);
end
