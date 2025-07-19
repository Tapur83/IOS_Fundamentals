/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var array: [Any] = ["tapur", 20, 99.99, true]
print("\(array[0]) is \(array[1]) years old with \(array[2]) marks")
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for Iarr in array{
    if let arr1 = Iarr as? Int{
        print("it is an integer \(arr1)")
        
    }
}

for Darr in array{
    if let arr2 = Darr as? Double{
        print("it is a double \(arr2)")
        
    }
}

for Sarr in array{
    if let arr3 = Sarr as? String{
        print("it is a String \(arr3)")
        
    }
}

for Barr in array{
    if let arr4 = Barr as? Bool{
        print("it is a Bool \(arr4)")
        
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
 
var Dic: [String: Any] = ["name": "Tapur", "age":20, "marks": 99.99, "female": true, "Akshit": "3"]
print(Dic.keys)
print(Dic.values)
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
 
var total: Double = 0

for (heading,value) in Dic{
    if let integer = value as? Int{
        total += Double(integer)
        print(total)
    }
   else if let Double = value as? Double{
        total += Double
        print(total)
    }
    else if let String = value as? String{
        total += 1
        print(total)
    }
   else if let Bool = value as? Bool{
        if Bool == true{
            total += 2
        }
        else{
            total -= 3
        }
    }
}
        
print(total)
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
 
var total2: Double = 0

for (heading,value) in Dic{
    if let integer = value as? Int{
        total += Double(integer)
        print(total)
    }
    else if let Double = value as? Double{
        total += Double
        print(total)
    }
    else if let String = value as? String{
        if let StringD = Double(String){
            total += StringD
            print("string: \(StringD)")
            print(total)
        }
    }
}
/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
