def bin2chr(data):
	result = ''
	
	while data:
		char = data & 0xff
		result += chr(char)
		data >>= 8
	
	return result


class Xoroshiro128Plus(object):
	def __init__(self, seed):
		self.seed = seed
	
	@staticmethod
	def rotl(x, k):
		return ((x << k) & 0xffffffffffffffff) | (x >> 64 - k)
	
	def next(self):
		s0 = self.seed[0]
		s1 = self.seed[1]
		result = (s0 + s1) & 0xffffffffffffffff
		
		s1 ^= s0
		self.seed[0] = self.rotl(s0, 55) ^ s1 ^ ((s1 << 14) & 0xffffffffffffffff)
		self.seed[1] = self.rotl(s1, 36)
		
		return result


generator = Xoroshiro128Plus([0xb4581c52b5a611f1, 0x849afd73bea7cce9])
print(repr(''.join(bin2chr(generator.next()) for i in range(4))))
# Output: 'ÚÞMtÆ\x19ó8  Karan Lyons  3A?â\x11)ÐÑ{'
