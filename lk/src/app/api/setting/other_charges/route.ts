import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export async function POST(req: Request, res: Response) {
  const { chargesType, qty, rate } = await req.json();
  await prisma.other_charges.create({
    data: {
      charges_type: chargesType,
      qty,
      rate,
    },
  });
  return new Response("Other Charges created successfully", { status: 200 });
}

export async function GET(req: Request, res: Response) {
  const otherChargesData = await prisma.other_charges.findMany();
  return Response.json({ otherChargesData });
}

export async function PUT(req: Request, res: Response) {
  const { toUpdateOtherChargesId, chargesType, qty, rate } = await req.json();
  await prisma.other_charges.update({
    where: {
      id: toUpdateOtherChargesId,
    },
    data: {
      charges_type: chargesType,
      qty,
      rate,
    },
  });
  return new Response("Other Charges updated successfully", { status: 200 });
}

export async function DELETE(req: Request, res: Response) {
  const { toDeleteOtherChargesId } = await req.json();
  await prisma.other_charges.delete({
    where: {
      id: toDeleteOtherChargesId,
    },
  });
  return new Response("OtherCharges deleted successfully", { status: 200 });
}
