import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export async function GET(req: Request, res: Response) {
  const allUsers = await prisma.user.findMany();
  return Response.json(allUsers);
}

export async function POST(req: Request, res: Response) {
  const userData = await req.json();
  const password = "123456";
  const { userName, staffName, userRole, branch } = userData;
  switch (userData) {
    case userData:
      await prisma.user.create({
        data: {
          user_name: userName,
          staff_name: staffName,
          password,
          user_role: userRole,
          branch,
        },
      });
      break;
  }
  return new Response("User created successfully", {
    status: 200,
  });
}

export async function PUT(req: Request, res: Response) {
  const { toUpdateUserId, userName, staffName, branch, userRole } =
    await req.json();
  const updatedUser = await prisma.user.update({
    where: {
      id: toUpdateUserId,
    },
    data: {
      user_name: userName,
      staff_name: staffName,
      user_role: userRole,
      branch,
    },
  });
  return Response.json(updatedUser);
}

export async function DELETE(req: Request, res: Response) {
  const { toDeleteUserId } = await req.json();
  await prisma.user.delete({
    where: {
      id: toDeleteUserId,
    },
  });
  return new Response("User deleted successfully", {
    status: 200,
  });
}
