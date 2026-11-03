def create_playfair_matrix(key):
    key = key.upper().replace("J", "I")
    seen, matrix = set(), []
    for ch in key + "ABCDEFGHIKLMNOPQRSTUVWXYZ":
        if ch not in seen and ch.isalpha():
            seen.add(ch)
            matrix.append(ch)
    return [matrix[i*5:(i+1)*5] for i in range(5)]

def find_pos(matrix, ch):
    for r in range(5):
        for c in range(5):
            if matrix[r][c] == ch:
                return (r, c)

def prepare_text(text):
    text = text.upper().replace("J", "I").replace(" ", "")
    result, i = "", 0
    while i < len(text):
        a = text[i]
        b = text[i+1] if i+1 < len(text) else "X"
        if a == b:
            b = "X"
            i += 1
        else:
            i += 2
        result += a + b
    return result if len(result) % 2 == 0 else result + "X"

def playfair_encrypt(plaintext, key):
    matrix = create_playfair_matrix(key)
    text = prepare_text(plaintext)
    cipher = ""
    for i in range(0, len(text), 2):
        r1, c1 = find_pos(matrix, text[i])
        r2, c2 = find_pos(matrix, text[i+1])
        if r1 == r2:
            cipher += matrix[r1][(c1+1)%5] + matrix[r2][(c2+1)%5]
        elif c1 == c2:
            cipher += matrix[(r1+1)%5][c1] + matrix[(r2+1)%5][c2]
        else:
            cipher += matrix[r1][c2] + matrix[r2][c1]
    return cipher

def playfair_decrypt(ciphertext, key):
    matrix = create_playfair_matrix(key)
    plain = ""
    for i in range(0, len(ciphertext), 2):
        r1, c1 = find_pos(matrix, ciphertext[i])
        r2, c2 = find_pos(matrix, ciphertext[i+1])
        if r1 == r2:
            plain += matrix[r1][(c1-1)%5] + matrix[r2][(c2-1)%5]
        elif c1 == c2:
            plain += matrix[(r1-1)%5][c1] + matrix[(r2-1)%5][c2]
        else:
            plain += matrix[r1][c2] + matrix[r2][c1]
    return plain

if __name__ == "__main__":
    key = "MONARCHY"
    plaintext = "INSTRUMENTS"
    cipher = playfair_encrypt(plaintext, key)
    print(f"Plaintext  : {plaintext}")
    print(f"Key        : {key}")
    print(f"Ciphertext : {cipher}")
    print(f"Decrypted  : {playfair_decrypt(cipher, key)}")
