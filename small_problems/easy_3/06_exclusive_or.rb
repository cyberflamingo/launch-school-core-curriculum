def xor?(op1, op2)
  if op1 == true
    op2 == false
  else
    op2 == true
  end
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
