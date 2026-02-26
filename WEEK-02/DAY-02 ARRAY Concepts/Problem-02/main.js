// main.js

import { calculateCartTotal } from "./cartUtils.js";

// Array of product objects
const cartProducts = [
    { name: "Laptop", price: 50000, quantity: 1 },
    { name: "Mouse", price: 500, quantity: 2 },
    { name: "Keyboard", price: 1500, quantity: 1 },
    { name: "USB Cable", price: 300, quantity: 3 }
];

// Display invoice
console.log("🧾 CART INVOICE");
console.log("---------------------------");

cartProducts.map(product =>
{
    console.log(
        `Product: ${product.name} | Price: ₹${product.price} | Qty: ${product.quantity}`
    );
});

// Calculate total
const totalAmount = calculateCartTotal(cartProducts);

console.log("---------------------------");
console.log(`Total Cart Value: ₹${totalAmount}`);