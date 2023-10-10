import { StreamableFile } from '@nestjs/common';
import { AppService } from './app.service';
export declare class AppController {
    private readonly appService;
    constructor(appService: AppService);
    getfile(img: any, folder: any): StreamableFile;
}
