<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--- Google Font --->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet">
    <!------------------->
    <link rel="stylesheet" href="style.css">
    <title>TXT Podpis</title>
</head>
<body>
    <div class="info-cont">
        <h1>Podpis TXT souboru</h1>
        <div class="text-choose">
            <p>Vyber TXT soubor</p>
            <input type="file" name="txt" id="txtInput" accept=".txt">
        </div>
        <div class="text-show">
            <p>Obsah dokumentu</p>
            <textarea name="text-show" id="textShow"></textarea>
        </div>
        <div class="cert-keys">
            <p>Certipikační klíč</p>
            <select name="cert-key" id="certKey">
                <option value="111000222333444555666777888999AAABBB">Matěj Hajný</option>
                <option value="AAABBB999888777666555444333222111000">Petr Kozák</option>
            </select>
        </div>

        <button type="submit">Podepsat</button>

        <!--- PHP Section --->

        <?php   

        ?>

        <script src="script.js"></script>
    </div>
</body>
</html>