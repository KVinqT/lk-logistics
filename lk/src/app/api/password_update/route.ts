import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export async function PUT(req: Request, res: Response) {
  const { oldPassword, newPassword, confirmedPassword, superuserId } =
    await req.json();
  const superUser = await prisma.superuser.findFirst({
    where: {
      id: superuserId,
    },
  });
  const passwordInDatabase = superUser?.password;
  if (passwordInDatabase !== oldPassword) {
    return Response.json("Old password is incorrect", { status: 422 });
  }
  if (newPassword !== confirmedPassword) {
    return Response.json("New password and Confirm Password are not match", {
      status: 422,
    });
  } else {
    const changedPasswordSuperuser = await prisma.superuser.update({
      where: {
        id: superuserId,
      },
      data: {
        password: confirmedPassword,
      },
    });
    return Response.json({ changedPasswordSuperuser }, { status: 200 });
  }
}
