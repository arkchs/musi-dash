// server/routes/auth.js
<<<<<<< HEAD
import express from "express";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import User from "../models/user.js";
=======
import express from 'express';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import User from '../models/user.js';
>>>>>>> 8da795ef0280e4bf686fa048fc68b410a3f10c31

const router = express.Router();
dotenv.config();
const SECRET_KEY = process.env.SECRET_KEY;
// Register
router.post("/register", async (req, res) => {
  const { username, password } = req.body;

  try {
    let user = await User.findOne({ username });
    if (user) {
      return res.status(400).json({ msg: "User already exists" });
    }

    user = new User({ username, password });

    const salt = await bcrypt.genSalt(10);
    const temp = await bcrypt.hash(password, salt);
    console.log(temp);
    user.password = temp;
    await user.save();
    
    const payload = { user: { id: user.id } };
<<<<<<< HEAD
    jwt.sign(payload, "secret", { expiresIn: 3600 }, (err, token) => {
=======
    jwt.sign(payload, SECRET_KEY, { expiresIn: 3600 }, (err, token) => {
>>>>>>> 8da795ef0280e4bf686fa048fc68b410a3f10c31
      if (err) throw err;
      res.json({ token });
    });
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

// Login
router.post("/login", async (req, res) => {
  const { username, password } = req.body;

  try {
    console.log('starting out the login...');
    let user = await User.findOne({ username });
    console.log(user);
    if (!user) {
<<<<<<< HEAD
      return res.status(400).json({ msg: "Invalid credentials" });
=======
      console.log('Entering the login error check...');
      return res.status(400).json({ msg: 'User doesn\'t exist' });
>>>>>>> 8da795ef0280e4bf686fa048fc68b410a3f10c31
    }
    
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
<<<<<<< HEAD
      return res.status(400).json({ msg: "Invalid credentials" });
=======
      return res.status(400).json({ msg: 'Incorrect Password' });
>>>>>>> 8da795ef0280e4bf686fa048fc68b410a3f10c31
    }

    const payload = { user: { id: user.id } };
    jwt.sign(payload, "secret", { expiresIn: 3600 }, (err, token) => {
      if (err) throw err;
      res.json({ token });
    });
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
});

export default router;
