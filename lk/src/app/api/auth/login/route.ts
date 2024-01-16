import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export async function POST(req: Request, res: Response) {
  const { userName, password } = await req.json();
  const badRequest = !userName || !password;
  const goodRequest = userName && password;
  if (badRequest) return Response.json({ status: 400 });
  if (goodRequest) {
    const isAccessible = await prisma.superuser.findFirst({
      where: {
        user_name: userName,
        password: password,
      },
    });
    if (isAccessible) {
      return Response.json({ isAccessible }, { status: 200 });
    } else {
      return Response.json({ status: 403 });
    }
  }
}
