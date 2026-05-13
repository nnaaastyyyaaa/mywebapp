jest.mock("../prisma/prismaClient", () => ({
  task: {
    findMany: jest.fn().mockResolvedValue([
      {
        id: 1,
        title: "Test task",
        status: "pending",
        created_at: new Date(),
      },
    ]),
    create: jest.fn(),
    update: jest.fn(),
  },
}));
