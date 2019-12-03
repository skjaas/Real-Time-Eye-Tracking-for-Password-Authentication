clear
clc
close all

cardnum='123456789012';

load db;

num=length(db1);
flag=0;
for j=1:num
    if strcmpi(db1(j).cardnum,cardnum)
        flag=1;
        break;
    end
end

if flag
    disp('valid card');
else
    disp('invalid')
end