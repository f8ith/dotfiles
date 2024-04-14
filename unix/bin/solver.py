import z3


def sym_xoroshiro128plus(solver, sym_s0, sym_s1, mask, result):
	s0 = sym_s0
	s1 = sym_s1
	sym_r = (sym_s0 + sym_s1)
	
	condition = z3.Bool('c0x%0.16x' % result)
	solver.add(z3.Implies(condition, (sym_r & mask) == result & mask))
	
	s1 ^= s0
	sym_s0 = z3.RotateLeft(s0, 55) ^ s1 ^ (s1 << 14)
	sym_s1 = z3.RotateLeft(s1, 36)
	
	return sym_s0, sym_s1, condition


def find_seed(results_with_masks):
	start_s0, start_s1 = z3.BitVecs('start_s0 start_s1', 64)
	sym_s0 = start_s0
	sym_s1 = start_s1
	solver = z3.Solver()
	conditions = []
	
	for result, mask in results_with_masks:
		sym_s0, sym_s1, condition = sym_xoroshiro128plus(solver, sym_s0, sym_s1, mask, result)
		conditions.append(condition)
	
	if solver.check(conditions) == z3.sat:
		model = solver.model()
		
		return (model[start_s0].as_long(), model[start_s1].as_long())
	
	else:
		return None


find_seed([(0x0, 0x0), (0x206e6172614b2020, 0xffffffffffffffff), (0x2020736e6f794c, 0xffffffffffffff)])
# Output: (12030599390342465081, 1719051842901885642)8
