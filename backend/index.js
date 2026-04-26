require("dotenv").config();
const jwt = require("jsonwebtoken");
const express = require("express");
const { PrismaClient } = require("@prisma/client");

const app = express();
const prisma = new PrismaClient();

// middleware
app.use(express.json());

app.get("/", (req, res) => {
  res.send("Backend jalan 🔥");
});

// LOGIN
app.post("/login", async (req, res) => {
  const { email, password } = req.body;

  const user = await prisma.user.findUnique({
    where: { email },
  });

  if (!user || user.password !== password) {
    return res.status(401).json({
      message: "Login gagal ❌",
    });
  }

  // 🔥 BUAT TOKEN
  const token = jwt.sign(
    { id: user.id, email: user.email },
    process.env.JWT_SECRET,
    { expiresIn: "1d" }
  );

  res.json({
    message: "Login berhasil 🔥",
    token: token,
  });
});

// server
app.listen(3000, () => {
  console.log("Server jalan di http://localhost:3000");
});