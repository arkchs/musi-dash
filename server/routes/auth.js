// server/routes/auth.js
import express from 'express';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import User from '../models/user.js';
const router = express.Router();
// Register
router.post("/register", async (req, res) => {
  const { username, password, email } = req.body;
  
  // console.log('Registration attempt for username:', username);
  // console.log('Email:', email);

  try {
    let user = await User.findOne({ username: username });
    // console.log('Existing user check result:', user);
    
    if (user) {
      // console.log('User already exists in database');
      return res.status(400).json({ msg: "User already exists" });
    }

    user = new User({ username: username, password: password, email: email });
    // console.log('New user object created:', { username: user.username, email: user.email });

    const salt = await bcrypt.genSalt(10);
    const temp = await bcrypt.hash(password, salt);
    // console.log('Password hashed successfully');
    user.password = temp;
    
    await user.save();
    // console.log('User saved to database successfully');
    
    const payload = { user: { id: user.id } };
    jwt.sign(payload, process.env.SECRET_KEY, { expiresIn: 3600 }, (err, token) => {
      if (err) throw err;
      // console.log('JWT token generated successfully');
      res.json({ token });
    });
  } catch (err) {
    // console.error('Registration error:', err.message);
    res.status(500).send("Server error");
  }
});

// Login
router.post("/login", async (req, res) => {
  const { username, password } = req.body;
  
  console.log('Login attempt received:', { username, password: '***' });

  try {
    let user = await User.findOne({ username: username });
    console.log('User found:', user ? 'Yes' : 'No');
    
    if (!user) {
      return res.status(400).json({ msg: 'User doesn\'t exist' });
    }
    
    const isMatch = await bcrypt.compare(password, user.password);
    console.log('Password match:', isMatch);
    
    if (!isMatch) {
      return res.status(400).json({ msg: 'Incorrect Password' });
    }

    const payload = { user: { id: user.id } };
    jwt.sign(payload, process.env.SECRET_KEY, { expiresIn: 3600 }, (err, token) => {
      if (err) {
        console.error('JWT Error:', err);
        throw err;
      }
      res.json({ token });
    });
  } catch (err) {
    console.error('Login error:', err.message);
    res.status(500).send("Server error");
  }
});

export default router;
