def searchArray(arr, num)
    count = 0
    arr.each do |x|
        if x == num
            puts count 
        end
        count += 1
     end
 end

def add(num1, num2)
        final = num1 + num2
        return final
end

def fib(num)
    arr = [0, 1]
    
    index = 0
    while index < num - 2
        arr << add(arr[index], arr[index + 1])
        index += 1
    end
    
    return arr    
end
            
def sortArray(arr)#DOUBLE WHILE LOOP FOR BUBBLE SORT
    i = 0
    while i < arr.length
       j = 1
       while j < arr.length - i
           if arr[j-1] > arr[j]
               temp = arr[j-1]  
               arr[j-1] = arr[j]               
               arr[j] = temp                  
           end
           j += 1
        end
        i += 1
    end
    
    return arr
end

def bubble_sort(arr) #CLEANER CODE FOR BUBBLE SORT
    sort = false
    until sort 
    sort = true
        (arr.length - 1).times do |i|
            if arr[i] > arr[i + 1]
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                
                sort = false
            end
        end
    end
    return arr
end
 
arr = [8, 13, 2, 1, 76, 5, 1, 3]

print arr
puts
print ("Found 13 in index: ")
searchArray(arr, 13)
print ("Fib 6 is: ")
fibarr = fib(6)
sortarr = sortArray(arr)
sortarrv2 = bubble_sort(arr)


p fibarr
p sortarr
p sortarrv2