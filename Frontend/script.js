document.getElementById('generateButton').addEventListener('click', function() {
    const numberInput = document.getElementById('numberInput');
    const container = document.getElementById('container');
    const quantity = parseInt(numberInput.value);

    if (!isNaN(quantity) && quantity > 0) {
        for (let i = 0; i < quantity; i++) {
            const square = document.createElement('div');
            square.className = 'square';
            square.addEventListener('click', function() {
                container.removeChild(square);
            });
            container.appendChild(square);
        }
    }
});
