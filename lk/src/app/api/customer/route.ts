import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export async function POST(req: Request, res: Response) {
  const {
    name,
    type,
    nrcNo,
    phone1,
    phone2,
    address,
    businessName,
    paymentType,
  } = await req.json();
  await prisma.customer.create({
    data: {
      name,
      type,
      nrc_no: nrcNo,
      phone_1: phone1,
      phone_2: phone2 ? phone2 : null,
      address,
      business_name: businessName ? businessName : null,
      payment_type: paymentType,
    },
  });
  return new Response("Customer created successfully", { status: 200 });
}

export async function GET(req: Request, res: Response) {
  const customers = await prisma.customer.findMany();
  return Response.json({ customers });
}

export async function PUT(req: Request, res: Response) {
  const {
    toUpdateCustomerId,
    name,
    type,
    nrcNo,
    phone1,
    phone2,
    address,
    businessName,
    paymentType,
  } = await req.json();
  await prisma.customer.update({
    where: {
      id: toUpdateCustomerId,
    },
    data: {
      name,
      type,
      nrc_no: nrcNo,
      phone_1: phone1,
      phone_2: phone2 ? phone2 : null,
      address,
      business_name: businessName ? businessName : null,
      payment_type: paymentType,
    },
  });
  return new Response("Customer updated successfully", {
    status: 200,
  });
}

export async function DELETE(req: Request, res: Response) {
  const { toDeleteCustomerId } = await req.json();
  await prisma.customer.delete({
    where: { id: toDeleteCustomerId },
  });
  return new Response("Customer deleted successfully", { status: 200 });
}
