
List myAverage := method(
    
    if ( (self size) ==0,return nil )
    list_sum := 0
    self foreach (index,value,
        if( (value type) !="Number",
            Exception raise(
                "NonNumberException",
                "not a number in list") 
        )
        list_sum := list_sum + value

    )
    return list_sum/(self size)
)


list(1,2,3,4,5325,5235,235,"ff") myAverage println


