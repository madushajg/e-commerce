import ballerina/uuid;
import ballerina/log;
import shop.commons as x;
import shop.inventory as i;

map<x:Items> items = {};

public function getOrder(string orderId) returns x:Items? {
    return items[orderId];
}

public function placeOrder(x:CartItem[] cart) returns string {

    x:Item[] itemArray = []; 

    string orderId = uuid:createType1AsString();

    foreach x:CartItem c in cart {
      int unitPrice =  i:getPrice(c.item);
      int netAmount = unitPrice * c.quantity;
      itemArray.push({
        orderId: orderId,
        item: c.item,
        quantity: c.quantity,
        netAmount: netAmount
      });
    }

    items[orderId] = {
        orderId: orderId,
        items: itemArray
    };

    log:printInfo("OrderId created", orderId = orderId);
    return orderId;
}
