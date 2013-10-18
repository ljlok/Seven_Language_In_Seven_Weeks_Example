sum_array := method(
    list_to_sum,
    i := 0 
    result := 0
    list_size := (list_to_sum size)
    for(i,0,list_size-1,
       sub_list := (list_to_sum at(i))
       sum_sub_list := (sub_list sum)
       result := result + sum_sub_list
        );writeln("result is:",result)
)

sum_array(list(list(5,2),list(3,4)))
