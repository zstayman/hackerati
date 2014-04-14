def find_consecutive(array)
  ans = Array.new
  array.each_with_index do |val, i|
    if (array[i+1] == val+1 && array[i+2] == val+2) || (array[i+1] == val-1 && array[i+2] == val-2)
      ans << i
    end
  end
  return ans
end
