import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export async function POST(req: Request, res: Response) {
  const { transportationType, branch, qty, rate } = await req.json();
  await prisma.transportation_charges.create({
    data: {
      transportation_type: transportationType,
      branch,
      qty,
      rate,
    },
  });
  return new Response("Transportation Chared created successfully", {
    status: 200,
  });
}

export async function GET(req: Request, res: Response) {
  const transportationChargesData =
    await prisma.transportation_charges.findMany();
  return Response.json({ transportationChargesData });
}

export async function PUT(req: Request, res: Response) {
  const {
    toUpdateTransportaionChargesId,
    transportationType,
    branch,
    qty,
    rate,
  } = await req.json();
  const updatedTransportationCharges =
    await prisma.transportation_charges.update({
      where: {
        id: toUpdateTransportaionChargesId,
      },
      data: {
        transportation_type: transportationType,
        branch,
        qty,
        rate,
      },
    });
  return Response.json({ updatedTransportationCharges });
}

export async function DELETE(req: Request, res: Response) {
  const { toDeleteTransportationChargesId } = await req.json();
  await prisma.transportation_charges.delete({
    where: {
      id: toDeleteTransportationChargesId,
    },
  });
  return new Response("TransportationCharges deleted successfully", {
    status: 200,
  });
}
