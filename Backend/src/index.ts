import express from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
const server = express();

server.use(express.json());
server.use(express.urlencoded({extended: true }));

server.get('/', async (req, res) => {
  const foods = await prisma.food.findMany();
  res.json(foods);
})

server.listen(3000, () => {
  console.log(`SimpleMediaReaderExample Mock Server is running...`);
});