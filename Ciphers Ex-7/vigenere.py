def vigenere_encrypt(plaintext, key):
    plaintext = plaintext.upper()
    key = key.upper()
    result, k = "", 0
    for ch in plaintext:
        if ch.isalpha():
            shift = ord(key[k % len(key)]) - ord('A')
            result += chr((ord(ch) - ord('A') + shift) % 26 + ord('A'))
            k += 1
        else:
            result += ch
    return result

def vigenere_decrypt(ciphertext, key):
    ciphertext = ciphertext.upper()
    key = key.upper()
    result, k = "", 0
    for ch in ciphertext:
        if ch.isalpha():
            shift = ord(key[k % len(key)]) - ord('A')
            result += chr((ord(ch) - ord('A') - shift + 26) % 26 + ord('A'))
            k += 1
        else:
            result += ch
    return result

if __name__ == "__main__":
    plaintext = "ATTACK AT DAWN"
    key = "LEMON"
    cipher = vigenere_encrypt(plaintext, key)
    print(f"Plaintext  : {plaintext}")
    print(f"Key        : {key}")
    print(f"Ciphertext : {cipher}")
    print(f"Decrypted  : {vigenere_decrypt(cipher, key)}")
