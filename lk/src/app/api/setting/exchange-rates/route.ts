import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export async function POST(req: Request, res: Response) {
  const { rate, createdDate } = await req.json();
  await prisma.exchange_rate.create({
    data: {
      date: createdDate,
      rate,
    },
  });
  return new Response("exchange rate created successfully", { status: 200 });
}

export async function GET(req: Request, res: Response) {
  const exchangeRateData = await prisma.exchange_rate.findMany();
  return Response.json(exchangeRateData);
}

export async function PUT(req: Request, res: Response) {
  const { toUpdateId, rate, updatedDate } = await req.json();
  const toUpdateData = await prisma.exchange_rate.update({
    where: {
      id: toUpdateId,
    },
    data: {
      date: updatedDate,
      rate,
    },
  });
  return Response.json({ toUpdateData }, { status: 200 });
}

export async function DELETE(req: Request, res: Response) {
  const { toDeleteId } = await req.json();
  await prisma.exchange_rate.delete({
    where: {
      id: toDeleteId,
    },
  });
  return new Response("Exchange rate deleted successfully", { status: 200 });
}
