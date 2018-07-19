function x = unidinv(p,n);
%UNIDINV Inverse of uniform (discrete) distribution function.
%   X = UNIDINV(P,N) returns the inverse of the uniform
%   (discrete) distribution function at the values in P.
%   X takes the values (1,2,...,N).
%   
%   The size of X is the common size of P and N. A scalar input   
%   functions as a constant matrix of the same size as the other input.    
%
%   See also UNIDCDF, UNIDPDF, UNIDRND, UNIDSTAT, ICDF.

%   Copyright 1993-2004 The MathWorks, Inc. 
%   $Revision: 1.1.8.2 $  $Date: 2010/10/08 17:27:01 $

if nargin < 2, 
    error(message('stats:unidinv:TooFewInputs')); 
end

[errorcode p n] = distchck(2,p,n);

if errorcode > 0
    error(message('stats:unidinv:InputSizeMismatch'));
end

% Initialize X to zero.
if isa(p,'single') || isa(n,'single')
    x = zeros(size(p),'single');
else
    x = zeros(size(p));
end

% Return NaN if the arguments are outside their respective limits.
x(p <= 0 | p > 1 | n < 1 | round(n) ~= n) = NaN;

k = find(p > 0 & p <= 1 & n >= 1 & round(n) == n);
if any(k)
    x(k) = ceil(n(k) .* p(k));
end
