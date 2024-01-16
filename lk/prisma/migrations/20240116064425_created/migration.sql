-- CreateTable
CREATE TABLE "Other_charges" (
    "id" SERIAL NOT NULL,
    "charges_type" TEXT NOT NULL,
    "qty" TEXT NOT NULL,
    "rate" TEXT NOT NULL,

    CONSTRAINT "Other_charges_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Other_charges_charges_type_key" ON "Other_charges"("charges_type");
