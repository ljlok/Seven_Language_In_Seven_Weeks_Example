Numeric := Object clone
Numeric fib_for := method(
    n,
    i := 1
    pre_fib := 1
    next_fib := 0
    fib_rs := 1
    if( n<=2 ) then(fib_rs println) else(
          for(i,1,n,
              next_fib := pre_fib 
              pre_fib := fib_rs 
              fib_rs := pre_fib+next_fib
              fib_rs println
              );
          writeln("The No.",n," fibnacci=",fib_rs,"\n------") 
        )
)

Numeric fib_recursion := method(
    n,
    i := 1
    fib1 := 1
    if( n<=2 ) then(return fib1) else(
        for(i,2,n,
            pre_fib := fib_recursion(n-1)
            ppre_fib := fib_recursion(n-2)
            fib_rs := pre_fib + ppre_fib
        );
        writeln("The No.",n," fibnacci=",fib_rs,"\n------") 
    )

)
Numeric fib_recursion(5)

