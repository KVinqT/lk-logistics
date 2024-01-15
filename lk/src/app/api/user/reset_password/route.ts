import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
export async function PUT(req: Request, res: Response) {
  const { toRestPasswordId } = await req.json();
  const defaultPassword = "123456";
  await prisma.user.update({
    where: {
      id: toRestPasswordId,
    },
    data: {
      password: defaultPassword,
    },
  });
  return new Response("Password reset successfully", {
    status: 200,
  });
}
