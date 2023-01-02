import { Body, Controller, Post } from '@nestjs/common';
import { EntryDto } from './dto/MelingoID.dto';
import { EntryService } from './entry.service';

@Controller('entry')
export class EntryController {
  constructor(private EntryService: EntryService) {}

  @Post('findEntrySentences')
  getEntryMelingoID(@Body() dto: EntryDto) {
    try {
      return this.EntryService.getEntrySentences(dto);
    } catch (error) {
      throw error;
    }
  }
}
