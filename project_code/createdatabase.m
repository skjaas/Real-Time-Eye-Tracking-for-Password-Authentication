clear;
clc;
close all;
% ()
cardnum=num2str(input('enter card number = '));
passwd=num2str(input('enter pasword = '));

if exist('db.mat','file')
    load db;
    num=length(db1)+1;
    db1(num).cardnum=cardnum;
    db1(num).passwd=passwd;
    save db db1
else
    num=1;
    db1(num).cardnum=cardnum;
    db1(num).passwd=passwd;
    save db db1
end
