function add_to_cart(pid, pname, price) {
	let cart = localStorage.getItem("cart");
	if (cart == null) {
		let products = [];
		let product = { productId: pid, productName: pname, productPrice: price,  productQuantiy: 1 };
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		console.log(products);
	} else {
		let products = JSON.parse(cart)
		let oldProduct = products.find((item) => item.productId == pid)
		if (oldProduct) {
			// we have increate the quantity
            oldProduct.productQuantiy += 1;
            products.map((item)=>{
				if(item.productId == oldProduct.productId){
					item.productQuantiy = oldProduct.productQuantiy;
				}
			})
			localStorage.setItem("cart", JSON.stringify(products));
			console.log(products);
		} else {
			// we have add the product
			let product = { productId: pid, productName: pname, productPrice: price, productQuantiy: 1 };
			products.push(product);
			localStorage.setItem("cart", JSON.stringify(products));
			console.log(products);
		}
	}
	alert("Product is added in cart....!!!");
}