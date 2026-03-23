// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: 1,
    product_name: "Laptop",
    category: "Electronics",
    price: 55000,
    brand: "HP",
    specs: {
      warranty: "1 year",
      voltage: "220V"
    },
    features: ["8GB RAM", "512GB SSD"]
  },
  {
    _id: 2,
    product_name: "T-Shirt",
    category: "Clothing",
    price: 999,
    brand: "Puma",
    details: {
      size: ["M", "L", "XL"],
      color: "Black",
      material: "Cotton"
    }
  },
  {
    _id: 3,
    product_name: "Milk",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-20"),
    nutrition: {
      protein: "3g",
      fat: "4g"
    },
    items: ["Milk", "Vitamins"]
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { product_name: "Laptop" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });




