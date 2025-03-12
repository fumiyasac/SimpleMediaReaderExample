import express from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
const server = express();

server.use(express.json());
server.use(express.urlencoded({ extended: true }));

server.get('/food', async (request, response) => {
  const page = parseInt(request.url.split("?page=")[1]) || 1;
  const take = 10;
  const currentSkip = (page - 1) * take;
  const nextSkip = page * take;
  const currentFoods = await prisma.food.findMany({ skip: currentSkip, take: take });
  const nextFood = await prisma.food.findMany({ skip: nextSkip, take: 1 });
  response.json({
    page: page,
    foods: currentFoods,
    hasNextPage: nextFood.length > 0,
  });
});

server.get('/pickup', async (_, response) => {
  const pickup = await prisma.food.findMany();
  response.json(pickup);
});

server.listen(3000, () => {
  console.log(`SimpleMediaReaderExample Mock Server is running...`);
});
