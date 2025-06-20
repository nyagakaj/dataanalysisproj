import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { Pool } from 'pg';

dotenv.config();
const app = express();
app.use(cors({ origin: 'http://localhost:3000' }));
app.use(express.json());

const pool = new Pool({ connectionString: process.env.DB_URL });

app.get('/api/countries', async (_, res) => {
  const { rows } = await pool.query('SELECT * FROM country');
  res.json(rows);
});

const port = process.env.PORT || 4000;
app.listen(port, () => console.log(`Backend running on ${port}`));
