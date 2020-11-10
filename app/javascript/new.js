function taxPrice() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const taxPrice = document.getElementById("add-tax-price");
    taxPrice.innerHTML = Math.floor(inputValue * 0.1);
    const profitPrice = document.getElementById("profit");
    profitPrice.innerHTML = Math.floor(inputValue * 0.9);
  });
};

window.addEventListener('load', taxPrice)