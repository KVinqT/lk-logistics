/*
  Warnings:

  - You are about to drop the column `pricing_id` on the `Item_type` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[item_type_id]` on the table `Pricing` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Item_type" DROP CONSTRAINT "Item_type_pricing_id_fkey";

-- DropIndex
DROP INDEX "Item_type_pricing_id_key";

-- AlterTable
ALTER TABLE "Item_type" DROP COLUMN "pricing_id";

-- AlterTable
ALTER TABLE "Pricing" ADD COLUMN     "item_type_id" INTEGER;

-- CreateIndex
CREATE UNIQUE INDEX "Pricing_item_type_id_key" ON "Pricing"("item_type_id");

-- AddForeignKey
ALTER TABLE "Pricing" ADD CONSTRAINT "Pricing_item_type_id_fkey" FOREIGN KEY ("item_type_id") REFERENCES "Item_type"("id") ON DELETE SET NULL ON UPDATE CASCADE;
