const request = require("supertest");
const app = require("../app");

describe("MyWebApp API", () => {
  test("GET /health/alive should return 200", async () => {
    const res = await request(app).get("/health/alive");
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
});
