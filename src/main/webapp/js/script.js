function add_to_cart(pid, pname, price) {
	let cart = localStorage.getItem("cart");
	if (cart == null) {
		let products = [];
		let product = { productId: pid, productName: pname, productPrice: price, productQuantity: 1 };
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		ShowToast('Item is added to card');
		//console.log(products);
	} else {
		let products = JSON.parse(cart)
		let oldProduct = products.find((item) => item.productId == pid)
		if (oldProduct) {
			// we have increate the quantity
			oldProduct.productQuantity += 1;
			products.map((item) => {
				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
				}
			})
			localStorage.setItem("cart", JSON.stringify(products));
			ShowToast(oldProduct.productName + 'Product quantity is increased Quantity : ' + oldProduct.productQuantity);
			//console.log(products);
		} else {
			// we have add the product
			let product = { productId: pid, productName: pname, productPrice: price, productQuantity: 1 };
			products.push(product);
			localStorage.setItem("cart", JSON.stringify(products));
			ShowToast(pname + ' Product is added');
			//console.log(products);
		}
	}
	updateCart();
	//alert("Product is added in cart....!!!");
}


// update cart

function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) {
		//console.log("Cart is empty....!!!");
		$(".cart-items").html("0");
		$(".cart-body").html("<h3>Cart Does Not Have Any Items...</h3>");
		$(".checkout-btn").attr("disabled", true);
		// or $(".checkout-btn").addClass("disabled");
	} else {
		$(".cart-items").html(`${cart.length}`);
		let table = `
		<table class='table'>
		  <thead class="thead-light">
		    <tr>
		      <th>Item Name</th>
		      <th>Item Price</th>
		      <th>Item Quantity</th>
		      <th>Total Price</th>
		      <th>Action</th>
		    </tr>
		  </thead>
		`;
		let totalPrice = 0;
		cart.map((item) => {
			table += `
			<tr>
			   <td>${item.productName}</td>
			   <td>${item.productPrice}</td>
			   <td>${item.productQuantity}</td>
			   <td>${item.productQuantity * item.productPrice}</td>
			   <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-outline-danger btn-sm'>Remove</button></td>
			</tr>
			`;
			totalPrice += item.productPrice * item.productQuantity;
		})
		table += `
		<tr><td colspan='4' class='text-right font-weight-bold'>Total Price : ${totalPrice}</td></tr>
		</table>`;
		$(".cart-body").html(table);
		$(".checkout-btn").attr("disabled", false);
		// or $(".checkout-btn").removeClass("disabled");
		//console.log(cart);
	}
}

function deleteItemFromCart(pid) {
	let cart = JSON.parse(localStorage.getItem("cart"));
	let newCart = cart.filter((item) => {
		return item.productId !== pid;
	})
	localStorage.setItem("cart", JSON.stringify(newCart));
	updateCart();
	ShowToast('Item is removed from cart');
}

$(document).ready(function() {
	updateCart();
})

// for toast ----------------------------------------------------------------------
function ShowToast(content) {
	$("#toast").addClass("display");
	$("#toast").html(content);

	setTimeout(() => {
		$("#toast").removeClass("display");
	}, 2000);
}
//------------check out ----------------------------------------------------------
function goToCheckOut() {
	window.location = "checkOut.jsp";
}









