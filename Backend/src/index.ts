import express from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
const app = express();
app.use(express.json());
app.use(express.urlencoded({extended: true }));

app.get('/', async (req, res) => {
  const foods = await prisma.food.findMany();
  res.json(foods);
})

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});