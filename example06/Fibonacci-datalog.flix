/// Declare predicate symbols.
rel Fibonacci(x: Int, y: Int)

/// Returns a collection of facts.
def getFacts(): #{ Fibonacci } = #{
    Fibonacci(0, 1).
    Fibonacci(1, 1).
    Fibonacci(2, 2).
    Fibonacci(3, 3).
    Fibonacci(4, 5).
    Fibonacci(5, 8).
    Fibonacci(6, 13).
    Fibonacci(7, 21).
    Fibonacci(8, 34).
    Fibonacci(9, 55).
    Fibonacci(10, 89).
    Fibonacci(11, 144).
    Fibonacci(12, 233).
    Fibonacci(13, 377).
    Fibonacci(14, 610).
    Fibonacci(15, 987).
    Fibonacci(16, 1597).
    Fibonacci(17, 2584).
    Fibonacci(18, 4181).
    Fibonacci(19, 6765).
    Fibonacci(20, 10946).
}

/// Composes the facts and rules, and computes the result.
def main(_args: Array[String]): Int32 & Impure =
    query getFacts()
        select (x) from Fibonacci(x, 610) |> println;
    0 // exit code
