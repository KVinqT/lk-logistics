/*
  Warnings:

  - You are about to drop the `SuperUser` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "SuperUser";

-- CreateTable
CREATE TABLE "Superuser" (
    "id" SERIAL NOT NULL,
    "user_name" TEXT NOT NULL,
    "staff_name" TEXT,
    "password" TEXT NOT NULL,
    "user_role" TEXT NOT NULL,
    "branch" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "Superuser_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Superuser_user_name_key" ON "Superuser"("user_name");
