/*
  Warnings:

  - You are about to drop the column `Nrc_No` on the `Customer` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[nrc_no]` on the table `Customer` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `nrc_no` to the `Customer` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Customer_Nrc_No_key";

-- AlterTable
ALTER TABLE "Customer" DROP COLUMN "Nrc_No",
ADD COLUMN     "nrc_no" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Customer_nrc_no_key" ON "Customer"("nrc_no");
