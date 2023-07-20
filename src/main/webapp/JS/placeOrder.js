if (document.readyState == 'loading') {
    document.addEventListener('DOMContentLoaded', ready)
} else {
    ready()
}

function ready() {
    var removeCartItemButtons = document.getElementsByClassName('btn-danger')
    for (var i = 0; i < removeCartItemButtons.length; i++) {
        var button = removeCartItemButtons[i]
        button.addEventListener('click', removeCartItem)
    }

    var quantityInputs = document.getElementsByClassName('cart-quantity-input')
    for (var i = 0; i < quantityInputs.length; i++) {
        var input = quantityInputs[i]
        input.addEventListener('change', quantityChanged)
    }

    var addToCartButtons = document.getElementsByClassName('shop-item-button')
    for (var i = 0; i < addToCartButtons.length; i++) {
        var button = addToCartButtons[i]
        button.addEventListener('click', addToCartClicked)
    }

    document.getElementsById('formSubmit')[0].addEventListener('onsubmit', purchaseClicked)
}

function purchaseClicked() {
    var cartItemContainer = document.getElementsByClassName('cart-items')[0]
    var cartRows = cartItemContainer.getElementsByClassName('cart-row')
    if (cartRows.length == 0) {
        alert('No Items in your washing bucket')
        return false
    } else {
        return true
    }
}

function removeCartItem(event) {
    var buttonClicked = event.target
    buttonClicked.parentElement.parentElement.parentElement.parentElement.remove()
    updateCartTotal()
}

function quantityChanged(event) {
    var input = event.target
    if (isNaN(input.value) || input.value <= 0) {
        input.value = 1
    }
    updateCartTotal()
}

function addToCartClicked(event) {
    var button = event.target
    var shopItem = button.parentElement.parentElement
    var title = shopItem.getElementsByClassName('shop-item-title')[0].innerText
    var price = shopItem.getElementsByClassName('shop-item-price')[0].innerText
    var imageSrc = shopItem.getElementsByClassName('shop-item-image')[0].src
    var serId = shopItem.getElementsByClassName('shop-item-id')[0].innerText
    addItemToCart(title, price, imageSrc, serId)
    updateCartTotal()
}

function addItemToCart(title, price, imageSrc, serId) {
    var cartRow = document.createElement('div')
    cartRow.classList.add('cart-row')
    var cartItems = document.getElementsByClassName('cart-items')[0]
    var cartItemNames = cartItems.getElementsByClassName('cart-item-title')
    for (var i = 0; i < cartItemNames.length; i++) {
        if (cartItemNames[i].innerText == title) {
            alert('This item is already added to the bucket')
            return
        }
    }

    var cartRowContents = `<div class="cart-item">
        <table class="table  d-flex justify-content-center tableCart" id="tableMyBucket">
        <tr>
            <td><img src="${imageSrc}" class="cart-item-image" id="imgWashBucketTable"></td>
            <td><label id="serviceName" class="cart-item-title">${title}</label></td>
            <td>
                <p id="quantity"><input class="cart-quantity-input" type="number" value="1"></p>
            </td>
            <td>
                <input class="cart-price" id="unitPrice" value="${price}" readonly>
            </td>
            <td style="min-width: 150px !important; max-width: 150px !important;">
                <input class="inputBoxNo" id="total" value="" readonly>
            </td>
            <td><button class="btn btn-small btn-danger"><i class="fas fa-trash-alt"></i></button></td>
        </tr>
        </table>
    </div>`

        cartRow.innerHTML = cartRowContents
        cartItems.append(cartRow)
        cartRow.getElementsByClassName('btn-danger')[0].addEventListener('click', removeCartItem)
        cartRow.getElementsByClassName('cart-quantity-input')[0].addEventListener('change', quantityChanged)
        cartRow.getElementsByClassName('cart-quantity-input')[0].name = serId
}

function updateCartTotal() {
	var cartItemContainer = document.getElementsByClassName('cart-items')[0]
	var cartRows = cartItemContainer.getElementsByClassName('cart-row')
	var total = 0
	if (cartRows.length == 0) {
		total = 0.00
    document.getElementsByClassName('cart-total-price')[0].value = total
	} else {
    for (var i = 0; i < cartRows.length; i++) {
        var cartRow = cartRows[i]
        var quantityElement = cartRow.getElementsByClassName('cart-quantity-input')[0]
        var priceElement = cartRow.getElementsByClassName('cart-price')[0]
        try {
            var price = priceElement.value
            var quantity = quantityElement.value
            var itemTotal = price * quantity
            total = total + (price * quantity)
            document.getElementsByClassName('inputBoxNo')[i].value = itemTotal
        } catch (err) {

        }
    }
    total = Math.round(total * 100) / 100
    document.getElementsByClassName('cart-total-price')[0].value = total
}
    }

s