# Boolean Logic in `Datalog`.

Implementaion of Boolean Logic in `Datalog`.

Using an Enumerated Type instead of text. 

````
enum Boolean {
    case False,
    case True
}
````
- Domain (False, True)
- And
- Or
- Xor
- Equal
- Different

Negation is handled explicitly with the predicate Different, which is used to define Xor.

## Type Class Instances for Boolean

- ToString
- Eq
- Boxable
- Order