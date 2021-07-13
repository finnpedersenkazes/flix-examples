/// Fibonacci function
def fibonacci(n: Int): Int = match n {
    case 0 => 1
    case 1 => 1
    case _ => fibonacci(n-2) + fibonacci(n-1)
}

// Computes the fibonacci number.
def main(_args: Array[String]): Int & Impure = 
    let m = 12; 
    let result = fibonacci(m);
    println("fibonacci(${m}) = ${result}");
    m
