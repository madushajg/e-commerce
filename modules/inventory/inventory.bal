import ballerina/log;
import shop.commons as x;

x:FruitPrice f = {
    mango: 10,
    apple: 50,
    apricot: 5,
    avocado: 80,
    banana: 20,
    cherry: 15,
    melon: 12,
    papaya: 25
};

public function getPrice(string fruit) returns int {

    if (f.hasKey(fruit)) {
        log:printDebug(string `${fruit} is available`);
        return <int >f.get(fruit);
    }
    return 0;
}
