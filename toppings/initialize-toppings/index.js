const { MongoClient } = require("mongodb");
const { v4: uuidv4 } = require("uuid");
/* use the Cosmos DB connection string you copied ealier and replace in the `url` variable */
const url = "mongodb://espo-pizza:zKZqQcL2jLOQ9p4sBvS0mEg2z5NgMDjrjuXu6uUlVKCK61Cs7CqHA7kGhICIGt28pdQWNAH6kUe9ACDbvDNrwA==@espo-pizza.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@espo-pizza@";
const client = new MongoClient(url);

let resetList = [
  {
    _id: uuidv4(),
    name: "Pepperoni",
    description: "Golden slices of pepperoni",
    url:
      "https://cdn.pixabay.com/photo/2016/03/05/20/17/pizza-1238734_1280.jpg",
  },
  {
    _id: uuidv4(),
    name: "Olives",
    description: "Blend of Black and greek olives",
    url:
      "https://cdn.pixabay.com/photo/2016/11/29/13/02/cheese-1869708_960_720.jpg",
  },
  {
    _id: uuidv4(),
    name: "pineapple",
    description: "who doesnt love pineapple on their pizza",
    url:
      "https://cdn.pixabay.com/photo/2016/03/05/20/58/american-1238850_1280.jpg",
  },
];

module.exports = async function (context, req) {
  await client.connect();
  const database = client.db("crud");
  const collection = database.collection("toppings");
  await collection.deleteMany({});
  await collection.insertMany(resetList);

  return (context.res = {
    status: 200,
    body: "Initialization successful",
  });
};