public type CartItem record {
    string item;
    int quantity;
};

public type Item record {
    string orderId;
    string item;
    int quantity;
    int netAmount;
};

public type OrderSummary record {
    string orderId;
    CartItem[] items;
    int totalAmount;
};

public type Items record {
    string orderId;
    Item[] items;
};

public type Description record {
    int id;
    string description;
};

public type FruitPrice record {
    int mango;
    int apple;
    int apricot;
    int avocado;
    int banana;
    int cherry;
    int melon;
    int papaya;
};
