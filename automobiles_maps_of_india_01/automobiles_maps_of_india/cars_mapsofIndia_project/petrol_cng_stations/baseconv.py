# def divmod(num, base):
#     pass
#
#
# def len(alphabet):
#     pass
#
#
# def enumerate(string):
#     pass
#
#
# class BaseConverter:
#     def __init__(self, alphabet):
#         self.alphabet = alphabet
#         self.base = len(alphabet)
#
#     def encode(self, num):
#         if num == 0:
#             return self.alphabet[0]
#         arr = []
#         base = self.base
#         while num:
#             num, rem = divmod(num, base)
#             arr.append(self.alphabet[rem])
#         arr.reverse()
#         return ''.join(arr)
#
#     def decode(self, string):
#         base = self.base
#         strlen = len(string)
#         num = 0
#
#         for idx, char in enumerate(string):
#             power = (strlen - (idx + 1))
#             num += self.alphabet.index(char) * (base ** power)
#
#         return num
#
