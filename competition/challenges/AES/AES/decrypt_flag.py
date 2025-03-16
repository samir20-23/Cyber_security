from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad
from Crypto.Util import Counter
import binascii

# Key and IV Variants (replace with your actual keys and IVs)
key1 = bytes.fromhex('8b306f8c21e864684c9f0fcbda92452922807b5c109cddcc71a1b0b36f49987c')
iv1 = bytes.fromhex('342a27cd61204baff7c57de80f30d60a31c45d597068441c2b95989b87a98a33')

# Your encrypted data (replace with actual encrypted data)
encrypted_first = bytes.fromhex('YOUR_ENCRYPTED_DATA')

try:
    # Decrypt
    cipher1 = AES.new(key1, AES.MODE_CBC, iv1)
    decrypted_first = unpad(cipher1.decrypt(encrypted_first), AES.block_size).decode()
    print(f"Decrypted text: {decrypted_first}")
except ValueError as e:
    print(f"Error: {e}")
