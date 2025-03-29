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
  const nextFood = await prisma.food.findFirst({ skip: nextSkip, take: 1 });
  response.json({
    page: page,
    foods: currentFoods,
    hasNextPage: nextFood != null,
  });
});

server.get('/pickup', async (_, response) => {
  const pickups = await prisma.pickup.findMany();
  console.log(pickups);
  response.json(pickups);
});

server.listen(3000, () => {
  console.log(`SimpleMediaReaderExample Mock Server is running...`);
});
