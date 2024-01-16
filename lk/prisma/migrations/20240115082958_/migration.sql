/*
  Warnings:

  - A unique constraint covering the columns `[type]` on the table `ItemType` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "ItemType_type_key" ON "ItemType"("type");
