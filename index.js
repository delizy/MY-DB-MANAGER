const express = require('express');
const { Pool } = require('pg'); // بەکارهێنانی کتێبخانەی pg بۆ پەیوەندی داتابەیس
const app = express();
const port = process.env.PORT || 3000;

// دروستکردنی پەیوەندی لەگەڵ Neon بە بەکارهێنانی DATABASE_URL کە لە ڤێرسێل داماننابوو
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

app.get('/', (req, res) => {
  res.send('Server is running! Try /test-db to see data.');
});

// فەرمانێک بۆ تاقیکردنەوەی داتابەیس
app.get('/test-db', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW()'); // ئەمە کاتی ئێستای داتابەیسەکەمان پێ دەڵێت
    res.json({
      message: "Connected Successfully!",
      database_time: result.rows[0]
    });
  } catch (err) {
    console.error(err);
    res.status(500).send("Error connecting to database: " + err.message);
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
