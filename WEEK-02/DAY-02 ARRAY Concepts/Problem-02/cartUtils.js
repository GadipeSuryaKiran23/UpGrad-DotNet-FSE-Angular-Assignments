// cartUtils.js

// Arrow function to calculate total cart value
export const calculateCartTotal = (products) =>
{
    // Use map() to calculate total price of each product
    const itemTotals = products.map(
        product => product.price * product.quantity
    );

    // Use reduce() to calculate grand total
    const cartTotal = itemTotals.reduce(
        (sum, value) => sum + value,
        0
    );

    return cartTotal;
};