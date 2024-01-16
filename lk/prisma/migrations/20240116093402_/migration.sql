/*
  Warnings:

  - Added the required column `payment_type` to the `Customer` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Customer" ADD COLUMN     "payment_type" TEXT NOT NULL;
