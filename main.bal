import ballerina/log;
import ballerina/random;
import shop.ordermgt as o;
import shop.commons as x;

public function main() returns error? {
    string[] orderIds = [];

    foreach int i in 0...3 {
        string orderId = check placeOrder();
        orderIds.push(orderId);
        log:printInfo("Placed the order", orderId = orderId);
    }

    log:printInfo("====================================");
    
    x:OrderSummary ods = getOrderDetails(orderIds[2]);
    log:printInfo("Fetched the order details", 'order = ods);

}

function placeOrder() returns error|string {
    string[] fruits = ["apple", "apricot", "avocado", "banana", "cherry", "melon", "papaya"];
    int noOfItems = check random:createIntInRange(0, 6);

    x:CartItem[] cartItems = [];

    foreach int i in 0...noOfItems {
        int itemIndex = check random:createIntInRange(0, noOfItems);
        int quantity = check random:createIntInRange(0, 20);
        string item = fruits[itemIndex];
        x:CartItem ci = {
            item: item,
            quantity: quantity
        };
        cartItems.push(ci);
    }

    return o:placeOrder(cartItems);
}

function getOrderDetails(string orderId) returns x:OrderSummary {
    x:Items items = <x:Items> o:getOrder(orderId);

    x:OrderSummary ods = {
        totalAmount: 0,
        orderId: "",
        items: [{item: "",quantity: 0}]
    };
    ods.orderId = items.orderId;

    int total = 0;
    x:CartItem[] ci = [];

    foreach x:Item item in items.items {
        ci.push({
            item: item.item,
            quantity: item.quantity
        });
        total += item.netAmount; 
    }

    ods.items = ci;
    ods.totalAmount = total;

    return ods;    
}