import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export async function POST(req: Request, res: Response) {
  const { itemTypeId, qty, price, createdDate } = await req.json();
  await prisma.pricing.create({
    data: {
      item_type_id: itemTypeId,
      qty,
      price,
      created_date: createdDate,
    },
  });
  return new Response("Pricing created successfully", { status: 200 });
}

export async function GET(req: Request, res: Response) {
  const pricingData = await prisma.pricing.findMany({
    include: {
      item_type: true,
    },
  });
  return Response.json({ pricingData });
}

export async function PUT(req: Request, res: Response) {
  const { toUpdatePricingId, itemTypeId, qty, price, createdDate } =
    await req.json();
  await prisma.pricing.update({
    where: {
      id: toUpdatePricingId,
    },
    data: {
      item_type_id: itemTypeId,
      qty,
      price,
      created_date: createdDate,
    },
  });
  return new Response("Pricing updated successfully", { status: 200 });
}

export async function DELETE(req: Request, res: Response) {
  const { toDeletePricingId } = await req.json();
  await prisma.pricing.delete({
    where: {
      id: toDeletePricingId,
    },
  });
  return new Response("Pricing deleted successfully", { status: 200 });
}
