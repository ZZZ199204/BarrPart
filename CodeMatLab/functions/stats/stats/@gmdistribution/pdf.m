function y=pdf(obj,X)
% PDF PDF for a Gaussian mixture distribution.
%    Y = PDF(OBJ,X) returns Y, a vector of length N containing the
%    probability density function (PDF) for the gmdistribution OBJ,
%    evaluated at the N-by-D data matrix X. Rows of X correspond to points,
%    columns correspond to variables. Y(I) is the PDF value of point I.
%
%    See also GMDISTRIBUTION, GMDISTRIBUTION/CDF.

%   Copyright 2007 The MathWorks, Inc.
%   $Revision: 1.1.8.3 $  $Date: 2011/05/09 01:28:09 $

% Check for valid input
if nargin ~= 2
    error(message('stats:gmdistribution:pdf:TooFewInputs'));
end

checkdata(X,obj);

covNames = { 'diagonal','full'};
CovType = find(strncmpi(obj.CovType,covNames,length(obj.CovType)));
log_lh = wdensity(X,obj.mu, obj.Sigma, obj.PComponents, obj.SharedCov, CovType);
y =  sum(exp(log_lh),2);
