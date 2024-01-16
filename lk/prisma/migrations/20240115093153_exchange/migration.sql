-- CreateTable
CREATE TABLE "Exchange_rate" (
    "id" SERIAL NOT NULL,
    "date" TEXT NOT NULL,
    "rate" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Exchange_rate_pkey" PRIMARY KEY ("id")
);
