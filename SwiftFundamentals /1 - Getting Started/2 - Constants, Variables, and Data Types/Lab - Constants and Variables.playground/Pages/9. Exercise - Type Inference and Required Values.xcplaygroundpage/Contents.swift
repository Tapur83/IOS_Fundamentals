/*:
## Exercise - Type Inference and Required Values
 
 Declare a variable called `name` of type `String`, but do not give it a value. Print `name` to the console. Does the code compile? Remove any code that will not compile.
 */
print("There are some numbers which are datatypes and cannot be used as objects, SuchAs: String. So String will notbe created as an object. ")

//:  Now assign a value to `name`, and print it to the console.
let name:String = "Tapur"
print(name)
//:  Declare a variable called `distanceTraveled` and set it to 0. Do not give it an explicit type.
var distanceTraveled: Double = 0

//:  Now assign a value of 54.3 to `distanceTraveled`. Does the code compile? Go back and set an explicit type on `distanceTraveled` so the code will compile.

distanceTraveled = 54.3
print("because we cannot assign value of type double to int. as by default compiler took distanceTraveled as int because 0 is an integer")
/*:
[Previous](@previous)  |  page 9 of 10  |  [Next: App Exercise - Percent Completed](@next)
 */
