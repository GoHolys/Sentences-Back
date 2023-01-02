import { Module } from '@nestjs/common';
import { PrismaModule } from 'src/prisma/prisma.module';
import { EntryController } from './entry.controller';
import { EntryService } from './entry.service';

@Module({
  imports: [PrismaModule],
  controllers: [EntryController],
  providers: [EntryService],
  exports: [EntryService],
})
export class EntryModule {}
