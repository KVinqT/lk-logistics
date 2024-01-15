export async function PUT({ params }: { params: { id: string } }) {
  const toUpdateUserId = params.id;
  console.log(toUpdateUserId);
}
