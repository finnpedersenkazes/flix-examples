# Boolean Logic in `Datalog`.

Implementaion of Boolean Logic in `Datalog`.

Using an Enumerated Type instead of text. 
However, this fails. See error message below. 

- Domain (False, True)
- And
- Or
- Xor
- Equal
- Different

Negation is handled explicitly with the predicate Different, which is used to define Xor.

````
❌ -- Type Error -------------------------------------------------- file:///Users/finninfrance/code/finnpedersenkazes/flix/flix-examples/example08/BooleanLogic.flix

>> No instance of class 'ToString' for type Boolean.

40 |              select (xt) from BooleanToString(True, xt) |> println;
                                   ^^^^^^^^^^^^^^^^^^^^^^^^^
                                   no instance of class 'ToString' for type Boolean


Tip: Add an instance for the type.
````