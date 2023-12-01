def zip(arr1, arr2)
  arr1.map.with_index {|el, idx| [arr1[idx],arr2[idx]] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]