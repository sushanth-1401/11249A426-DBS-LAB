import numpy as np

def mod_inverse(a, m):
    for i in range(1, m):
        if (a * i) % m == 1:
            return i
    return None

def matrix_mod_inverse(matrix, mod):
    det = int(round(np.linalg.det(matrix))) % mod
    det_inv = mod_inverse(det % mod, mod)
    adj = np.array([[matrix[1][1], -matrix[0][1]],
                    [-matrix[1][0], matrix[0][0]]])
    return (det_inv * adj % mod + mod) % mod

def hill_encrypt(plaintext, key_matrix):
    text = plaintext.upper().replace(" ", "")
    if len(text) % 2 != 0:
        text += "X"
    cipher = ""
    for i in range(0, len(text), 2):
        pair = np.array([[ord(text[i])-65], [ord(text[i+1])-65]])
        result = np.dot(key_matrix, pair) % 26
        cipher += chr(int(result[0][0])+65) + chr(int(result[1][0])+65)
    return cipher

def hill_decrypt(ciphertext, key_matrix):
    inv_key = matrix_mod_inverse(key_matrix, 26)
    return hill_encrypt(ciphertext, inv_key)

if __name__ == "__main__":
    key = np.array([[3, 3], [2, 5]])
    plaintext = "HELP"
    cipher = hill_encrypt(plaintext, key)
    decrypted = hill_decrypt(cipher, key)
    print(f"Plaintext  : {plaintext}")
    print(f"Key Matrix : {key.tolist()}")
    print(f"Ciphertext : {cipher}")
    print(f"Decrypted  : {decrypted}")
