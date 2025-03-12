import express from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
const server = express();

server.use(express.json());
server.use(express.urlencoded({ extended: true }));

server.get('/food', async (request, response) => {
  const page = parseInt(request.url.split("?page=")[1]);
  const take = 10;
  const skip = (page - 1) * take;
  const foods = await prisma.food.findMany({ skip: skip, take: take });
  response.json(foods);
});

server.get('/pickup', async (_, response) => {
  const pickup = await prisma.food.findMany();
  response.json(pickup);
});

server.listen(3000, () => {
  console.log(`SimpleMediaReaderExample Mock Server is running...`);
});
