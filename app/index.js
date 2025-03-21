const express = require('express');
const app = express();
const port = 3000;

app.get('/', (_req, res) => {
  res.send('🚀 Hello from the CI/CD app!');
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
