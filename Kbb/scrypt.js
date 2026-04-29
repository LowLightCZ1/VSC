const encryptedCode = "AEDA13579246CBFC";
function decryptRailFence(cipher, rails = 3) {
    const length = cipher.length;
    const rail = Array.from({ length: rails }, () => Array(length).fill('\n'));

    let dirDown = false;
    let row = 0;
    for (let i = 0; i < length; i++) {
        rail[row][i] = '*';
        if (row === 0 || row === rails - 1) dirDown = !dirDown;
        row += dirDown ? 1 : -1;
    }

    let index = 0;
    for (let i = 0; i < rails; i++) {
        for (let j = 0; j < length; j++) {
            if (rail[i][j] === '*' && index < cipher.length) {
                rail[i][j] = cipher[index++];
            }
        }
    }

    let result = '';
    row = 0;
    dirDown = false;
    for (let i = 0; i < length; i++) {
        result += rail[row][i];
        if (row === 0 || row === rails - 1) dirDown = !dirDown;
        row += dirDown ? 1 : -1;
    }

    return result;
}

console.log(decryptRailFence(encryptedCode, 3))
