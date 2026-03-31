onst express = require('express');
const { Pool } = require('pg');
const app = express();

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: { rejectUnauthorized: false }
});

app.get('/', (req, res) => {
  res.send('Server is running! Try /test-db');
});

app.get('/test-db', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW()');
    res.json({ success: true, time: result.rows[0] });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});
const express = require('express');
const { Pool } = require('pg');
const app = express();
const port = process.env.PORT || 3000;

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: { rejectUnauthorized: false }
});

app.get('/', (req, res) => {
  res.send('Server is Live! Go to /tables to see all your tables.');
});

// ١. بینینی لیستی هەموو ئەو خشتانەی لە داتابەیسەکەدا هەن
app.get('/tables', async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT table_name 
      FROM information_schema.tables 
      WHERE table_schema = 'public'
    `);
    res.json({
      total_tables: result.rowCount,
      tables: result.rows.map(row => row.table_name)
    });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// ٢. فەرمانێکی گشتی بۆ بینینی داتای هەر خشتەیەک (بۆ نموونە /data/your_table_name)
app.get('/data/:tableName', async (req, res) => {
  const tableName = req.params.tableName;
  try {
    const result = await pool.query(`SELECT * FROM ${tableName} LIMIT 100`);
    res.json({
      table: tableName,
      count: result.rowCount,
      rows: result.rows
    });
  } catch (err) {
    res.status(500).json({ error: "خشتەکە نەدۆزرایەوە یان هەڵەیەک هەیە: " + err.message });
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
