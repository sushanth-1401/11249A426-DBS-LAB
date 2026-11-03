import math

def rail_fence_encrypt(text, rails):
    fence = [[] for _ in range(rails)]
    rail, direction = 0, 1
    for ch in text:
        fence[rail].append(ch)
        if rail == 0:
            direction = 1
        elif rail == rails - 1:
            direction = -1
        rail += direction
    return ''.join(''.join(r) for r in fence)

def rail_fence_decrypt(cipher, rails, length=None):
    if length is None:
        length = len(cipher)
    pattern = []
    rail, direction = 0, 1
    for i in range(length):
        pattern.append(rail)
        if rail == 0:
            direction = 1
        elif rail == rails - 1:
            direction = -1
        rail += direction
    indices = sorted(range(length), key=lambda x: (pattern[x], x))
    result = [""] * length
    for pos, idx in zip(indices, cipher):
        result[pos] = idx
    return ''.join(result)

def col_transposition_encrypt(text, key):
    text = text.replace(" ", "").upper()
    cols = len(key)
    rows = math.ceil(len(text) / cols)
    text = text.ljust(rows * cols, 'X')
    order = sorted(range(cols), key=lambda x: key[x])
    grid = [list(text[r*cols:(r+1)*cols]) for r in range(rows)]
    return ''.join(''.join(grid[r][c] for r in range(rows)) for c in order)

def col_transposition_decrypt(cipher, key):
    cols = len(key)
    rows = len(cipher) // cols
    order = sorted(range(cols), key=lambda x: key[x])
    grid = [[""] * cols for _ in range(rows)]
    idx = 0
    for c in order:
        for r in range(rows):
            grid[r][c] = cipher[idx]
            idx += 1
    return ''.join(''.join(row) for row in grid)

if __name__ == "__main__":
    text = "WEAREDISCOVEREDFLEEATONCE"
    rails = 3
    cipher = rail_fence_encrypt(text, rails)
    print(f"Plaintext  : {text}")
    print(f"Rails      : {rails}")
    print(f"Ciphertext : {cipher}")
    print(f"Decrypted  : {rail_fence_decrypt(cipher, rails)}")

    text2 = "ATTACKPOSTPONEDUNTILTWOAM"
    key = "ZEBRAS"
    cipher2 = col_transposition_encrypt(text2, key)
    print(f"\nRow-Column Transposition:")
    print(f"Plaintext  : {text2}")
    print(f"Key        : {key}")
    print(f"Ciphertext : {cipher2}")
    print(f"Decrypted  : {col_transposition_decrypt(cipher2, key)}")
