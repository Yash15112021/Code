function ruddi = makron(varargin)

ruddi=1;

for idx=1:numel(varargin)
  ruddi=kron(ruddi,varargin{idx});
end
end