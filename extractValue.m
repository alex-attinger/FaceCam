function val = extractValue(dat,key)
line = startsWith(dat,key);
tmp = strsplit(dat{line},'=');
tmp = tmp{2};
els=split(strtrim(tmp));
tmp=els{1};
val = regexprep(tmp,'[^a-zA-Z_0-9]','');
end
