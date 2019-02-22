//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//0 1 1 2 3 5 8 13 21 34 55 89

func fibNumber(_ n: Int) -> Int {
    guard n > 1 else { return n }
    return fibNumber(n-2) + fibNumber(n-1)
}

fibNumber(1)
fibNumber(0)
fibNumber(4)
fibNumber(6)

if (n <= 1) return n;
int last = 1;
int prevlast = 0;
int current = 0;

for (int i = 2 ; i <= n ; i++) {
    current = last + prevlast ;
    prevlast = last;
    last = current;
}
return current;



double sqrt5 = Math.sqrt(5);

return (int) ((Math.pow(1+sqrt5, n) - Math.pow(1-sqrt5, n)) / (Math.pow(2,n)*sqrt5));
