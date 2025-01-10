import mongoose from 'mongoose';

const connectDB = async () => {
  try {
<<<<<<< HEAD
    await mongoose.connect('mongodb://127.0.0.1:27017/musi-dash-1', {
=======
    await mongoose.connect('mongodb://127.0.0.1:27017/musi', {
>>>>>>> 8da795ef0280e4bf686fa048fc68b410a3f10c31
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log('MongoDB connected');
  } catch (err) {
    console.error(err.message);
    process.exit(1);
  }
};

export default connectDB;