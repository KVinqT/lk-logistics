-- CreateTable
CREATE TABLE "Transportation_Charges" (
    "id" SERIAL NOT NULL,
    "transportation_type" TEXT NOT NULL,
    "branch" TEXT NOT NULL,
    "qty" TEXT NOT NULL,
    "rate" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Transportation_Charges_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Transportation_Charges_transportation_type_key" ON "Transportation_Charges"("transportation_type");
