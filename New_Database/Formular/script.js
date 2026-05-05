document.getElementById('txtInput').addEventListener('change', function(e) {
    let file = e.target.files[0];
    if(!file) return;

    const reader = new FileReader();
    reader.onload = function(e){
        document.getElementById("textShow").value = e.target.result;
    };
    reader.readAsText(file, 'UTF-8');
});