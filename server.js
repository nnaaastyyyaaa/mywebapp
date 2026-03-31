const dotenv = require("dotenv");
dotenv.config({ path: "/etc/mywebapp/.env" });

const http = require("http");

const app = require("./app");

const server = http.createServer(app);

server.listen({ fd: 3 });
