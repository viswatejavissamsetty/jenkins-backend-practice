import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  console.log(process.env);
  await app.listen(3000, '0.0.0.0');
}
bootstrap();
