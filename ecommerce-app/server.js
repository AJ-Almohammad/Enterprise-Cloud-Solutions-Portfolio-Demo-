const express = require('express');
const app = express();
const PORT = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.json({
    message: 'E-commerce Demo - CloudMigrate Pro Portfolio',
    environment: 'GCP Cloud Run',
    timestamp: new Date().toISOString(),
    version: '1.0.0',
    architect: 'AJ Almohammad'
  });
});

app.get('/health', (req, res) => {
  res.json({ 
    status: 'healthy', 
    uptime: process.uptime()
  });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
