import string
from itertools import permutations

class Enigma:
    def __init__(self, rotors, reflector, plugboard=None):
        self.alphabet = string.ascii_uppercase
        self.rotors = rotors
        self.reflector = reflector
        self.plugboard = plugboard or {}
        self.rotor_positions = [0] * len(rotors)

    def set_rotor_positions(self, positions):
        self.rotor_positions = positions

    def encode_character(self, char):
        char = self.plugboard.get(char, char)
        for i, rotor in enumerate(self.rotors):
            offset = self.rotor_positions[i]
            char = rotor[(self.alphabet.index(char) + offset) % 26]
        char = self.reflector[self.alphabet.index(char)]
        for i, rotor in reversed(list(enumerate(self.rotors))):
            offset = self.rotor_positions[i]
            char = self.alphabet[(rotor.index(char) - offset) % 26]
        char = self.plugboard.get(char, char)
        self.rotate_rotors()
        return char

    def rotate_rotors(self):
        for i in range(len(self.rotors)):
            self.rotor_positions[i] = (self.rotor_positions[i] + 1) % 26
            if self.rotor_positions[i] != 0:
                break

    def encode_text(self, text):
        encoded_text = []
        for char in text.upper():
            if char in self.alphabet:
                encoded_text.append(self.encode_character(char))
            else:
                encoded_text.append(char)
        return ''.join(encoded_text)


# التروس (rotors) التي تم تحديدها في التحدي
rotors = [
    "AJDKSIRUXBLHWTMCQGZNPYFVOE",
    "BDFHJLCPRTXVZNYEIWGAKMUSQO", 
    "YRUHQSLDPXNGOKMIEBFZCWVJAT",  # أضفنا الترس الثالث
]

reflector = "YRUHQSLDPXNGOKMIEBFZCWVJAT"

# لوحة التوصيل (plugboard)
plugboard = {'A': 'Q', 'G': 'M', 'Q': 'A', 'M': 'G', 'T': 'B', 'B': 'T'}

# تعيين القيمة الأصلية للترتيب الأول للتروس
initial_rotor_positions = [5, 13, 21]

# تعريف جهاز إنجيما
enigma = Enigma(rotors, reflector, plugboard)

# تعيين الترتيب الأول للتروس
enigma.set_rotor_positions(initial_rotor_positions)

# اختبار جميع الترتيبات الممكنة للتروس
for perm in permutations([0, 1, 2]):
    enigma.set_rotor_positions(initial_rotor_positions)  # إعادة تعيين الترس
    current_rotor_order = [rotors[i] for i in perm]
    encoded_flag = enigma.encode_text("DIU{EKUATY_RIODK_ZNM_DZXJTG}")
    
    # طباعة جميع التراكيب
    print(f"Trying rotor order {list(perm)} gives: {encoded_flag}")
