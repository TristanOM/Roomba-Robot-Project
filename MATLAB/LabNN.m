%Tristan Oliver-Mallory
%%
load 'optdigits (1).tra';
load 'optdigits (2).tra';
A = load ('optdigits (1).tra');
B = load ('optdigits (2).tra');
%%
A = A/16;
B = B/16;
%A(:,65) = [];
B(:,65) = [];

%%
labels = zeros(size(A,1),10);

%%
for i = 1:3823;
   G = optdigits__1_(i,65);
   G = G +1;
    labels(i, G) = 1;
end

%%
labels = labels';
A = A';
%%
net = newp([0 1; 0 1],1);
net.trainParam.epoches=10;
p = [0 0 1 1; 0 1 0 1];
t = [ 0 0 0 1];
net = train(net,p,t);
a = sim(net,p);
sum(abs(a-t));

%%
net = newp([0 1; 0 1; 0 1; 0 1 ;0 1; 0 1; 0 1; 0 1
    0 1; 0 1; 0 1; 0 1 ;0 1; 0 1; 0 1; 0 1
    0 1; 0 1; 0 1; 0 1 ;0 1; 0 1; 0 1; 0 1
    0 1; 0 1; 0 1; 0 1 ;0 1; 0 1; 0 1; 0 1
    0 1; 0 1; 0 1; 0 1 ;0 1; 0 1; 0 1; 0 1
    0 1; 0 1; 0 1; 0 1 ;0 1; 0 1; 0 1; 0 1
    0 1; 0 1; 0 1; 0 1 ;0 1; 0 1; 0 1; 0 1
    0 1; 0 1; 0 1; 0 1 ;0 1; 0 1; 0 1; 0 1 ; 0 1],10);
net.trainParam.epochs=10;
t = labels;
net = train(net,A,labels);
f = sim(net,B');
sum(abs(f - labels));
%%
net = newff(A,labels,64);
net = train(net,A,labels);
outputs = net(A);
errors = outputs - labels;
perf = perform(net,outputs,labels);
