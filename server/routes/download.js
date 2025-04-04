import express from "express";
import path from "path";
const __dirname = "";
const router = express.Router();
router.post("/download", async (req, res) => {
  const filename = req.body["filename"];
  const filePath = path.resolve(__dirname, "uploads", filename);

  res.download(filePath, function (error) {
    if (error) {
      console.log(error);
      return res.status(404).send("File not found");
    }
  });
});

export default router;
