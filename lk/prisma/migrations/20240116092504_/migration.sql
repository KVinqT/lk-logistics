-- CreateTable
CREATE TABLE "Customer" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "Nrc_No" TEXT NOT NULL,
    "phone_1" TEXT NOT NULL,
    "phone_2" TEXT,
    "address" TEXT NOT NULL,
    "business_name" TEXT,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Customer_Nrc_No_key" ON "Customer"("Nrc_No");

-- CreateIndex
CREATE UNIQUE INDEX "Customer_phone_1_key" ON "Customer"("phone_1");

-- CreateIndex
CREATE UNIQUE INDEX "Customer_phone_2_key" ON "Customer"("phone_2");
