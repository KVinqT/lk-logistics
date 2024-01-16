import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export async function POST(req: Request, res: Response) {
  const { itemType } = await req.json();
  await prisma.item_type.create({
    data: {
      type: itemType,
    },
  });
  return new Response("Item created successfully", { status: 200 });
}

export async function GET(req: Request, res: Response) {
  const allItemTypes = await prisma.item_type.findMany();
  return Response.json({ allItemTypes });
}

export async function PUT(req: Request, res: Response) {
  const { toUpdateItemTypeId, toUpdateItemType } = await req.json();
  const updatedItemType = await prisma.item_type.update({
    where: {
      id: toUpdateItemTypeId,
    },
    data: {
      type: toUpdateItemType,
    },
  });
  return Response.json(updatedItemType);
}

export async function DELETE(req: Request, res: Response) {
  const { toDeleteItemTypeId } = await req.json();
  await prisma.item_type.delete({
    where: {
      id: toDeleteItemTypeId,
    },
  });
  return new Response("Item Type deleted successfully", { status: 200 });
}
