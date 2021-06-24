const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    // [memo] デフォルトの送信処理を停止→jsより先に処理されてしまうから
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    // [memo] formResultは、ただのDOMの要素
    // [memo] jsで取り扱えるフォームの形にするために、FormDataオブジェクトにする
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buyer_order[number]"),
      cvc: formData.get("buyer_order[cvc]"),
      exp_month: formData.get("buyer_order[exp_month]"),
      exp_year: `20${formData.get("buyer_order[exp_year]")}`,
    };

    // [memo] カード情報送信とトークン取得
    // [memo] Payjp.createToken("カードの情報", "取得した後の処理")
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        // [memo] フォームにトークン情報を挿入
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      // [memo] フォームに存在するクレジットカードの各情報を削除
      // [memo] この記述がないと、カード情報も送られてしまう
      // [memo] 属性値ごと消す
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      // [memo] フォームの情報をサーバーサイドに送信
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);