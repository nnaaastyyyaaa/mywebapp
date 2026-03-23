const dotenv = require("dotenv");
dotenv.config({ path: "./etc/mywebapp/.env" });

const app = require("./app");
const port = process.env.PORT || 5200;
const host = process.env.HOST || "127.0.0.1";

app.listen(port, host, () => {
  console.log(`Listening on  ${host}:${port}`);
});
