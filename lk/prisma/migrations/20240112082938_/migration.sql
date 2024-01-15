/*
  Warnings:

  - The primary key for the `SuperUser` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `createdAt` on the `SuperUser` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `SuperUser` table. All the data in the column will be lost.
  - You are about to alter the column `password` on the `SuperUser` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `user_role` on the `SuperUser` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `password` on the `User` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to alter the column `user_role` on the `User` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.

*/
-- AlterTable
ALTER TABLE "SuperUser" DROP CONSTRAINT "SuperUser_pkey",
DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ALTER COLUMN "password" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "user_role" SET DATA TYPE VARCHAR(255),
ADD CONSTRAINT "SuperUser_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
ALTER COLUMN "password" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "user_role" SET DATA TYPE VARCHAR(255),
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");
