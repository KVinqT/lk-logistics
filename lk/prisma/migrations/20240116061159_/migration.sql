/*
  Warnings:

  - You are about to drop the `Transportation_Charges` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Transportation_Charges";

-- CreateTable
CREATE TABLE "Transportation_charges" (
    "id" SERIAL NOT NULL,
    "transportation_type" TEXT NOT NULL,
    "branch" TEXT NOT NULL,
    "qty" TEXT NOT NULL,
    "rate" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Transportation_charges_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Transportation_charges_transportation_type_key" ON "Transportation_charges"("transportation_type");
