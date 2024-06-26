import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('env')
  getEnv() {
    return process.env;
  }

  @Get('test')
  getTest() {
    return 'test message 1';
  }
}
