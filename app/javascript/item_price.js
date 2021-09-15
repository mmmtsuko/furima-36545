
window.addEventListener('load', () =>{
  const itemPrice = document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price")
  const profitDom = document.getElementById("profit");
  itemPrice.addEventListener("input", () => {
       const inputValue = itemPrice.value;
       addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
       addTaxPrice = addTaxDom.innerHTML
       profitDom.innerHTML = Math.floor(inputValue - addTaxPrice);
       
  });
});

