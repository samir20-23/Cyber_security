 
 [🚩 course www.youtube.com/watch?v=C7vmouDOJYM ](https://www.youtube.com/watch?v=C7vmouDOJYM) 


Here are some **cryptography-related tools** you can use in **Kali Linux**:

### 1. **OpenSSL**
   - **Description**: A versatile tool for generating encryption keys, SSL/TLS certificates, and converting data between formats.
   - **Usage**:
     - To encrypt a file:  
       ```bash
       openssl enc -aes-256-cbc -salt -in file.txt -out file.enc
       ```
     - To generate an SSL certificate:  
       ```bash
       openssl req -x509 -newkey rsa:4096 -keyout private.key -out public.crt -days 365
       ```

### 2. **GnuPG (GPG)**
   - **Description**: An open-source tool for encrypting data and messages using **PGP**.
   - **Usage**:
     - To encrypt a file:  
       ```bash
       gpg -c file.txt
       ```
     - To decrypt a file:  
       ```bash
       gpg file.txt.gpg
       ```

### 3. **John the Ripper**
   - **Description**: A tool for cracking password hashes.
   - **Usage**:
     - To crack a password hash:  
       ```bash
       john --format=raw-md5 hash.txt
       ```

### 4. **Hashcat**
   - **Description**: A tool for cracking password hashes using **GPU/CPU** at high speed.
   - **Usage**:
     - To crack a hash using a wordlist:  
       ```bash
       hashcat -m 0 hash.txt wordlist.txt
       ```

### 5. **Steghide**
   - **Description**: A tool for hiding data in image or audio files using encryption.
   - **Usage**:
     - To extract hidden data:  
       ```bash
       steghide extract -sf image.jpg
       ```
     - To hide data in an image:  
       ```bash
       steghide embed -cf image.jpg -ef secret.txt
       ```

### 6. **Cryptsetup**
   - **Description**: A tool for encrypting disks using **LUKS**.
   - **Usage**:
     - To encrypt a disk:  
       ```bash
       cryptsetup luksFormat /dev/sda
       ```
     - To open an encrypted disk:  
       ```bash
       cryptsetup luksOpen /dev/sda my_encrypted_disk
       ```

### 7. **CyberChef**
   - **Description**: A tool for data analysis, encryption, and transformation, works through a web browser.
   - **Usage**:  
     You can use it for encoding, decoding, or hiding data.
   - [CyberChef Link](https://gchq.github.io/CyberChef/)

---

### **Additional Tools**:
1. **TrueCrypt / VeraCrypt**: For encrypting files and disks.
2. **Base64**: For encoding and decoding data in **Base64** format.

---

### **Summary**:
- **OpenSSL** and **GPG** for basic encryption.
- **John the Ripper** and **Hashcat** for password cracking.
- **Steghide** and **CyberChef** for data hiding and manipulation.
 