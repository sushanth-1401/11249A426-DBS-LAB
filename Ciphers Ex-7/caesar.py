def caesar_encrypt(plaintext, key):
    result = ""
    for ch in plaintext.upper():
        if ch.isalpha():
            result += chr((ord(ch) - ord('A') + key) % 26 + ord('A'))
        else:
            result += ch
    return result

def caesar_decrypt(ciphertext, key):
    return caesar_encrypt(ciphertext, 26 - key)

if __name__ == "__main__":
    plaintext = "HELLO WORLD"
    key = 3
    cipher = caesar_encrypt(plaintext, key)
    plain = caesar_decrypt(cipher, key)
    print(f"Plaintext  : {plaintext}")
    print(f"Key        : {key}")
    print(f"Ciphertext : {cipher}")
    print(f"Decrypted  : {plain}")
