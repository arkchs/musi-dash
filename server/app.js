// server/server.js
import express from 'express';
import connectDB from './db.js';
import authRoutes from './routes/auth.js';
import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';
const app = express();

// Connect Database
connectDB();

// Load environment variables
dotenv.config();
const SECRET_KEY = process.env.SECRET_KEY;
// Init Middleware
app.use(express.json());
const authenticateToken = (req, res, next) => {
    // console.log('Authenticating token...');
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];
    // console.log('Authenticating token...');
    if (!token) return res.status(401).json({ message: 'Token required' });
    // console.log('Authenticating token...');

    jwt.verify(token, SECRET_KEY, (err, user) => {
        if (err) return res.status(403).json({ message: 'Invalid token' });
        req.user = user; // Attach user info to request
        next();
    });
};

// Example of a protected route
app.get('/api/songs', authenticateToken, (req, res) => {
    res.json({ message: `Hello ${req.user.username}` });
});


// Define Routes
app.use('/api/auth', authRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server started on port ${PORT}`));