/*
  Warnings:

  - Added the required column `updatedAt` to the `SuperUser` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "SuperUser" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "password" SET DATA TYPE TEXT,
ALTER COLUMN "user_role" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "password" SET DATA TYPE TEXT,
ALTER COLUMN "user_role" SET DATA TYPE TEXT;
