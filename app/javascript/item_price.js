window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const TAX = 0.1;
    const TaxFee = Math.floor(inputValue * TAX); 
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = TaxFee;
    const Profit = 0.9;
    const ProfitFee = Math.floor(inputValue * Profit);
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = ProfitFee;
  });
});