/*
  Warnings:

  - You are about to drop the `ItemType` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "ItemType";

-- CreateTable
CREATE TABLE "Item_type" (
    "id" SERIAL NOT NULL,
    "type" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Item_type_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Item_type_type_key" ON "Item_type"("type");
