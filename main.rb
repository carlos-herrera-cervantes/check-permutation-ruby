# Sorts the string using the Insertion Sort algorithm
# Params:
# +str+:: The string to sort
def insertion_sort str
    for i in 1...(str.length)
        value = str[i]
        temp = i

        while temp > 0 && str[temp - 1] > value
            str[temp] = str[temp - 1]
            temp = temp - 1
        end
        
        str[temp] = value
    end

    return str
end

# Verify if the element 1 is a permutation of element 2. This is the brute force solution, 
# is not the best solution for this problem but it can be applied in some scenarios.
# +element1+:: The first element in the comparison
# +element2+:: The second element in the comparison
def permutation_brute_force? element1, element2
    if element1.length != element2.length
        return false
    end

    sorted_element1 = insertion_sort element1
    sorted_element2 = insertion_sort element2

    sorted_element1 == sorted_element2
end

# Verify if the element 1 is a permutation of element 2. This is the best solution.
# The time complexity for this function is O(n). To this we asscume that the strings
# are in ASCII characters
# +element1+:: The first element in the comparison
# +element2+:: The second element in the comparison
def premutation_optimize? element1, element2
    if element1.length != element2.length
        return false
    end

    letters = Array.new(128, 0)

    for i in 1...(element1.length)
        temp = element1[i].ord
        letters[temp] += 1
    end

    for j in 1...(element2.length)
        c = element2[j].ord
        letters[c] -= 1

        if letters[c] < 0
            return false
        end
    end

    return true
end

def main
    p 'THIS PROGRAM TAKES TWO STRINGS AND VERIFY IF ONE IS A PERMUTATION OF OTHER'
    p 'Enter the first string: '
    element1 = gets.chomp
    p 'Enter the second string: '
    element2 = gets.chomp

    p premutation_optimize?(element1, element2) ? 'Is a permutation' : 'Is not a permutation'
end

main