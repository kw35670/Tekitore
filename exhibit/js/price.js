const price = document.getElementById('textPrice');
const priceLimit = 1000000;

price.addEventListener('change', function () {
    const errorMsg = document.getElementById('errorMsg');
    const textPriceWrap = document.getElementById('textPriceWrap');
    const profit = document.getElementById('profit');
    if(price.value > priceLimit) {
        errorMsg.textContent = '販売価格は1,000,000円以下で設定してください';
        price.value = '';
        profit.textContent = '販売利益：';
    } else {
        errorMsg.textContent = '';
    }
    profit.textContent = '販売利益：¥' + price.value;
})