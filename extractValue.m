function val = extractValue(dat,key)
line = startsWith(dat,key);
tmp = strsplit(dat{line},'=');
tmp = tmp{2};
val = regexprep(tmp,'[^a-zA-Z_0-9]','');
end
dat=textscan(fopen('C:\code\VR-Tony\ExperimentController.py'),'%s','Delimiter','\n');
