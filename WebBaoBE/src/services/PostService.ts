import { Post } from "@prisma/client";
import PrismaService from "./prisma";
import xlsx from 'xlsx';

const prisma = PrismaService.getInstance();

export const getAllPost = async () => {
    const posts = await prisma.post.findMany();
    return posts
}

export const readFileExcelPost = async (excelFile:string) => {
    const workbook = xlsx.readFile(excelFile);
    const sheetName = workbook.SheetNames[0];
    const sheet = workbook.Sheets[sheetName];

    // Parse the data
    const posts:Post[] = xlsx.utils.sheet_to_json(sheet, { raw: false });

    return posts
}

export const addManyPosts = async (posts:Post[]) => {
    await prisma.post.createMany({
        data: posts
    })
}