//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var hello = "hi"

print(hello)


protocol Animal {
    func walk() -> String
}

class Dog: Animal{
    func walk() -> String {
        return "I am a dog"
    }
}

class Cat: Animal{
    func walk() -> String {
        return "I am a cat"
    }
}


var dict:[Int: Animal] = [:]


dict[0] = Dog()
dict[1] = Cat()


for(key,value) in dict{
    print(value.walk())
}


