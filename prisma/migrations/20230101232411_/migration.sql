/*
  Warnings:

  - The primary key for the `entries` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Entry` on the `entries` table. All the data in the column will be lost.
  - You are about to drop the column `MelingoId` on the `entries` table. All the data in the column will be lost.
  - You are about to drop the column `Pos` on the `entries` table. All the data in the column will be lost.
  - The primary key for the `sentences` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ID` on the `sentences` table. All the data in the column will be lost.
  - You are about to drop the column `MelingoID` on the `sentences` table. All the data in the column will be lost.
  - You are about to drop the column `Text` on the `sentences` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[entry]` on the table `entries` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `entry` to the `entries` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pos` to the `entries` table without a default value. This is not possible if the table is not empty.
  - Added the required column `text` to the `sentences` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "sentences" DROP CONSTRAINT "sentences_MelingoID_fkey";

-- DropIndex
DROP INDEX "entries_Entry_key";

-- AlterTable
ALTER TABLE "entries" DROP CONSTRAINT "entries_pkey",
DROP COLUMN "Entry",
DROP COLUMN "MelingoId",
DROP COLUMN "Pos",
ADD COLUMN     "entry" TEXT NOT NULL,
ADD COLUMN     "melingoId" SERIAL NOT NULL,
ADD COLUMN     "pos" INTEGER NOT NULL,
ADD CONSTRAINT "entries_pkey" PRIMARY KEY ("melingoId");

-- AlterTable
ALTER TABLE "sentences" DROP CONSTRAINT "sentences_pkey",
DROP COLUMN "ID",
DROP COLUMN "MelingoID",
DROP COLUMN "Text",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "melingoID" INTEGER,
ADD COLUMN     "text" TEXT NOT NULL,
ADD CONSTRAINT "sentences_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "entries_entry_key" ON "entries"("entry");

-- AddForeignKey
ALTER TABLE "sentences" ADD CONSTRAINT "sentences_melingoID_fkey" FOREIGN KEY ("melingoID") REFERENCES "entries"("melingoId") ON DELETE SET NULL ON UPDATE CASCADE;
