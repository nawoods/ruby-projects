def fibs(n)
  this_number = 1
  last_number = 1
  (n-2).times { this_number, last_number = this_number + last_number, this_number }
  n == 0 ? 0 : this_number
end

def fibs_rec(n)
  n < 2 ? n : fibs_rec(n-1) + fibs_rec(n-2)
end