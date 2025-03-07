Here’s a quick tutorial for performing cryptography tasks on **Kali Linux** and **Windows 10** using various tools commonly used for Capture The Flag (CTF) challenges:

### **1. Basic Ciphers (Caesar, ROT13, Vigenère)**

#### **On Kali Linux:**
1. **Caesar Cipher**:
   - Install `crypt` utility:
     ```bash
     sudo apt-get install crypt
     ```
   - Encrypt a text with Caesar Cipher:
     ```bash
     echo "YourMessage" | caesar 3
     ```
   - Decrypt it:
     ```bash
     echo "EncryptedText" | caesar -3
     ```

2. **ROT13**:
   - Use the built-in `tr` command to shift letters by 13:
     ```bash
     echo "YourMessage" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
     ```

3. **Vigenère Cipher**:
   - Install `vigenere` tool:
     ```bash
     sudo apt-get install vigenere
     ```
   - Encrypt a text with a key:
     ```bash
     vigenere -e "key" "YourMessage"
     ```

#### **On Windows 10:**
1. **Caesar Cipher**: 
   - You can use an online tool or write a small Python script.
   ```python
   def caesar_cipher(text, shift):
       result = ""
       for char in text:
           if char.isalpha():
               shift_base = 65 if char.isupper() else 97
               result += chr((ord(char) - shift_base + shift) % 26 + shift_base)
           else:
               result += char
       return result
   print(caesar_cipher("YourMessage", 3))
   ```

2. **ROT13**:
   - Use PowerShell to perform ROT13:
     ```powershell
     $input = "YourMessage"
     $rot13 = [string]::Join('', ($input.ToCharArray() | ForEach-Object { [char]([int][char]$_ + 13) }))
     $rot13
     ```

3. **Vigenère Cipher**:
   - You can use an online tool or implement it in Python as follows:
   ```python
   def vigenere_cipher(text, key):
       result = ""
       key = [ord(c) for c in key]
       key_len = len(key)
       for i, char in enumerate(text):
           shift = key[i % key_len]
           if char.isalpha():
               shift_base = 65 if char.isupper() else 97
               result += chr((ord(char) - shift_base + shift) % 26 + shift_base)
           else:
               result += char
       return result
   print(vigenere_cipher("YourMessage", "key"))
   ```

---

### **2. Modern Encryption (AES, RSA, DES)**

#### **On Kali Linux:**
1. **AES** (with `openssl`):
   - Encrypt a file:
     ```bash
     openssl enc -aes-256-cbc -salt -in plaintext.txt -out encrypted.txt
     ```
   - Decrypt a file:
     ```bash
     openssl enc -aes-256-cbc -d -in encrypted.txt -out decrypted.txt
     ```

2. **RSA**:
   - Generate RSA keys:
     ```bash
     openssl genpkey -algorithm RSA -out private_key.pem
     openssl rsa -pubout -in private_key.pem -out public_key.pem
     ```
   - Encrypt a message:
     ```bash
     echo "YourMessage" | openssl rsautl -encrypt -inkey public_key.pem -pubin -out encrypted_message.bin
     ```
   - Decrypt a message:
     ```bash
     openssl rsautl -decrypt -inkey private_key.pem -in encrypted_message.bin
     ```

3. **DES**:
   - Encrypt a file using DES:
     ```bash
     openssl des -in plaintext.txt -out encrypted.txt
     ```

#### **On Windows 10:**
1. **AES** (with PowerShell):
   - Install `OpenSSL` for Windows or use Windows 10's built-in encryption tools for file handling.

2. **RSA**:
   - Use OpenSSL as in Kali Linux, or use PowerShell scripts for encryption/decryption.

3. **DES**:
   - PowerShell can be used similarly, or you can download the OpenSSL executable for Windows.

---

### **3. Hashing & Encoding (MD5, SHA1, SHA256, Base64, URL Encoding)**

#### **On Kali Linux:**
1. **MD5, SHA1, SHA256**:
   - To hash files or text:
     ```bash
     echo -n "YourMessage" | md5sum
     echo -n "YourMessage" | sha1sum
     echo -n "YourMessage" | sha256sum
     ```

2. **Base64**:
   - Encode:
     ```bash
     echo -n "YourMessage" | base64
     ```
   - Decode:
     ```bash
     echo -n "Base64EncodedString" | base64 --decode
     ```

3. **URL Encoding**:
   - Encode:
     ```bash
     echo -n "Your Message" | urlencode
     ```

#### **On Windows 10:**
1. **MD5, SHA1, SHA256**:
   - Use PowerShell:
     ```powershell
     Get-FileHash "path_to_file" -Algorithm MD5
     Get-FileHash "path_to_file" -Algorithm SHA1
     Get-FileHash "path_to_file" -Algorithm SHA256
     ```

2. **Base64**:
   - Encode:
     ```powershell
     [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes("YourMessage"))
     ```
   - Decode:
     ```powershell
     [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("Base64EncodedString"))
     ```

3. **URL Encoding**:
   - Use PowerShell:
     ```powershell
     [System.Web.HttpUtility]::UrlEncode("Your Message")
     ```

---

### **4. Cryptanalysis Tools**

#### **On Kali Linux:**
1. **John the Ripper**:
   - Install:
     ```bash
     sudo apt-get install john
     ```
   - Crack a hash:
     ```bash
     john --wordlist=/usr/share/wordlists/rockyou.txt hashfile.txt
     ```

2. **Hashcat**:
   - Install:
     ```bash
     sudo apt-get install hashcat
     ```
   - Crack a hash:
     ```bash
     hashcat -m 0 -a 0 hashfile.txt /usr/share/wordlists/rockyou.txt
     ```

3. **CyberChef**: Use it directly via the web interface:
   - Visit: https://gchq.github.io/CyberChef

#### **On Windows 10:**
1. **John the Ripper**:
   - Download from the official site, extract, and run similarly as in Kali.

2. **Hashcat**:
   - Download and run the same as in Kali Linux.

---

This tutorial provides the tools and techniques for cryptography on both Kali Linux and Windows 10.