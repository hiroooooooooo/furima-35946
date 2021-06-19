window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  const priceTax = document.getElementById("add-tax-price");
  const priceProfit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    
    const inputValue = priceInput.value;
    console.log(inputValue);
    priceTax.innerHTML = Math.floor(inputValue * 0.1)
    priceProfit.innerHTML = Math.floor(inputValue * 0.9)
  });

});