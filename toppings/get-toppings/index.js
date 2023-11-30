const { MongoClient } = require("mongodb");

const { v4: uuidv4 } = require("uuid");

/* use the Cosmos DB connection string you copied ealier and replace in the `url` variable */
const url = "mongodb://espo-pizza:zKZqQcL2jLOQ9p4sBvS0mEg2z5NgMDjrjuXu6uUlVKCK61Cs7CqHA7kGhICIGt28pdQWNAH6kUe9ACDbvDNrwA==@espo-pizza.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@espo-pizza@";const client = new MongoClient(url);

module.exports = async function (context, req) {
  await client.connect();
  const database = client.db("crud");
  const collection = database.collection("toppings");
  let list = await collection.find({}).toArray();
  return context.res = {
    status: 200,
    body: list,
  };
};
