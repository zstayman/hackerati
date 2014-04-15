def find_consecutive(array)
  # creates an empty answer array
  ans = Array.new
  # checks every item in the array
  array.each_with_index do |val, i|
    # checks to see if the next two numbers in the array are consecutive
    if (array[i+1] == val+1 && array[i+2] == val+2) || (array[i+1] == val-1 && array[i+2] == val-2)
      # if the next two values are consecutive, it adds the index to the answer array
      ans << i
    end
  end
  # if there are no items added to the answer, the answer is set to nil
  ans[0] == nil ? ans = nil : nil
  # return the answer array or nil
  return ans
end
