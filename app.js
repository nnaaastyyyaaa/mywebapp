const express = require("express");
const tasksRouter = require("./routes/taskRouter");
const healthRoutes = require("./routes/healthRoutes");

const app = express();
app.use(express.json());

app.use("/api", tasksRouter);
app.use("/health", healthRoutes);
module.exports = app;
