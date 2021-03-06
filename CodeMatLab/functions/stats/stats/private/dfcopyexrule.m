function [newname, dataset, yl, yh, yle, yhe] = dfcopyexrule(name)
%DFCOPYEXRULE GUI helper to create a copy of an exclusion rule

%   $Revision: 1.1.8.2 $  $Date: 2011/08/17 21:29:34 $
%   Copyright 2003-2011 The MathWorks, Inc.

exrule=find(getoutlierdb,'name',name);

%create copy name
COPY = sprintf(' %s ',getString(message('stats:dfstrings:assignment_Copy')));
index = strfind(name, COPY);
if isempty(index)
    sourcename = sprintf('%s%s', name, COPY);
else
    sourcename = sprintf('%s%s', name(1:index-1), COPY);
end
cn = 1;
newname = sprintf('%s%d', sourcename, cn);
%loop until unique name is found
while true
    if isempty(find(getoutlierdb,'name',newname))
        break;
    else
        cn = cn+1;
        newname = sprintf('%s%d', sourcename, cn);
    end
end

%make sure dataset still exists
if isempty(find(getdsdb, 'name', exrule.dataset));
    dataset='(none)'; % not to be translated
else
    dataset=exrule.dataset;
end

yl = exrule.YLow;
yh = exrule.YHigh;
yle = exrule.YLowLessEqual;
yhe = exrule.YHighGreaterEqual;




