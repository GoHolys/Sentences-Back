-- CreateTable
CREATE TABLE "entries" (
    "MelingoId" SERIAL NOT NULL,
    "Pos" INTEGER NOT NULL,
    "Entry" TEXT NOT NULL,

    CONSTRAINT "entries_pkey" PRIMARY KEY ("MelingoId")
);

-- CreateTable
CREATE TABLE "sentences" (
    "ID" SERIAL NOT NULL,
    "MelingoID" INTEGER,
    "Text" TEXT NOT NULL,

    CONSTRAINT "sentences_pkey" PRIMARY KEY ("ID")
);

-- CreateIndex
CREATE UNIQUE INDEX "entries_Entry_key" ON "entries"("Entry");

-- AddForeignKey
ALTER TABLE "sentences" ADD CONSTRAINT "sentences_MelingoID_fkey" FOREIGN KEY ("MelingoID") REFERENCES "entries"("MelingoId") ON DELETE SET NULL ON UPDATE CASCADE;
