male(andy).
male(bob).
male(cecil).
male(dennis).
male(edward).
male(felix).
male(martin).
male(oscar).
male(quinn).

female(gigi).
female(helen).
female(iris).
female(jane).
female(kate).
female(liz).
female(nancy).
female(pattie).
female(rebecca).

married(bob, helen).
married(helen, bob).
married(dennis, pattie).
married(pattie, dennis).
married(gigi, martin).
married(martin, gigi).

parent(andy, bob).
parent(bob, cecil).
parent(cecil, dennis).
parent(dennis, edward).
parent(edward, felix).
parent(gigi, helen).
parent(helen, iris).
parent(iris, jane).
parent(jane, kate).
parent(kate, liz).
parent(martin, nancy).
parent(nancy, oscar).
parent(oscar, pattie).
parent(pattie, quinn).
parent(quinn, rebecca).

parent(X, Z) :- married(X, Y), parent(Y, Z).

sibling(Y, Z) :- parent(X, Y), parent(X, Z).

brother(X, Y) :- sibling(X, Y), male(X), male(Y).

sister(X, Y) :- sibling(X, Y), female(X), female(Y).

cousin(Y, Z) :- parent(W, Y), parent(X, Z), sibling(W, X).

% Query example
% Check if Liz and Rebecca are cousins
% ?- cousin(liz, rebecca).
% Check if Liz and Kate are siblings
% ?- sibling(liz, kate).
% Check if Dennis and Edward are brothers
% ?- brother(dennis, edward).
% Check if Helen and Iris are sisters
% ?- sister(helen, iris).
% Check if Dennis is a parent of Edward
% ?- parent(dennis, edward).

