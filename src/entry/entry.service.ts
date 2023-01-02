import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { EntryDto } from './dto/MelingoID.dto';

@Injectable()
export class EntryService {
  constructor(private prisma: PrismaService) {}
  async getEntrySentences(dto: EntryDto) {
    try {
      const entry = await this.prisma.entry.findUnique({
        where: {
          entry: dto.entry,
        },
        include: {
          sentences: true,
        },
      });
      if (!entry) {
        throw new NotFoundException("Please check the term's spelling.");
      }
      return entry.sentences;
    } catch (error) {
      throw error;
    }
  }
}
