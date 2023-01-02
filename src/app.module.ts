import { Module } from '@nestjs/common';
import { EntryModule } from './entry/entry.module';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [EntryModule, PrismaModule],
})
export class AppModule {}
