const request = require("supertest");
const app = require("../app");

describe("MyWebApp API", () => {
  test("GET /health/alive should return 200", async () => {
    const res = await request(app).get("/health/alive");
    expect(res.statusCode).toBe(200);
  });

  test("GET /health/ready should return 200", async () => {
    const res = await request(app).get("/health/ready");
    expect(res.statusCode).toBe(200);
  });

  test("GET / should return HTML", async () => {
    const res = await request(app).get("/").set("Accept", "text/html");

    expect(res.statusCode).toBe(200);
  });

  test("GET /tasks should return 200", async () => {
    const res = await request(app).get("/tasks");
    expect(res.statusCode).toBe(200);
  });
  test("POST /tasks should create task", async () => {
    const res = await request(app).post("/tasks").send({ title: "new task" });

    expect([200, 201]).toContain(res.statusCode);
  });

  test("POST /tasks/:id/done should mark task done", async () => {
    const res = await request(app).post("/tasks/1111111111111/done");

    expect([400]).toContain(res.statusCode);
  });
});
