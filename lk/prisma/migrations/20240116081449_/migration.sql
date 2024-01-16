/*
  Warnings:

  - A unique constraint covering the columns `[pricing_id]` on the table `Item_type` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Item_type" ADD COLUMN     "pricing_id" INTEGER;

-- CreateTable
CREATE TABLE "Pricing" (
    "id" SERIAL NOT NULL,
    "qty" TEXT NOT NULL,
    "price" TEXT NOT NULL,
    "created_date" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Pricing_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Item_type_pricing_id_key" ON "Item_type"("pricing_id");

-- AddForeignKey
ALTER TABLE "Item_type" ADD CONSTRAINT "Item_type_pricing_id_fkey" FOREIGN KEY ("pricing_id") REFERENCES "Pricing"("id") ON DELETE SET NULL ON UPDATE CASCADE;
