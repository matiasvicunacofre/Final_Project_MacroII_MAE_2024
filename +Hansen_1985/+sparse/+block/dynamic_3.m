function [y, T] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(18)=y(13)/y(14);
  y(11)=(1-params(3))*y(13)/y(14);
end
