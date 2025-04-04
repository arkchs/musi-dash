// server/server.js
import dotenv from 'dotenv';
dotenv.config();
import express from 'express';
import connectMongoDB from './db.js';
import authRoutes from './routes/auth.js';
import songDownloadRoute from './routes/download.js';

import jwt from 'jsonwebtoken';
import cors from 'cors';    
const app = express();

// Connect Database
connectMongoDB();

// Load environment variables

const SECRET_KEY = process.env.SECRET_KEY;
// Init Middleware
app.use(express.json());
app.use(cors());



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
app.use('/api/songs', songDownloadRoute);

const PORT = process.env.PORT || 5000;
app.listen(PORT, "0.0.0.0",  () => console.log(`Server started on port ${PORT}`));