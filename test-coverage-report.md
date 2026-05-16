# Звіт щодо покриття тестами застосунку mywebapp

## Для тестування використано:

- **Jest** — unit/integration tests
- **Supertest** — HTTP API тестування

### Перевірені endpoints:

- `GET /health/alive`
- `GET /health/ready`
- `GET /`
- `GET /tasks`
- `POST /tasks`
- `POST /tasks/:id/done`

---

## Покриття коду

- Інструмент: Jest Coverage
- Мінімальна вимога: **≥ 40%**

Запуск:

```bash
npm test -- --coverage
```

Результат команди:
PASS tests/mywebapp.test.js
MyWebApp API
✓ GET /health/alive should return 200 (9 ms)
✓ GET /health/ready should return 200 (1 ms)
✓ GET / should return HTML (1 ms)
✓ GET /tasks should return 200
✓ POST /tasks should create task (6 ms)
✓ POST /tasks/:id/done should mark task done

--------------------------|---------|----------|---------|---------|-------------------
File | % Stmts | % Branch | % Funcs | % Lines | Uncovered Line #s
--------------------------|---------|----------|---------|---------|-------------------
All files | 76.62 | 42.85 | 70 | 78.87 |  
 mywebapp | 93.33 | 50 | 100 | 93.33 |  
 app.js | 93.33 | 50 | 100 | 93.33 | 15  
 mywebapp/controllers | 72.97 | 40 | 100 | 73.52 |  
 healthController.js | 87.5 | 100 | 100 | 85.71 | 10  
 taskController.js | 68.96 | 40 | 100 | 70.37 | 13,17,31,35,51-56
mywebapp/routes | 100 | 100 | 100 | 100 |  
 healthRoutes.js | 100 | 100 | 100 | 100 |  
 taskRouter.js | 100 | 100 | 100 | 100 |  
 mywebapp/views/templates | 41.66 | 100 | 25 | 44.44 |  
 root.js | 100 | 100 | 100 | 100 |  
 tasks.js | 30 | 100 | 0 | 37.5 | 2-32  
--------------------------|---------|----------|---------|---------|-------------------
Test Suites: 1 passed, 1 total
Tests: 6 passed, 6 total
Snapshots: 0 total
Time: 0.202 s, estimated 1 s
Ran all test suites.
